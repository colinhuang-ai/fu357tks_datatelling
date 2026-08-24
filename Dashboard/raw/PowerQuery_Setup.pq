// ============================================================
// POWER QUERY M CODE — IMPORT & TRANSFORM DATA
// ============================================================
// Hướng dẫn: 
//   1. Power BI Desktop → Home → Transform Data (Power Query Editor)
//   2. Home → Advanced Editor → Paste code tương ứng cho từng table
//   3. Sửa đường dẫn file nếu khác
// ============================================================


// ============================================================
// TABLE 1: fact_GiaoDich
// ============================================================
// Advanced Editor → Paste đoạn dưới:

let
    FilePath = "d:\Training\2026-08_powerbi_thanh\Dashboard\fact_GiaoDich.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter=",", Columns=14, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    
    // Đặt kiểu dữ liệu
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Mã giao dịch", type text},
        {"Ngày giờ bán", type datetime},
        {"Tháng", type text},
        {"Dự án", type text},
        {"Loại hình BĐS", type text},
        {"Khu vực", type text},
        {"Kênh bán", type text},
        {"Nhân viên sales", type text},
        {"Diện tích (m²)", type number},
        {"Đơn giá (trđ/m²)", type number},
        {"Giá trị hợp đồng (trđ)", type number},
        {"Chiết khấu (%)", type number},
        {"Trạng thái", type text},
        {"Doanh thu ghi nhận (trđ)", type number}
    }),
    
    // Thêm cột DateOnly để join với dim_Calendar
    AddDateOnly = Table.AddColumn(ChangedTypes, "DateOnly", each Date.From([Ngày giờ bán]), type date),
    
    // Thêm cột Giờ bán
    AddHour = Table.AddColumn(AddDateOnly, "Giờ bán", each Time.Hour(DateTime.Time([Ngày giờ bán])), Int64.Type),
    
    // Thêm cột Số tiền chiết khấu
    AddDiscountAmt = Table.AddColumn(AddHour, "Số tiền CK (trđ)", 
        each [#"Giá trị hợp đồng (trđ)"] * [#"Chiết khấu (%)"], type number),
    
    // Thêm cột Nhóm giá trị
    AddPriceGroup = Table.AddColumn(AddDiscountAmt, "Nhóm giá trị", each 
        if [#"Giá trị hợp đồng (trđ)"] < 3000 then "< 3 tỷ"
        else if [#"Giá trị hợp đồng (trđ)"] < 5000 then "3-5 tỷ"
        else if [#"Giá trị hợp đồng (trđ)"] < 10000 then "5-10 tỷ"
        else if [#"Giá trị hợp đồng (trđ)"] < 20000 then "10-20 tỷ"
        else ">= 20 tỷ",
        type text),
    
    // Thêm cột Doanh thu (tỷ)
    AddRevBillion = Table.AddColumn(AddPriceGroup, "Doanh thu (tỷ)", 
        each [#"Doanh thu ghi nhận (trđ)"] / 1000, type number),

    // Thêm cột Giá trị HĐ (tỷ)
    AddContractBillion = Table.AddColumn(AddRevBillion, "Giá trị HĐ (tỷ)", 
        each [#"Giá trị hợp đồng (trđ)"] / 1000, type number),

    // Thêm Sort Order cho Tháng
    AddMonthSort = Table.AddColumn(AddContractBillion, "Tháng Sort", each 
        if [Tháng] = "Tháng 1" then 1
        else if [Tháng] = "Tháng 2" then 2
        else if [Tháng] = "Tháng 3" then 3
        else if [Tháng] = "Tháng 4" then 4
        else if [Tháng] = "Tháng 5" then 5
        else if [Tháng] = "Tháng 6" then 6
        else if [Tháng] = "Tháng 7" then 7
        else if [Tháng] = "Tháng 8" then 8
        else if [Tháng] = "Tháng 9" then 9
        else if [Tháng] = "Tháng 10" then 10
        else if [Tháng] = "Tháng 11" then 11
        else 12,
        Int64.Type)
in
    AddMonthSort


// ============================================================
// TABLE 2: dim_Calendar
// ============================================================

let
    FilePath = "d:\Training\2026-08_powerbi_thanh\Dashboard\dim_Calendar.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Date", type date},
        {"Year", Int64.Type},
        {"Month", Int64.Type},
        {"MonthName", type text},
        {"MonthNameVN", type text},
        {"Quarter", Int64.Type},
        {"QuarterName", type text},
        {"DayOfWeek", Int64.Type},
        {"DayNameVN", type text},
        {"WeekOfYear", Int64.Type},
        {"IsWeekend", Int64.Type}
    })
in
    ChangedTypes


// ============================================================
// TABLE 3: dim_KeHoach
// ============================================================

let
    FilePath = "d:\Training\2026-08_powerbi_thanh\Dashboard\dim_KeHoach.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter=",", Columns=2, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Dự án", type text},
        {"Kế hoạch 2026 (trđ)", type number}
    }),
    // Thêm cột Kế hoạch (tỷ)
    AddBillion = Table.AddColumn(ChangedTypes, "Kế hoạch (tỷ)", 
        each [#"Kế hoạch 2026 (trđ)"] / 1000, type number)
in
    AddBillion


// ============================================================
// TABLE 4: dim_DuAn
// ============================================================

let
    FilePath = "d:\Training\2026-08_powerbi_thanh\Dashboard\dim_DuAn.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter=",", Columns=2, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Dự án", type text},
        {"MaDuAn", type text}
    })
in
    ChangedTypes


// ============================================================
// TABLE 5: dim_KhuVuc
// ============================================================

let
    FilePath = "d:\Training\2026-08_powerbi_thanh\Dashboard\dim_KhuVuc.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter=",", Columns=2, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Khu vực", type text},
        {"MaKhuVuc", type text}
    })
in
    ChangedTypes


// ============================================================
// TABLE 6: dim_LoaiHinh
// ============================================================

let
    FilePath = "d:\Training\2026-08_powerbi_thanh\Dashboard\dim_LoaiHinh.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter=",", Columns=2, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Loại hình BĐS", type text},
        {"MaLoaiHinh", type text}
    })
in
    ChangedTypes


// ============================================================
// TABLE 7: dim_KenhBan
// ============================================================

let
    FilePath = "d:\Training\2026-08_powerbi_thanh\Dashboard\dim_KenhBan.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter=",", Columns=2, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Kênh bán", type text},
        {"MaKenh", type text}
    })
in
    ChangedTypes


// ============================================================
// TABLE 8: dim_NhanVien
// ============================================================

let
    FilePath = "d:\Training\2026-08_powerbi_thanh\Dashboard\dim_NhanVien.csv",
    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter=",", Columns=2, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Nhân viên sales", type text},
        {"MaNV", type text}
    })
in
    ChangedTypes
