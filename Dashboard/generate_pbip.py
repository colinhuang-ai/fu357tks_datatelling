import json, os, uuid

base = r'd:\Training\2026-08_powerbi_thanh\Dashboard'
proj = 'BDS_Dashboard'
csv_dir = base.replace('\\', '\\\\')  # Escaped for TMDL strings

def ensure_dir(path):
    os.makedirs(path, exist_ok=True)

def write_json(filepath, data):
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

def write_text(filepath, text):
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(text)

def uid():
    return str(uuid.uuid4())

def short_id():
    return uuid.uuid4().hex[:20]

# Clean up old format files
import shutil
old_sm = os.path.join(base, f'{proj}.SemanticModel')
old_rpt = os.path.join(base, f'{proj}.Report')
for d in [old_sm, old_rpt]:
    if os.path.exists(d):
        shutil.rmtree(d)

# ================================================================
# 1. PBIP ENTRY
# ================================================================
pbip = {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/pbip/pbipProperties/1.0.0/schema.json",
    "version": "1.0",
    "artifacts": [{"report": {"path": f"{proj}.Report"}}],
    "settings": {"enableAutoRecovery": True}
}
write_json(os.path.join(base, f'{proj}.pbip'), pbip)
print(f"✓ {proj}.pbip")

# ================================================================
# 2. SEMANTIC MODEL (TMDL format)
# ================================================================
sm_dir = os.path.join(base, f'{proj}.SemanticModel')
sm_def = os.path.join(sm_dir, 'definition')
sm_tables = os.path.join(sm_def, 'tables')
sm_cultures = os.path.join(sm_def, 'cultures')
for d in [sm_dir, sm_def, sm_tables, sm_cultures]:
    ensure_dir(d)

# .platform
write_json(os.path.join(sm_dir, '.platform'), {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/gitIntegration/platformProperties/2.0.0/schema.json",
    "metadata": {"type": "SemanticModel", "displayName": proj},
    "config": {"version": "2.0", "logicalId": uid()}
})

# definition.pbism
write_json(os.path.join(sm_dir, 'definition.pbism'), {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/semanticModel/definitionProperties/1.0.0/schema.json",
    "version": "4.2",
    "settings": {}
})

# database.tmdl
write_text(os.path.join(sm_def, 'database.tmdl'), 'database\n\tcompatibilityLevel: 1606\n\n')

# Build table references for model.tmdl
table_names = ['fact_GiaoDich', 'dim_Calendar', 'dim_KeHoach', 'dim_DuAn',
               'dim_KhuVuc', 'dim_LoaiHinh', 'dim_KenhBan', 'dim_NhanVien']

model_tmdl = '''model Model
\tculture: vi-VN
\tdefaultPowerBIDataSourceVersion: powerBI_V3
\tsourceQueryCulture: vi-VN
\tdataAccessOptions
\t\tlegacyRedirects
\t\treturnErrorValuesAsNull

annotation __PBI_TimeIntelligenceEnabled = 1

annotation PBI_QueryOrder = ["fact_GiaoDich","dim_Calendar","dim_KeHoach","dim_DuAn","dim_KhuVuc","dim_LoaiHinh","dim_KenhBan","dim_NhanVien"]

'''
for t in table_names:
    model_tmdl += f'ref table {t}\n'
model_tmdl += '\nref cultureInfo vi-VN\n\n'
write_text(os.path.join(sm_def, 'model.tmdl'), model_tmdl)

# cultures/vi-VN.tmdl
write_text(os.path.join(sm_cultures, 'vi-VN.tmdl'), 'cultureInfo vi-VN\n\n')

# relationships.tmdl
rel_ids = {
    'cal': uid(), 'kh': uid(), 'kv': uid(),
    'lh': uid(), 'kb': uid(), 'nv': uid()
}
relationships_tmdl = f'''relationship {rel_ids['cal']}
\tfromColumn: fact_GiaoDich.DateOnly
\ttoColumn: dim_Calendar.Date

relationship {rel_ids['kh']}
\tfromColumn: fact_GiaoDich.'Dự án'
\ttoColumn: dim_KeHoach.'Dự án'

relationship {rel_ids['kv']}
\tfromColumn: fact_GiaoDich.'Khu vực'
\ttoColumn: dim_KhuVuc.'Khu vực'

relationship {rel_ids['lh']}
\tfromColumn: fact_GiaoDich.'Loại hình BĐS'
\ttoColumn: dim_LoaiHinh.'Loại hình BĐS'

relationship {rel_ids['kb']}
\tfromColumn: fact_GiaoDich.'Kênh bán'
\ttoColumn: dim_KenhBan.'Kênh bán'

relationship {rel_ids['nv']}
\tfromColumn: fact_GiaoDich.'Nhân viên sales'
\ttoColumn: dim_NhanVien.'Nhân viên sales'

'''
write_text(os.path.join(sm_def, 'relationships.tmdl'), relationships_tmdl)

# ================================================================
# TABLE TMDL FILES
# ================================================================
csv_path_tmdl = base.replace('\\', '\\\\')

# --- fact_GiaoDich.tmdl ---
fact_tmdl = f'''table fact_GiaoDich
\tlineageTag: {uid()}

\tcolumn 'Mã giao dịch'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Mã giao dịch

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Ngày giờ bán'
\t\tdataType: dateTime
\t\tformatString: General Date
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Ngày giờ bán

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Tháng'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Tháng
\t\tsortByColumn: 'Tháng Sort'

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Dự án'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Dự án

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Loại hình BĐS'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Loại hình BĐS

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Khu vực'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Khu vực

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Kênh bán'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Kênh bán

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Nhân viên sales'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Nhân viên sales

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Diện tích (m²)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Diện tích (m²)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Đơn giá (trđ/m²)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Đơn giá (trđ/m²)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Giá trị hợp đồng (trđ)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Giá trị hợp đồng (trđ)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Chiết khấu (%)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Chiết khấu (%)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Trạng thái'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Trạng thái

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Doanh thu ghi nhận (trđ)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Doanh thu ghi nhận (trđ)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn DateOnly
\t\tdataType: dateTime
\t\tformatString: Short Date
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: DateOnly

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Giờ bán'
\t\tdataType: int64
\t\tformatString: 0
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Giờ bán

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Số tiền CK (trđ)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Số tiền CK (trđ)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Nhóm giá trị'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Nhóm giá trị

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Doanh thu (tỷ)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Doanh thu (tỷ)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Giá trị HĐ (tỷ)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Giá trị HĐ (tỷ)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Tháng Sort'
\t\tdataType: int64
\t\tformatString: 0
\t\tlineageTag: {uid()}
\t\tisHidden
\t\tsummarizeBy: sum
\t\tsourceColumn: Tháng Sort

\t\tannotation SummarizationSetBy = Automatic

\tmeasure 'Tổng Doanh Thu' = SUM(fact_GiaoDich[Doanh thu ghi nhận (trđ)])
\t\tformatString: #,0.0
\t\tlineageTag: {uid()}

\tmeasure 'Số Giao Dịch' = COUNTROWS(fact_GiaoDich)
\t\tformatString: #,0
\t\tlineageTag: {uid()}

\tmeasure 'Số GD Hiệu Lực' = CALCULATE(COUNTROWS(fact_GiaoDich), fact_GiaoDich[Trạng thái] <> "Huỷ cọc")
\t\tformatString: #,0
\t\tlineageTag: {uid()}

\tmeasure 'Tổng Diện Tích' = SUM(fact_GiaoDich[Diện tích (m²)])
\t\tformatString: #,0.0
\t\tlineageTag: {uid()}

\tmeasure 'Tỷ Lệ Huỷ Cọc' = DIVIDE(CALCULATE(COUNTROWS(fact_GiaoDich), fact_GiaoDich[Trạng thái] = "Huỷ cọc"), COUNTROWS(fact_GiaoDich), 0)
\t\tformatString: 0.0%
\t\tlineageTag: {uid()}

\tmeasure 'Tổng Giá Trị HĐ' = SUM(fact_GiaoDich[Giá trị hợp đồng (trđ)])
\t\tformatString: #,0.0
\t\tlineageTag: {uid()}

\tmeasure 'Tỷ Lệ Huỷ' = DIVIDE(CALCULATE(COUNTROWS(fact_GiaoDich), fact_GiaoDich[Trạng thái] = "Huỷ cọc"), COUNTROWS(fact_GiaoDich), 0)
\t\tformatString: 0.0%
\t\tlineageTag: {uid()}

\tmeasure 'Doanh Thu TB/GD' = DIVIDE([Tổng Doanh Thu], [Số GD Hiệu Lực], 0)
\t\tformatString: #,0.0
\t\tlineageTag: {uid()}

\tmeasure 'Đơn Giá TB' = AVERAGE(fact_GiaoDich[Đơn giá (trđ/m²)])
\t\tformatString: #,0.0
\t\tlineageTag: {uid()}

\tmeasure 'Tổng Kế Hoạch' = SUM(dim_KeHoach[Kế hoạch 2026 (trđ)])
\t\tformatString: #,0
\t\tlineageTag: {uid()}

\tmeasure '% Hoàn Thành KH' = DIVIDE([Tổng Doanh Thu], [Tổng Kế Hoạch], 0)
\t\tformatString: 0.0%
\t\tlineageTag: {uid()}

\tmeasure 'Số GD Huỷ Cọc' = CALCULATE(COUNTROWS(fact_GiaoDich), fact_GiaoDich[Trạng thái] = "Huỷ cọc")
\t\tformatString: #,0
\t\tlineageTag: {uid()}

\tmeasure 'Số GD Ký HĐMB' = CALCULATE(COUNTROWS(fact_GiaoDich), fact_GiaoDich[Trạng thái] = "Đã ký HĐMB")
\t\tformatString: #,0
\t\tlineageTag: {uid()}

\tmeasure '% Ký HĐMB' = DIVIDE([Số GD Ký HĐMB], [Số Giao Dịch], 0)
\t\tformatString: 0.0%
\t\tlineageTag: {uid()}

\tmeasure 'Doanh Thu (tỷ)' = DIVIDE(SUM(fact_GiaoDich[Doanh thu ghi nhận (trđ)]), 1000, 0)
\t\tformatString: #,0.0
\t\tlineageTag: {uid()}

\tmeasure 'Kế Hoạch (tỷ)' = DIVIDE([Tổng Kế Hoạch], 1000, 0)
\t\tformatString: #,0.0
\t\tlineageTag: {uid()}

\tpartition fact_GiaoDich = m
\t\tmode: import
\t\tsource =
\t\t\t\tlet
\t\t\t\t  FilePath = "{csv_path_tmdl}\\\\fact_GiaoDich.csv",
\t\t\t\t  Source = Csv.Document(File.Contents(FilePath), [Delimiter = ",", Columns = 14, Encoding = 65001, QuoteStyle = QuoteStyle.None]),
\t\t\t\t  PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
\t\t\t\t  ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {{{{"Mã giao dịch", type text}}, {{"Ngày giờ bán", type datetime}}, {{"Tháng", type text}}, {{"Dự án", type text}}, {{"Loại hình BĐS", type text}}, {{"Khu vực", type text}}, {{"Kênh bán", type text}}, {{"Nhân viên sales", type text}}, {{"Diện tích (m²)", type number}}, {{"Đơn giá (trđ/m²)", type number}}, {{"Giá trị hợp đồng (trđ)", type number}}, {{"Chiết khấu (%)", type number}}, {{"Trạng thái", type text}}, {{"Doanh thu ghi nhận (trđ)", type number}}}}),
\t\t\t\t  AddDateOnly = Table.AddColumn(ChangedTypes, "DateOnly", each Date.From([Ngày giờ bán]), type date),
\t\t\t\t  AddHour = Table.AddColumn(AddDateOnly, "Giờ bán", each Time.Hour(DateTime.Time([Ngày giờ bán])), Int64.Type),
\t\t\t\t  AddDiscountAmt = Table.AddColumn(AddHour, "Số tiền CK (trđ)", each [#"Giá trị hợp đồng (trđ)"] * [#"Chiết khấu (%)"], type number),
\t\t\t\t  AddPriceGroup = Table.AddColumn(AddDiscountAmt, "Nhóm giá trị", each if [#"Giá trị hợp đồng (trđ)"] < 3000 then "< 3 tỷ" else if [#"Giá trị hợp đồng (trđ)"] < 5000 then "3-5 tỷ" else if [#"Giá trị hợp đồng (trđ)"] < 10000 then "5-10 tỷ" else if [#"Giá trị hợp đồng (trđ)"] < 20000 then "10-20 tỷ" else ">= 20 tỷ", type text),
\t\t\t\t  AddRevBillion = Table.AddColumn(AddPriceGroup, "Doanh thu (tỷ)", each [#"Doanh thu ghi nhận (trđ)"] / 1000, type number),
\t\t\t\t  AddContractBillion = Table.AddColumn(AddRevBillion, "Giá trị HĐ (tỷ)", each [#"Giá trị hợp đồng (trđ)"] / 1000, type number),
\t\t\t\t  AddMonthSort = Table.AddColumn(AddContractBillion, "Tháng Sort", each if [Tháng] = "Tháng 1" then 1 else if [Tháng] = "Tháng 2" then 2 else if [Tháng] = "Tháng 3" then 3 else if [Tháng] = "Tháng 4" then 4 else if [Tháng] = "Tháng 5" then 5 else if [Tháng] = "Tháng 6" then 6 else if [Tháng] = "Tháng 7" then 7 else if [Tháng] = "Tháng 8" then 8 else if [Tháng] = "Tháng 9" then 9 else if [Tháng] = "Tháng 10" then 10 else if [Tháng] = "Tháng 11" then 11 else 12, Int64.Type)
\t\t\t\tin
\t\t\t\t  AddMonthSort

\tannotation PBI_ResultType = Table

'''
write_text(os.path.join(sm_tables, 'fact_GiaoDich.tmdl'), fact_tmdl)

# --- dim_Calendar.tmdl ---
cal_tmdl = f'''table dim_Calendar
\tlineageTag: {uid()}

\tcolumn Date
\t\tdataType: dateTime
\t\tformatString: Long Date
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Date

\t\tannotation SummarizationSetBy = Automatic
\t\tannotation UnderlyingDateTimeDataType = Date

\tcolumn Year
\t\tdataType: int64
\t\tformatString: 0
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Year

\t\tannotation SummarizationSetBy = Automatic

\tcolumn Month
\t\tdataType: int64
\t\tformatString: 0
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Month

\t\tannotation SummarizationSetBy = Automatic

\tcolumn MonthName
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: MonthName

\t\tannotation SummarizationSetBy = Automatic

\tcolumn MonthNameVN
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: MonthNameVN

\t\tannotation SummarizationSetBy = Automatic

\tcolumn Quarter
\t\tdataType: int64
\t\tformatString: 0
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Quarter

\t\tannotation SummarizationSetBy = Automatic

\tcolumn QuarterName
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: QuarterName

\t\tannotation SummarizationSetBy = Automatic

\tcolumn DayOfWeek
\t\tdataType: int64
\t\tformatString: 0
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: DayOfWeek

\t\tannotation SummarizationSetBy = Automatic

\tcolumn DayNameVN
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: DayNameVN

\t\tannotation SummarizationSetBy = Automatic

\tcolumn WeekOfYear
\t\tdataType: int64
\t\tformatString: 0
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: WeekOfYear

\t\tannotation SummarizationSetBy = Automatic

\tcolumn IsWeekend
\t\tdataType: int64
\t\tformatString: 0
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: IsWeekend

\t\tannotation SummarizationSetBy = Automatic

\tpartition dim_Calendar = m
\t\tmode: import
\t\tsource =
\t\t\t\tlet
\t\t\t\t  Source = Csv.Document(File.Contents("{csv_path_tmdl}\\\\dim_Calendar.csv"), [Delimiter = ",", Columns = 11, Encoding = 65001, QuoteStyle = QuoteStyle.None]),
\t\t\t\t  PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
\t\t\t\t  ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {{{{"Date", type date}}, {{"Year", Int64.Type}}, {{"Month", Int64.Type}}, {{"MonthName", type text}}, {{"MonthNameVN", type text}}, {{"Quarter", Int64.Type}}, {{"QuarterName", type text}}, {{"DayOfWeek", Int64.Type}}, {{"DayNameVN", type text}}, {{"WeekOfYear", Int64.Type}}, {{"IsWeekend", Int64.Type}}}})
\t\t\t\tin
\t\t\t\t  ChangedTypes

\tannotation PBI_ResultType = Table

'''
write_text(os.path.join(sm_tables, 'dim_Calendar.tmdl'), cal_tmdl)

# --- dim_KeHoach.tmdl ---
kh_tmdl = f'''table dim_KeHoach
\tlineageTag: {uid()}

\tcolumn 'Dự án'
\t\tdataType: string
\t\tlineageTag: {uid()}
\t\tsummarizeBy: none
\t\tsourceColumn: Dự án

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Kế hoạch 2026 (trđ)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Kế hoạch 2026 (trđ)

\t\tannotation SummarizationSetBy = Automatic

\tcolumn 'Kế hoạch (tỷ)'
\t\tdataType: double
\t\tlineageTag: {uid()}
\t\tsummarizeBy: sum
\t\tsourceColumn: Kế hoạch (tỷ)

\t\tannotation SummarizationSetBy = Automatic

\tpartition dim_KeHoach = m
\t\tmode: import
\t\tsource =
\t\t\t\tlet
\t\t\t\t  Source = Csv.Document(File.Contents("{csv_path_tmdl}\\\\dim_KeHoach.csv"), [Delimiter = ",", Columns = 2, Encoding = 65001, QuoteStyle = QuoteStyle.None]),
\t\t\t\t  PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
\t\t\t\t  ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {{{{"Dự án", type text}}, {{"Kế hoạch 2026 (trđ)", type number}}}}),
\t\t\t\t  AddBillion = Table.AddColumn(ChangedTypes, "Kế hoạch (tỷ)", each [#"Kế hoạch 2026 (trđ)"] / 1000, type number)
\t\t\t\tin
\t\t\t\t  AddBillion

\tannotation PBI_ResultType = Table

'''
write_text(os.path.join(sm_tables, 'dim_KeHoach.tmdl'), kh_tmdl)

# --- Simple dim tables ---
simple_dims = [
    ("dim_DuAn", "dim_DuAn.csv", [("Dự án", "string", "none"), ("MaDuAn", "string", "none")]),
    ("dim_KhuVuc", "dim_KhuVuc.csv", [("Khu vực", "string", "none"), ("MaKhuVuc", "string", "none")]),
    ("dim_LoaiHinh", "dim_LoaiHinh.csv", [("Loại hình BĐS", "string", "none"), ("MaLoaiHinh", "string", "none")]),
    ("dim_KenhBan", "dim_KenhBan.csv", [("Kênh bán", "string", "none"), ("MaKenh", "string", "none")]),
    ("dim_NhanVien", "dim_NhanVien.csv", [("Nhân viên sales", "string", "none"), ("MaNV", "string", "none")]),
]

for tname, fname, cols in simple_dims:
    tmdl = f"table {tname}\n\tlineageTag: {uid()}\n\n"
    for cname, dtype, summ in cols:
        tmdl += f"\tcolumn '{cname}'\n"
        tmdl += f"\t\tdataType: {dtype}\n"
        tmdl += f"\t\tlineageTag: {uid()}\n"
        tmdl += f"\t\tsummarizeBy: {summ}\n"
        tmdl += f"\t\tsourceColumn: {cname}\n\n"
        tmdl += f"\t\tannotation SummarizationSetBy = Automatic\n\n"

    ncols = len(cols)
    tmdl += f"\tpartition {tname} = m\n"
    tmdl += "\t\tmode: import\n"
    tmdl += "\t\tsource =\n"
    tmdl += "\t\t\t\tlet\n"
    tmdl += f'\t\t\t\t  Source = Csv.Document(File.Contents("{csv_path_tmdl}\\\\{fname}"), [Delimiter = ",", Columns = {ncols}, Encoding = 65001, QuoteStyle = QuoteStyle.None]),\n'
    tmdl += "\t\t\t\t  PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true])\n"
    tmdl += "\t\t\t\tin\n"
    tmdl += "\t\t\t\t  PromotedHeaders\n\n"
    tmdl += "\tannotation PBI_ResultType = Table\n\n"

    write_text(os.path.join(sm_tables, f'{tname}.tmdl'), tmdl)

print(f"✓ {proj}.SemanticModel/ (TMDL format)")

# ================================================================
# 3. REPORT (PBIR v4.0 enhanced format)
# ================================================================
rpt_dir = os.path.join(base, f'{proj}.Report')
rpt_def = os.path.join(rpt_dir, 'definition')
page_id = short_id()
pages_dir = os.path.join(rpt_def, 'pages', page_id)
ensure_dir(pages_dir)

# Copy theme to StaticResources
theme_src = os.path.join(base, 'Theme_BDS.json')
theme_dest_dir = os.path.join(rpt_dir, 'StaticResources', 'SharedResources', 'BaseThemes')
ensure_dir(theme_dest_dir)
if os.path.exists(theme_src):
    shutil.copy2(theme_src, os.path.join(theme_dest_dir, 'Theme_BDS.json'))

# .platform
write_json(os.path.join(rpt_dir, '.platform'), {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/gitIntegration/platformProperties/2.0.0/schema.json",
    "metadata": {"type": "Report", "displayName": proj},
    "config": {"version": "2.0", "logicalId": uid()}
})

# definition.pbir
write_json(os.path.join(rpt_dir, 'definition.pbir'), {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definitionProperties/2.0.0/schema.json",
    "version": "4.0",
    "datasetReference": {
        "byPath": {"path": f"../{proj}.SemanticModel"}
    }
})

# definition/version.json
write_json(os.path.join(rpt_def, 'version.json'), {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/versionMetadata/1.0.0/schema.json",
    "version": "2.0.0"
})

# definition/report.json
write_json(os.path.join(rpt_def, 'report.json'), {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/report/3.3.0/schema.json",
    "themeCollection": {
        "baseTheme": {
            "name": "Theme_BDS",
            "reportVersionAtImport": {"visual": "2.12.0", "report": "3.4.0", "page": "2.3.1"},
            "type": "SharedResources"
        }
    },
    "resourcePackages": [{
        "name": "SharedResources",
        "type": "SharedResources",
        "items": [{
            "name": "Theme_BDS",
            "path": "BaseThemes/Theme_BDS.json",
            "type": "BaseTheme"
        }]
    }],
    "settings": {
        "useStylableVisualContainerHeader": True,
        "exportDataMode": "AllowSummarized",
        "defaultDrillFilterOtherVisuals": True,
        "allowChangeFilterTypes": True,
        "useEnhancedTooltips": True,
        "useDefaultAggregateDisplayName": True
    }
})

# definition/pages/pages.json
write_json(os.path.join(rpt_def, 'pages', 'pages.json'), {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/pagesMetadata/1.1.0/schema.json",
    "pageOrder": [page_id],
    "activePageName": page_id
})

# definition/pages/{page_id}/page.json
write_json(os.path.join(pages_dir, 'page.json'), {
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/page/2.1.0/schema.json",
    "name": page_id,
    "displayName": "Dashboard",
    "displayOption": "FitToPage",
    "height": 720,
    "width": 1280
})

print(f"✓ {proj}.Report/ (PBIR v4.0 enhanced format)")

# ================================================================
# DONE
# ================================================================
print(f"\n{'='*60}")
print(f"✅ PBIP project created successfully!")
print(f"📂 Open in Power BI Desktop:")
print(f"   {os.path.join(base, f'{proj}.pbip')}")
print(f"\n📊 Structure:")
print(f"   {proj}.pbip")
print(f"   {proj}.SemanticModel/")
print(f"     └── definition/ (TMDL: 8 tables, 16 measures, 6 relationships)")
print(f"   {proj}.Report/")
print(f"     └── definition/ (1 page: Dashboard)")
print(f"     └── StaticResources/ (Theme_BDS.json)")
print(f"{'='*60}")
