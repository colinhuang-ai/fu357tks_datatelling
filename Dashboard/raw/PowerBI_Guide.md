# 📊 Hướng dẫn xây Dashboard Power BI — Theo mẫu Template

> [!NOTE]
> Dashboard 1 trang duy nhất: **PHÂN TÍCH HIỆU SUẤT KINH DOANH BẤT ĐỘNG SẢN 2026**

---

## Tổng quan Layout (từ template)

```
┌──────────────────────────────────────────────────────────────────┐
│  🔵 PHÂN TÍCH HIỆU SUẤT KINH DOANH BẤT ĐỘNG SẢN 2026          │  ← Header navy
├──────────────────────────────────────────────────────────────────┤
│ [Slicer: Tháng]        [Slicer: Dự án]      [Slicer: Khu vực]  │  ← Bộ lọc
├──────────────────────────────────────────────────────────────────┤
│ ┌─────────┐ ┌─────────┐ ┌──────────┐ ┌───────────┐             │
│ │TỔNG DT  │ │SỐ GIAO  │ │DIỆN TÍCH │ │TỶ LỆ HUỶ │             │  ← 4 KPI Cards
│ │ 806.5M  │ │  102    │ │ 11.6K   │ │  7.8%    │             │
│ └─────────┘ └─────────┘ └──────────┘ └───────────┘             │
├──────────────────────────────┬───────────────────────────────────┤
│  XU HƯỚNG DOANH THU         │  DT THEO PHÂN KHÚC & KÊNH BÁN    │
│  THEO THÁNG                 │                                    │
│  (Area Chart)               │  (Stacked Column Chart)            │
│                              │                                    │
├──────────────────────────────┼───────────────────────────────────┤
│  TỶ TRỌNG DOANH THU         │  BẢNG CHI TIẾT HIỆU SUẤT         │
│  THEO KÊNH BÁN              │  THEO NHÂN VIÊN & DỰ ÁN           │
│  (Donut Chart)              │  (Table with Data Bars)            │
│                              │                                    │
└──────────────────────────────┴───────────────────────────────────┘
```

---

## Bước 1: Import Data & Transform

### 1.1 Import 8 file CSV
1. **Home** → **Get Data** → **Text/CSV** → Import lần lượt:
   - `fact_GiaoDich.csv`, `dim_Calendar.csv`, `dim_KeHoach.csv`
   - `dim_DuAn.csv`, `dim_KhuVuc.csv`, `dim_LoaiHinh.csv`
   - `dim_KenhBan.csv`, `dim_NhanVien.csv`

### 1.2 Transform (Power Query)
1. **Home** → **Transform Data**
2. Chọn `fact_GiaoDich` → **Advanced Editor** → Paste code từ `PowerQuery_Setup.pq`
3. Lặp lại cho các bảng dim
4. **Close & Apply**

---

## Bước 2: Relationships (Model View)

| From (fact_GiaoDich) | → | To Table | Key |
|---|---|---|---|
| `DateOnly` | → | dim_Calendar.`Date` | Date |
| `Dự án` | → | dim_KeHoach.`Dự án` | Dự án |
| `Khu vực` | → | dim_KhuVuc.`Khu vực` | Khu vực |
| `Loại hình BĐS` | → | dim_LoaiHinh.`Loại hình BĐS` | Loại hình |
| `Kênh bán` | → | dim_KenhBan.`Kênh bán` | Kênh bán |
| `Nhân viên sales` | → | dim_NhanVien.`Nhân viên sales` | NV |

---

## Bước 3: Tạo DAX Measures

Copy-paste từ file `DAX_Measures.dax`. Các measure chính:

| Measure | Dùng cho |
|---|---|
| `Tổng Doanh Thu` | KPI Card 1, Area Chart |
| `Số Giao Dịch` | KPI Card 2, Table |
| `Tổng Diện Tích` | KPI Card 3 |
| `Tỷ Lệ Huỷ Cọc` | KPI Card 4 |
| `Tổng Giá Trị HĐ` | Table column |
| `Tỷ Lệ Huỷ` | Table column |
| `Doanh Thu TB/GD` | Tooltip |

---

## Bước 4: Import Theme

1. **View** → **Themes** → **Browse for themes** → Chọn `Theme_BDS.json`

---

## Bước 5: Xây Dashboard (1 trang)

### 5.0 Page Setup
- Page size: **16:9** (1280 × 720)
- Page background: `#F2F2F2`
- Rename tab: `Dashboard`

---

### 5.1 🔵 HEADER BAR

- **Insert** → **Text Box**
- Text: `PHÂN TÍCH HIỆU SUẤT KINH DOANH BẤT ĐỘNG SẢN 2026`
- **Position**: X=0, Y=0, **Width=1280**, **Height=45**
- **Format**:
  - Background: `#1B3A5C` (navy đậm)
  - Font: **Segoe UI Semibold**, Size **16**, Color **White**
  - Alignment: **Center**
  - Padding top: 8px

---

### 5.2 SLICERS (3 bộ lọc — hàng dưới header)

**Position chung**: Y=50, Height=55

| # | Slicer | Field | X | Width | Style |
|---|---|---|---|---|---|
| 1 | **Tháng** | `fact_GiaoDich[Tháng]` | 16 | 280 | Dropdown |
| 2 | **Dự án** | `fact_GiaoDich[Dự án]` | 320 | 350 | Dropdown |
| 3 | **Khu vực** | `fact_GiaoDich[Khu vực]` | 700 | 280 | Dropdown |

**Format mỗi Slicer:**
- Background: White
- Border: Light gray `#D9D9D9`
- Header: On, Font size 10, Bold, Color `#333333`
- Items font: Size 10

> [!TIP]
> Trong template, slicer Tháng hiện "Tháng 7", Dự án hiện "Dự án" (All), Khu vực hiện "All". Dropdown style sẽ trông giống mẫu nhất.

---

### 5.3 KPI CARDS (4 cards hàng ngang)

**Position chung**: Y=110, Height=65

| # | Title (Label) | Measure | Format | X | Width |
|---|---|---|---|---|---|
| 1 | TỔNG DOANH THU GHI NHẬN (TRĐ) | `Tổng Doanh Thu` | "#,0.0M" | 16 | 240 |
| 2 | SỐ GIAO DỊCH | `Số Giao Dịch` | "#,0" | 266 | 200 |
| 3 | DIỆN TÍCH BÁN (M2) | `Tổng Diện Tích` | "#,0.0K" | 476 | 220 |
| 4 | TỶ LỆ HUỶ CỌC | `Tỷ Lệ Huỷ Cọc` | "0.0%" | 706 | 200 |

**Cách tạo mỗi Card:**
1. **Insert** → Visual **Card**
2. Kéo measure vào **Fields**
3. **Format pane**:
   - **Callout value**: Font size **32**, Bold, Color `#1B3A5C`
   - **Category label**: Font size **8**, Color `#666666`, UPPERCASE
   - **Background**: White
   - **Border**: On, Color `#D9D9D9`, Radius 4px
   - **Shadow**: Off (template không có shadow)
   - **Title**: Off (dùng Category label làm title)

> [!IMPORTANT]
> **Display Units** trong Card:
> - Card 1 (Doanh thu): Display units = **Millions**, Decimal = 1 → hiện "806.5M"
> - Card 3 (Diện tích): Display units = **Thousands**, Decimal = 1 → hiện "11.6K"
> - Card 4 (Tỷ lệ huỷ): Format = **Percentage**, Decimal = 1 → hiện "7.8%"

---

### 5.4 📈 XU HƯỚNG DOANH THU THEO THÁNG (Area Chart — góc trái giữa)

- **Position**: X=16, Y=185, **Width=560**, **Height=230**
- **Visual type**: **Area Chart**
- **Fields**:
  - **X-axis**: `fact_GiaoDich[Tháng]`
  - **Y-axis**: `Tổng Doanh Thu`
- **Title**: `XU HƯỚNG DOANH THU THEO THÁNG`
- **Format**:
  - Title: Bold, Size 11, Color `#1B3A5C`, Alignment Left
  - Area color: `#1B3A5C` (navy gradient fill — đậm trên, nhạt dưới)
  - Line color: `#1B3A5C`
  - **Data labels**: **On**, Size 9, Position Above
    - Hiện giá trị: 177.5M, 308.3M, 336.5M, 427.5M, 507.5M, 812.5M, 806.5M
  - X-axis labels: `Tháng 7, Tháng 6, ...` (Descending — theo template, tháng 7 bên trái)
  - Y-axis: Show, Gridlines On
  - Background: White
  - Border: `#D9D9D9`

> [!WARNING]
> Trong template, trục X đi từ **Tháng 7 → Tháng 1** (mới nhất bên trái). Để làm điều này:
> - Sort trục X by `Tháng Sort` **Descending**
> - Hoặc giữ mặc định Ascending (Tháng 1 → 7) — dễ đọc hơn

---

### 5.5 📊 DOANH THU THEO PHÂN KHÚC & KÊNH BÁN (Stacked Column — góc phải giữa)

- **Position**: X=586, Y=185, **Width=520**, **Height=230**
- **Visual type**: **Stacked Column Chart**
- **Fields**:
  - **X-axis**: `fact_GiaoDich[Loại hình BĐS]`
  - **Y-axis**: `Tổng Doanh Thu`
  - **Legend**: `fact_GiaoDich[Kênh bán]`
- **Title**: `DOANH THU THEO PHÂN KHÚC & KÊNH BÁN`
- **Format**:
  - Title: Bold, Size 11
  - **Legend**: On, Position **Top**, Font 8
  - **Colors** (theo template — mỗi kênh 1 màu):
    - Căn hộ chung cư: `#4472C4` (xanh dương)
    - Sàn nội bộ: `#ED7D31` (cam)
    - Khách giới thiệu: `#A5A5A5` (xám)
    - Công tác viên: `#FFC000` (vàng)
  - **Data labels**: **On**, Size 8
  - X-axis: Category names
  - Y-axis: Show values
  - Background: White

> [!TIP]
> Trong template các phân khúc hiện: Đất nền, Biệt thự, Shophouse (từ trái sang). Sort Descending by value.

---

### 5.6 🍩 TỶ TRỌNG DOANH THU THEO KÊNH BÁN (Donut Chart — góc trái dưới)

- **Position**: X=16, Y=425, **Width=350**, **Height=265**
- **Visual type**: **Donut Chart**
- **Fields**:
  - **Legend**: `fact_GiaoDich[Kênh bán]`
  - **Values**: `Tổng Doanh Thu`
- **Title**: `TỶ TRỌNG DOANH THU THEO KÊNH BÁN`
- **Format**:
  - Title: Bold, Size 11
  - **Detail labels**: **Category name** only (hiện tên kênh quanh donut)
  - Label position: **Outside**
  - **Inner radius**: 50%
  - **Colors** (khớp template):
    - Công tác viên: `#4472C4`
    - Khách giới thiệu: `#ED7D31`
    - Sàn nội bộ: `#A5A5A5`
    - (Đối chiếu lại template cho chính xác)
  - Background: White

> [!NOTE]
> Trong template, donut hiện 5 phân loại kênh bán với tên label chạy quanh vòng tròn. Không hiện percentage, chỉ hiện tên kênh.

---

### 5.7 📋 BẢNG CHI TIẾT HIỆU SUẤT THEO NHÂN VIÊN & DỰ ÁN (Table — góc phải dưới)

- **Position**: X=376, Y=425, **Width=730**, **Height=265**
- **Visual type**: **Table**
- **Fields** (kéo theo thứ tự):

| # | Column | Source | Format |
|---|---|---|---|
| 1 | Nhân viên Sales | `fact_GiaoDich[Nhân viên sales]` | Text |
| 2 | Dự án | `fact_GiaoDich[Dự án]` | Text |
| 3 | Sản phẩm | `fact_GiaoDich[Loại hình BĐS]` | Text |
| 4 | Khu vực | `fact_GiaoDich[Khu vực]` | Text |
| 5 | Kênh bán | `fact_GiaoDich[Kênh bán]` | Text |
| 6 | Số giao dịch | `Số Giao Dịch` | #,0 |
| 7 | Giá trị hợp đồng | `Tổng Giá Trị HĐ` | "#,0M" + **Data Bars** 🟥 |
| 8 | Tỷ lệ huỷ | `Tỷ Lệ Huỷ` | "0.0%" |
| 9 | Doanh thu (trđ) | `Tổng Doanh Thu` | "#,0M" |

- **Title**: `BẢNG CHI TIẾT HIỆU SUẤT THEO NHÂN VIÊN & DỰ ÁN`

**Format bảng:**
- **Column headers**:
  - Background: `#1B3A5C` (navy)
  - Font color: **White**
  - Font: Segoe UI Semibold, Size **9**
- **Values**:
  - Font: Segoe UI, Size **9**
  - Alternating row colors: White / `#F8F8F8`
- **Grid**: Vertical + Horizontal lines, Color `#E0E0E0`
- **Totals**: Off
- **Word wrap**: Off

**Conditional Formatting — Data Bars cho cột "Giá trị hợp đồng":**
1. Click vào cột `Giá trị hợp đồng` trong Values well
2. Click dropdown ▼ → **Conditional formatting** → **Data bars**
3. **Positive bar**: Color = `#E74C3C` (đỏ cam — giống template)
4. **Show bar only**: Off (hiện cả số + bar)
5. Click **OK**

**Conditional Formatting — cột "Tỷ lệ huỷ":**
1. Click cột → **Conditional formatting** → **Background color**
2. Rules based:
   - If value > 5%: Background `#FDECEA` (đỏ nhạt)
   - If value > 8%: Background `#F5B7B1` (đỏ đậm hơn)

---

## Bước 6: Slicers bổ sung (góc phải trên — nếu cần)

Trong template, bên phải có thêm các input box:
- "Add doanh thu (trđ)" → Đây là **What-if Parameter** (tuỳ chọn)
- "Doanh số tối thiểu..." → **Numeric Range Slicer** (tuỳ chọn)
- "Từ số hợp đồng vào..." → **Text Slicer** (tuỳ chọn)

> [!TIP]
> Các input này là nâng cao. Bạn có thể bỏ qua và chỉ giữ 3 slicer chính (Tháng, Dự án, Khu vực).

---

## Bước 7: Final Polish

### 7.1 Sort by Column
- Click cột `Tháng` → **Column tools** → **Sort by Column** → `Tháng Sort`

### 7.2 Mark as Date Table
- Click `dim_Calendar` → **Table tools** → **Mark as Date Table** → `Date`

### 7.3 Interactions
- Click Area Chart → **Format** → **Edit Interactions** → Đảm bảo Table bị filter khi click

### 7.4 Tooltips
- Ở Area Chart: thêm `Số Giao Dịch`, `Doanh Thu TB/GD` vào Tooltips
- Ở Stacked Column: thêm `Số Giao Dịch` vào Tooltips
- Ở Donut: thêm `Số Giao Dịch`, `Tổng Doanh Thu` vào Tooltips

### 7.5 Alignment
- Chọn tất cả KPI Cards → **Format** → **Align** → **Align Top** + **Distribute Horizontally**
- Đảm bảo margins đều nhau: 16px từ mép

---

## ✅ Checklist cuối cùng

- [ ] 8 bảng CSV đã import
- [ ] Power Query transform đã chạy (DateOnly, Tháng Sort, ...)
- [ ] 6 relationships đã tạo
- [ ] ~15 DAX measures đã tạo
- [ ] Theme JSON đã apply
- [ ] Header navy + text trắng
- [ ] 3 Slicers: Tháng, Dự án, Khu vực
- [ ] 4 KPI Cards: Doanh thu, Số GD, Diện tích, % Huỷ
- [ ] Area Chart: Xu hướng DT theo tháng
- [ ] Stacked Column: DT theo Phân khúc & Kênh bán
- [ ] Donut: Tỷ trọng DT theo Kênh bán
- [ ] Table: Chi tiết NV & Dự án + Data Bars đỏ
- [ ] Sort by Column cho Tháng
- [ ] Cross-filtering hoạt động
- [ ] Save `.pbix`
