import streamlit as st
import sqlite3
import pandas as pd
import plotly.express as px
import plotly.graph_objects as gg
import os

# Page configuration
st.set_page_config(
    page_title="MIK Group - BDS KPI & Data Storytelling Dashboard 2026",
    page_icon="🏢",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Custom CSS styling for Light Executive Aesthetics
st.markdown("""
<style>
    /* Light executive theme overrides */
    .stApp {
        background-color: #F8FAFC;
        color: #1E293B;
    }
    
    /* Sidebar Styling */
    [data-testid="stSidebar"] {
        background-color: #FFFFFF;
        border-right: 1px solid #E2E8F0;
    }
    
    /* Header styling */
    .main-header {
        background: linear-gradient(135deg, #FFFFFF 0%, #F1F5F9 100%);
        padding: 24px 32px;
        border-radius: 12px;
        border-left: 6px solid #10B981;
        margin-bottom: 24px;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
        border: 1px solid #E2E8F0;
    }
    .main-title {
        color: #0F172A;
        font-size: 28px;
        font-weight: 700;
        margin: 0;
        padding-bottom: 4px;
    }
    .sub-title {
        color: #64748B;
        font-size: 15px;
        margin: 0;
    }

    /* KPI Card styling */
    .kpi-card {
        background: #FFFFFF;
        border: 1px solid #E2E8F0;
        border-radius: 10px;
        padding: 18px 20px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
        transition: transform 0.2s ease, border-color 0.2s ease, box-shadow 0.2s ease;
    }
    .kpi-card:hover {
        transform: translateY(-2px);
        border-color: #10B981;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.08);
    }
    .kpi-label {
        font-size: 13px;
        font-weight: 600;
        color: #64748B;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    .kpi-value {
        font-size: 26px;
        font-weight: 700;
        color: #0F172A;
        margin: 6px 0;
    }
    .kpi-sub {
        font-size: 12px;
        font-weight: 600;
    }
    .text-green { color: #059669; }
    .text-blue { color: #0284C7; }
    .text-orange { color: #EA580C; }
    .text-purple { color: #7C3AED; }

    /* Storytelling Banner */
    .story-banner {
        background: #F0FDF4;
        border: 1px solid #BBF7D0;
        border-radius: 10px;
        padding: 18px 24px;
        margin-bottom: 24px;
    }
    .story-title {
        color: #15803D;
        font-size: 16px;
        font-weight: 700;
        margin-bottom: 8px;
        display: flex;
        align-items: center;
        gap: 8px;
    }
    .story-text {
        color: #1E293B;
        font-size: 14px;
        line-height: 1.6;
    }
</style>
""", unsafe_allow_html=True)

# Database Connection Helper
DB_PATH = r"d:\Training\2026-08_powerbi\Db_bds\mik_bds_2026.db"

@st.cache_data(ttl=300)
def load_data():
    if not os.path.exists(DB_PATH):
        st.error(f"Không tìm thấy CSDL tại đường dẫn: {DB_PATH}")
        return None, None, None, None

    conn = sqlite3.connect(DB_PATH)

    query_tx = """
    SELECT 
        st.transaction_id,
        st.product_id,
        st.agent_id,
        st.transaction_date,
        st.contract_type,
        st.gross_price,
        st.discount_amount,
        st.net_revenue,
        st.commission_rate,
        st.commission_amount,
        st.payment_status,
        strftime('%Y-%m', st.transaction_date) AS period_month,
        p.project_name,
        p.block_zone,
        p.unit_code,
        p.property_type,
        p.net_area,
        p.cost_price,
        p.list_price,
        (st.net_revenue - p.cost_price) AS gross_profit,
        sa.full_name AS agent_name,
        sa.agency_name,
        sa.position AS agent_position
    FROM sales_transactions st
    JOIN products p ON st.product_id = p.product_id
    JOIN sales_agents sa ON st.agent_id = sa.agent_id;
    """

    df_tx = pd.read_sql_query(query_tx, conn)
    df_products = pd.read_sql_query("SELECT * FROM products;", conn)
    df_agents = pd.read_sql_query("SELECT * FROM sales_agents;", conn)
    df_plan = pd.read_sql_query("SELECT * FROM sales_plan;", conn)

    conn.close()

    df_tx['transaction_date'] = pd.to_datetime(df_tx['transaction_date'])
    return df_tx, df_products, df_agents, df_plan

df_tx, df_products, df_agents, df_plan = load_data()

if df_tx is None or df_tx.empty:
    st.stop()

# Helper formatter
def fmt_vnd(amount):
    if abs(amount) >= 1e12:
        return f"{amount / 1e12:,.2f} Nghìn Tỷ VNĐ"
    elif abs(amount) >= 1e9:
        return f"{amount / 1e9:,.2f} Tỷ VNĐ"
    elif abs(amount) >= 1e6:
        return f"{amount / 1e6:,.1f} Tr VNĐ"
    else:
        return f"{amount:,.0f} VNĐ"

# --- SIDEBAR FILTERS ---
st.sidebar.image("https://img.icons8.com/color/96/city-buildings.png", width=64)
st.sidebar.title("🔍 Bộ Lọc Đa Chiều")

# 1. Period Filter
all_months = sorted(df_tx['period_month'].unique().tolist())
selected_months = st.sidebar.multiselect(
    "🗓️ Chọn Kỳ / Tháng (2026):",
    options=all_months,
    default=all_months
)

# 2. Project Filter
all_projects = sorted(df_tx['project_name'].unique().tolist())
selected_projects = st.sidebar.multiselect(
    "🏗️ Chọn Dự Án MIK:",
    options=all_projects,
    default=all_projects
)

# 3. Agency Filter
all_agencies = sorted(df_tx['agency_name'].unique().tolist())
selected_agencies = st.sidebar.multiselect(
    "🏢 Chọn Sàn Phân Phối / Đội Ngũ:",
    options=all_agencies,
    default=all_agencies
)

# 4. Contract Filter
all_contracts = sorted(df_tx['contract_type'].unique().tolist())
selected_contracts = st.sidebar.multiselect(
    "📄 Loại Hợp Đồng:",
    options=all_contracts,
    default=all_contracts
)

# Apply Filters
filtered_tx = df_tx[
    (df_tx['period_month'].isin(selected_months)) &
    (df_tx['project_name'].isin(selected_projects)) &
    (df_tx['agency_name'].isin(selected_agencies)) &
    (df_tx['contract_type'].isin(selected_contracts))
]

filtered_plan = df_plan[
    (df_plan['period_month'].isin(selected_months)) &
    (df_plan['project_name'].isin(selected_projects))
]

# --- MAIN HEADER ---
st.markdown("""
<div class="main-header">
    <h1 class="main-title">🏢 MIK GROUP - REAL ESTATE KPI & STORYTELLING DASHBOARD</h1>
    <p class="sub-title">Báo cáo tình hình kinh doanh, doanh thu, lợi nhuận gộp & hoa hồng (01/01/2026 - 15/08/2026)</p>
</div>
""", unsafe_allow_html=True)

if filtered_tx.empty:
    st.warning("⚠️ Không có dữ liệu phù hợp với bộ lọc hiện tại. Vui lòng chọn lại bộ lọc ở thanh bên.")
    st.stop()

# --- CALCULATE METRICS ---
total_revenue = filtered_tx['net_revenue'].sum()
total_cost = filtered_tx['cost_price'].sum()
total_profit = filtered_tx['gross_profit'].sum()
profit_margin = (total_profit / total_revenue * 100) if total_revenue > 0 else 0
total_commission = filtered_tx['commission_amount'].sum()
avg_commission_rate = (total_commission / total_revenue * 100) if total_revenue > 0 else 0
units_sold = len(filtered_tx)

# Plan Target comparison
target_revenue = filtered_plan['target_revenue'].sum()
plan_achievement = (total_revenue / target_revenue * 100) if target_revenue > 0 else 0

# --- DATA STORYTELLING EXECUTIVE BANNER ---
top_project = filtered_tx.groupby('project_name')['net_revenue'].sum().idxmax()
top_project_rev = filtered_tx.groupby('project_name')['net_revenue'].sum().max()
top_agency = filtered_tx.groupby('agency_name')['net_revenue'].sum().idxmax()

# Best Month
monthly_rev_df = filtered_tx.groupby('period_month')['net_revenue'].sum()
best_month = monthly_rev_df.idxmax() if not monthly_rev_df.empty else "N/A"
best_month_rev = monthly_rev_df.max() if not monthly_rev_df.empty else 0

st.markdown(f"""
<div class="story-banner">
    <div class="story-title">📖 STORYTELLING INSIGHTS: BỨC TRANH KINH DOANH 8 THÁNG 2026</div>
    <div class="story-text">
        Trong giai đoạn từ tháng 1 đến 15/08/2026, MIK Group ghi nhận <b>{units_sold} căn hộ/BĐS</b> giao dịch thành công, đạt 
        <b style="color:#059669;">{fmt_vnd(total_revenue)}</b> doanh thu thuần và mang về 
        <b style="color:#0284C7;">{fmt_vnd(total_profit)}</b> lợi nhuận gộp (Tỷ suất lợi nhuận <b>{profit_margin:.1f}%</b>).<br/>
        • 🚀 <b>Tháng đỉnh cao kinh doanh</b>: <b style="color:#059669;">Tháng {best_month}</b> đạt doanh số ấn tượng <b>{fmt_vnd(best_month_rev)}</b>.<br/>
        • 🏗️ <b>Dự án dẫn đầu doanh số</b>: <b style="color:#EA580C;">{top_project}</b> đóng góp <b>{fmt_vnd(top_project_rev)}</b> (chiếm {top_project_rev/total_revenue*100:.1f}% tổng doanh thu).<br/>
        • 🏆 <b>Sàn bán hàng xuất sắc nhất</b>: <b>{top_agency}</b> với chuỗi chốt căn kỷ lục.<br/>
        • 💸 <b>Tổng ngân sách hoa hồng chi trả</b>: <b>{fmt_vnd(total_commission)}</b> (Tỷ lệ chi hoa hồng trung bình <b>{avg_commission_rate:.2f}%</b>).
    </div>
</div>
""", unsafe_allow_html=True)

# --- KPI CARDS ROW ---
kpi1, kpi2, kpi3, kpi4, kpi5 = st.columns(5)

with kpi1:
    st.markdown(f"""
    <div class="kpi-card">
        <div class="kpi-label">Doanh Thu Thuần</div>
        <div class="kpi-value text-green">{fmt_vnd(total_revenue)}</div>
        <div class="kpi-sub text-purple">🎯 Đạt {plan_achievement:.1f}% kế hoạch</div>
    </div>
    """, unsafe_allow_html=True)

with kpi2:
    st.markdown(f"""
    <div class="kpi-card">
        <div class="kpi-label">Lợi Nhuận Gộp</div>
        <div class="kpi-value text-blue">{fmt_vnd(total_profit)}</div>
        <div class="kpi-sub text-blue">Giá gốc CĐT: {fmt_vnd(total_cost)}</div>
    </div>
    """, unsafe_allow_html=True)

with kpi3:
    st.markdown(f"""
    <div class="kpi-card">
        <div class="kpi-label">Tỷ Suất Lợi Nhuận</div>
        <div class="kpi-value text-green">{profit_margin:.1f}%</div>
        <div class="kpi-sub text-green">Biên lợi nhuận gộp</div>
    </div>
    """, unsafe_allow_html=True)

with kpi4:
    st.markdown(f"""
    <div class="kpi-card">
        <div class="kpi-label">Chi Phí Commission</div>
        <div class="kpi-value text-orange">{fmt_vnd(total_commission)}</div>
        <div class="kpi-sub text-orange">Tỷ lệ chi HH: {avg_commission_rate:.2f}%</div>
    </div>
    """, unsafe_allow_html=True)

with kpi5:
    st.markdown(f"""
    <div class="kpi-card">
        <div class="kpi-label">Số Căn Chốt Thành Công</div>
        <div class="kpi-value text-purple">{units_sold} căn</div>
        <div class="kpi-sub text-purple">TB: {total_revenue/units_sold/1e9:.2f} Tỷ/căn</div>
    </div>
    """, unsafe_allow_html=True)

st.markdown("<br/>", unsafe_allow_html=True)

# --- SECTION 1: MONTHLY TRENDS & STORYTELLING CHARTS ---
st.subheader("📈 Xu Hướng KPI Hàng Tháng (Doanh Thu - Lợi Nhuận - Commission)")

c_chart1, c_chart2 = st.columns([1.6, 1])

# Monthly Grouping
monthly_df = filtered_tx.groupby('period_month').agg(
    net_revenue=('net_revenue', 'sum'),
    gross_profit=('gross_profit', 'sum'),
    commission=('commission_amount', 'sum'),
    units=('transaction_id', 'count')
).reset_index()

monthly_df['profit_margin'] = (monthly_df['gross_profit'] / monthly_df['net_revenue'] * 100)
monthly_df['commission_rate'] = (monthly_df['commission'] / monthly_df['net_revenue'] * 100)

with c_chart1:
    fig_combo = gg.Figure()

    # Bar: Net Revenue
    fig_combo.add_trace(gg.Bar(
        x=monthly_df['period_month'],
        y=monthly_df['net_revenue'] / 1e9,
        name="Doanh Thu Thuần (Tỷ VNĐ)",
        marker_color="#10B981",
        hovertemplate="Tháng %{x}<br>Doanh Thu: %{y:,.2f} Tỷ VNĐ<extra></extra>"
    ))

    # Bar: Gross Profit
    fig_combo.add_trace(gg.Bar(
        x=monthly_df['period_month'],
        y=monthly_df['gross_profit'] / 1e9,
        name="Lợi Nhuận Gộp (Tỷ VNĐ)",
        marker_color="#0284C7",
        hovertemplate="Tháng %{x}<br>Lợi Nhuận: %{y:,.2f} Tỷ VNĐ<extra></extra>"
    ))

    # Line: Commission
    fig_combo.add_trace(gg.Scatter(
        x=monthly_df['period_month'],
        y=monthly_df['commission'] / 1e9,
        name="Commission Chi Trả (Tỷ VNĐ)",
        mode="lines+markers+text",
        line=dict(color="#EA580C", width=3),
        marker=dict(size=8),
        yaxis="y",
        hovertemplate="Tháng %{x}<br>Commission: %{y:,.2f} Tỷ VNĐ<extra></extra>"
    ))

    fig_combo.update_layout(
        title="<b>Doanh Thu, Lợi Nhuận Gộp & Commission Chi Trả theo Tháng</b>",
        barmode="group",
        template="plotly_white",
        paper_bgcolor="#FFFFFF",
        plot_bgcolor="#FFFFFF",
        height=420,
        legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="right", x=1),
        margin=dict(l=40, r=40, t=60, b=40),
        yaxis=dict(title="Tỷ VNĐ", gridcolor="#F1F5F9")
    )
    st.plotly_chart(fig_combo, use_container_width=True)

with c_chart2:
    # Monthly Target vs Actual comparison
    monthly_plan = filtered_plan.groupby('period_month')['target_revenue'].sum().reset_index()
    merged_plan = pd.merge(monthly_plan, monthly_df[['period_month', 'net_revenue']], on='period_month', how='left').fillna(0)

    fig_plan = gg.Figure()
    fig_plan.add_trace(gg.Bar(
        x=merged_plan['period_month'],
        y=merged_plan['target_revenue'] / 1e9,
        name="Mục Tiêu Plan",
        marker_color="#CBD5E1"
    ))
    fig_plan.add_trace(gg.Bar(
        x=merged_plan['period_month'],
        y=merged_plan['net_revenue'] / 1e9,
        name="Thực Tế Đạt Được",
        marker_color="#8B5CF6"
    ))

    fig_plan.update_layout(
        title="<b>So Sánh Doanh Thu Kế Hoạch Target vs Thực Tế</b>",
        barmode="group",
        template="plotly_white",
        paper_bgcolor="#FFFFFF",
        plot_bgcolor="#FFFFFF",
        height=420,
        legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="right", x=1),
        margin=dict(l=40, r=40, t=60, b=40),
        yaxis=dict(title="Tỷ VNĐ", gridcolor="#F1F5F9")
    )
    st.plotly_chart(fig_plan, use_container_width=True)

# --- SECTION 2: MULTI-DIMENSIONAL DRILL-DOWN TABS ---
st.markdown("<br/>", unsafe_allow_html=True)
st.subheader("🎯 Phân Tích & Drill-Down Đa Chiều")

tab_sales, tab_products, tab_contracts = st.tabs([
    "👤 1. Drill-down Theo Sales & Sàn",
    "🏙️ 2. Drill-down Theo Sản Phẩm & Dự Án",
    "📑 3. Drill-down Theo Cơ Cấu Hợp Đồng"
])

# --- TAB 1: SALES & AGENCY DRILL-DOWN ---
with tab_sales:
    st.markdown("### 🏆 Hiệu Suất Kinh Doanh & Commission Theo Sàn Phân Phối")
    
    agency_summary = filtered_tx.groupby('agency_name').agg(
        total_rev=('net_revenue', 'sum'),
        total_profit=('gross_profit', 'sum'),
        total_comm=('commission_amount', 'sum'),
        units=('transaction_id', 'count')
    ).reset_index().sort_values(by='total_rev', ascending=False)

    col_ag1, col_ag2 = st.columns([1.2, 1])

    with col_ag1:
        fig_ag = px.bar(
            agency_summary,
            x='total_rev',
            y='agency_name',
            orientation='h',
            title="<b>Doanh Thu Thuần Theo Sàn Phân Phối (VNĐ)</b>",
            text_auto='.3s',
            color='total_profit',
            color_continuous_scale='Greens',
            template='plotly_white'
        )
        fig_ag.update_layout(
            paper_bgcolor="#FFFFFF",
            plot_bgcolor="#FFFFFF",
            height=380,
            yaxis=dict(autorange="reversed")
        )
        st.plotly_chart(fig_ag, use_container_width=True)

    with col_ag2:
        fig_pie_comm = px.pie(
            agency_summary,
            values='total_comm',
            names='agency_name',
            title="<b>Tỷ Lệ Phân Phối Ngân Sách Hoa Hồng (Commission)</b>",
            hole=0.4,
            color_discrete_sequence=px.colors.qualitative.Pastel,
            template='plotly_white'
        )
        fig_pie_comm.update_layout(
            paper_bgcolor="#FFFFFF",
            plot_bgcolor="#FFFFFF",
            height=380
        )
        st.plotly_chart(fig_pie_comm.update_traces(textinfo='percent+label'), use_container_width=True)

    st.markdown("---")
    st.markdown("### 🔎 Drill-Down Chi Tiết Từng Sàn $\\rightarrow$ Nhân Viên Sales")
    
    selected_agency_drill = st.selectbox(
        "👉 Chọn Sàn Phân Phối để Drill-down danh sách nhân viên:",
        options=agency_summary['agency_name'].tolist()
    )

    agents_in_agency = filtered_tx[filtered_tx['agency_name'] == selected_agency_drill].groupby(
        ['agent_id', 'agent_name', 'agent_position']
    ).agg(
        units_sold=('transaction_id', 'count'),
        total_net_rev=('net_revenue', 'sum'),
        total_profit=('gross_profit', 'sum'),
        total_comm=('commission_amount', 'sum')
    ).reset_index().sort_values(by='total_net_rev', ascending=False)

    agents_in_agency['Doanh Thu Thuần'] = agents_in_agency['total_net_rev'].apply(fmt_vnd)
    agents_in_agency['Lợi Nhuận'] = agents_in_agency['total_profit'].apply(fmt_vnd)
    agents_in_agency['Commission Thu Về'] = agents_in_agency['total_comm'].apply(fmt_vnd)

    st.dataframe(
        agents_in_agency[['agent_id', 'agent_name', 'agent_position', 'units_sold', 'Doanh Thu Thuần', 'Lợi Nhuận', 'Commission Thu Về']],
        use_container_width=True,
        hide_index=True
    )

# --- TAB 2: PRODUCT & PROJECT DRILL-DOWN ---
with tab_products:
    st.markdown("### 🏢 Phân Tích Cơ Cấu Dự Án & Phân Khúc BĐS")

    proj_summary = filtered_tx.groupby('project_name').agg(
        total_rev=('net_revenue', 'sum'),
        total_profit=('gross_profit', 'sum'),
        total_cost=('cost_price', 'sum'),
        units=('transaction_id', 'count')
    ).reset_index()

    col_pr1, col_pr2 = st.columns(2)

    with col_pr1:
        fig_proj_bar = px.bar(
            proj_summary,
            x='project_name',
            y=['total_cost', 'total_profit'],
            title="<b>Cơ Cấu Giá Gốc CĐT vs Lợi Nhuận Gộp Theo Dự Án</b>",
            labels={'value': 'VNĐ', 'variable': 'Thành Phần'},
            color_discrete_map={'total_cost': '#94A3B8', 'total_profit': '#10B981'},
            barmode='stack',
            template='plotly_white'
        )
        fig_proj_bar.update_layout(
            paper_bgcolor="#FFFFFF",
            plot_bgcolor="#FFFFFF",
            height=380
        )
        st.plotly_chart(fig_proj_bar, use_container_width=True)

    with col_pr2:
        prop_summary = filtered_tx.groupby('property_type').agg(
            total_rev=('net_revenue', 'sum'),
            units=('transaction_id', 'count')
        ).reset_index().sort_values(by='total_rev', ascending=False)

        fig_prop = px.pie(
            prop_summary,
            values='total_rev',
            names='property_type',
            title="<b>Tỷ Trọng Doanh Thu Theo Loại Hình Sản Phẩm (1BR, 2BR, Villa, Shophouse...)</b>",
            hole=0.35,
            color_discrete_sequence=px.colors.qualitative.Set3,
            template='plotly_white'
        )
        fig_prop.update_layout(
            paper_bgcolor="#FFFFFF",
            plot_bgcolor="#FFFFFF",
            height=380
        )
        st.plotly_chart(fig_prop, use_container_width=True)

    st.markdown("---")
    st.markdown("### 🔍 Scatter Drill-Down: Diện Tích ($m^2$) vs Giá Bán vs Loại Hình BĐS")

    fig_scatter = px.scatter(
        filtered_tx,
        x='net_area',
        y='net_revenue',
        color='property_type',
        size='gross_profit',
        hover_data=['unit_code', 'project_name', 'block_zone', 'agent_name'],
        title="<b>Ma Trận Sản Phẩm: Diện Tích Thông Thủy ($m^2$) vs Doanh Thu Thuần (Kích thước bóng = Lợi nhuận)</b>",
        labels={'net_area': 'Diện tích (m2)', 'net_revenue': 'Doanh Thu Thuần (VNĐ)'},
        color_discrete_sequence=px.colors.qualitative.Vivid,
        template='plotly_white'
    )
    fig_scatter.update_layout(
        paper_bgcolor="#FFFFFF",
        plot_bgcolor="#FFFFFF",
        height=450
    )
    st.plotly_chart(fig_scatter, use_container_width=True)

# --- TAB 3: CONTRACT & PAYMENT STATUS DRILL-DOWN ---
with tab_contracts:
    st.markdown("### 📑 Cơ Cấu Hợp Đồng & Tiến Độ Giải Ngân Commission")

    col_ct1, col_ct2 = st.columns(2)

    with col_ct1:
        contract_summary = filtered_tx.groupby('contract_type')['net_revenue'].sum().reset_index()
        fig_contract = px.pie(
            contract_summary,
            values='net_revenue',
            names='contract_type',
            title="<b>Tỷ Trọng Doanh Thu: Hợp Đồng Mua Bán vs Thỏa Thuận Cọc</b>",
            color_discrete_sequence=['#10B981', '#F97316'],
            template='plotly_white'
        )
        fig_contract.update_layout(
            paper_bgcolor="#FFFFFF",
            plot_bgcolor="#FFFFFF",
            height=380
        )
        st.plotly_chart(fig_contract, use_container_width=True)

    with col_ct2:
        pay_summary = filtered_tx.groupby('payment_status')['commission_amount'].sum().reset_index()
        fig_pay = px.bar(
            pay_summary,
            x='payment_status',
            y='commission_amount',
            title="<b>Trạng Thái Giải Ngân Hoa Hồng (Đã Thanh Toán / Chờ Duyệt)</b>",
            color='payment_status',
            color_discrete_sequence=['#0284C7', '#8B5CF6', '#F59E0B'],
            template='plotly_white'
        )
        fig_pay.update_layout(
            paper_bgcolor="#FFFFFF",
            plot_bgcolor="#FFFFFF",
            height=380
        )
        st.plotly_chart(fig_pay, use_container_width=True)

# --- RAW DATA EXPLORER & EXPORT ---
st.markdown("<br/>", unsafe_allow_html=True)
st.subheader("📋 Tra Cứu & Xuất Dữ Liệu Chi Tiết Giao Dịch")

with st.expander("🔍 Bấm để xem Bảng Dữ Liệu Giao Dịch Chi Tiết", expanded=False):
    st.dataframe(
        filtered_tx[[
            'transaction_id', 'transaction_date', 'project_name', 'unit_code', 
            'property_type', 'net_revenue', 'cost_price', 'gross_profit', 
            'commission_amount', 'agency_name', 'agent_name', 'payment_status'
        ]],
        use_container_width=True
    )
    
    csv_data = filtered_tx.to_csv(index=False, encoding='utf-8-sig')
    st.download_button(
        label="📥 Tải xuống dữ liệu filtered (CSV)",
        data=csv_data,
        file_name="mik_bds_filtered_transactions_2026.csv",
        mime="text/csv"
    )

st.markdown("<hr/><p style='text-align:center; color:#64748B;'>MIK Group Real Estate BI Dashboard © 2026 | Built with Python, Streamlit & Plotly</p>", unsafe_allow_html=True)
