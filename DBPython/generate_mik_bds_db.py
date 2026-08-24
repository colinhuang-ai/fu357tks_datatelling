import sqlite3
import os
import csv
import random
from datetime import datetime, timedelta

# Path configurations
BASE_DIR = r"d:\Training\2026-08_powerbi\Db_bds"
DB_PATH = os.path.join(BASE_DIR, "mik_bds_2026.db")
SQL_SCRIPT_PATH = os.path.join(BASE_DIR, "mik_bds_2026.sql")
CSV_DIR = os.path.join(BASE_DIR, "csv")

os.makedirs(CSV_DIR, exist_ok=True)

# Random seed for reproducible synthetic data
random.seed(20260815)

def create_database():
    if os.path.exists(DB_PATH):
        os.remove(DB_PATH)

    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # Enable foreign key support
    cursor.execute("PRAGMA foreign_keys = ON;")

    # 1. Table sales_agents
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS sales_agents (
        agent_id TEXT PRIMARY KEY,
        full_name TEXT NOT NULL,
        agency_name TEXT NOT NULL,
        phone TEXT,
        email TEXT,
        position TEXT NOT NULL,
        hire_date TEXT NOT NULL,
        status TEXT NOT NULL CHECK (status IN ('Đang hoạt động', 'Tạm nghỉ'))
    );
    """)

    # 2. Table products
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS products (
        product_id TEXT PRIMARY KEY,
        project_name TEXT NOT NULL,
        block_zone TEXT NOT NULL,
        unit_code TEXT NOT NULL UNIQUE,
        property_type TEXT NOT NULL,
        net_area REAL NOT NULL,
        cost_price REAL NOT NULL,
        list_price REAL NOT NULL,
        status TEXT NOT NULL CHECK (status IN ('Đang bán', 'Sắp mở bán', 'Đã đặt cọc', 'Đã bán')),
        launch_date TEXT NOT NULL
    );
    """)

    # 3. Table sales_transactions
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS sales_transactions (
        transaction_id TEXT PRIMARY KEY,
        product_id TEXT NOT NULL UNIQUE,
        agent_id TEXT NOT NULL,
        transaction_date TEXT NOT NULL,
        contract_type TEXT NOT NULL CHECK (contract_type IN ('Văn bản thỏa thuận cọc', 'Hợp đồng mua bán')),
        gross_price REAL NOT NULL,
        discount_amount REAL NOT NULL,
        net_revenue REAL NOT NULL,
        commission_rate REAL NOT NULL,
        commission_amount REAL NOT NULL,
        payment_status TEXT NOT NULL CHECK (payment_status IN ('Đã thanh toán', 'Chờ duyệt đợt 2', 'Chờ làm HĐMB')),
        FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE RESTRICT,
        FOREIGN KEY (agent_id) REFERENCES sales_agents (agent_id) ON DELETE RESTRICT
    );
    """)

    # 4. Table sales_plan
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS sales_plan (
        plan_id TEXT PRIMARY KEY,
        period_month TEXT NOT NULL, -- Format YYYY-MM
        project_name TEXT NOT NULL,
        target_units INTEGER NOT NULL,
        target_revenue REAL NOT NULL,
        target_commission_budget REAL NOT NULL,
        notes TEXT
    );
    """)

    # Views for reporting
    cursor.execute("""
    CREATE VIEW IF NOT EXISTS v_sales_performance AS
    SELECT 
        sa.agent_id,
        sa.full_name,
        sa.agency_name,
        sa.position,
        COUNT(st.transaction_id) AS total_units_sold,
        COALESCE(SUM(st.net_revenue), 0) AS total_net_revenue,
        COALESCE(SUM(st.commission_amount), 0) AS total_commission_earned
    FROM sales_agents sa
    LEFT JOIN sales_transactions st ON sa.agent_id = st.agent_id
    GROUP BY sa.agent_id, sa.full_name, sa.agency_name, sa.position;
    """)

    cursor.execute("""
    CREATE VIEW IF NOT EXISTS v_project_summary AS
    SELECT 
        p.project_name,
        COUNT(p.product_id) AS total_products,
        SUM(CASE WHEN p.status = 'Đang bán' THEN 1 ELSE 0 END) AS units_for_sale,
        SUM(CASE WHEN p.status = 'Sắp mở bán' THEN 1 ELSE 0 END) AS units_upcoming,
        SUM(CASE WHEN p.status IN ('Đã bán', 'Đã đặt cọc') THEN 1 ELSE 0 END) AS units_sold_or_reserved,
        COALESCE(SUM(st.net_revenue), 0) AS total_revenue_realized
    FROM products p
    LEFT JOIN sales_transactions st ON p.product_id = st.product_id
    GROUP BY p.project_name;
    """)

    cursor.execute("""
    CREATE VIEW IF NOT EXISTS v_plan_vs_actual AS
    SELECT 
        sp.period_month,
        sp.project_name,
        sp.target_units,
        sp.target_revenue,
        COUNT(st.transaction_id) AS actual_units_sold,
        COALESCE(SUM(st.net_revenue), 0) AS actual_net_revenue,
        ROUND((COALESCE(SUM(st.net_revenue), 0) / sp.target_revenue) * 100, 2) AS revenue_achievement_pct
    FROM sales_plan sp
    LEFT JOIN products p ON sp.project_name = p.project_name
    LEFT JOIN sales_transactions st ON p.product_id = st.product_id 
        AND strftime('%Y-%m', st.transaction_date) = sp.period_month
    GROUP BY sp.period_month, sp.project_name;
    """)

    conn.commit()
    conn.close()
    print("Database tables & views created successfully.")

def generate_data():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    cursor.execute("PRAGMA foreign_keys = ON;")

    # Data lists
    ho = ["Nguyễn", "Trần", "Lê", "Phạm", "Hoàng", "Vũ", "Võ", "Đặng", "Bùi", "Đỗ", "Hồ", "Ngô", "Dương", "Lý"]
    dem = ["Văn", "Thị", "Hữu", "Đức", "Minh", "Quang", "Anh", "Hoàng", "Thái", "Ngọc", "Thanh", "Bảo", "Khánh", "Thu"]
    ten = ["Anh", "Tuấn", "Nam", "Hùng", "Cường", "Trinh", "Thảo", "Hà", "Linh", "Trang", "Đạt", "Phúc", "Khang", "Tâm", "Hải", "Hương", "Phương", "Duy"]

    agencies = ["MIK Direct Sales", "Đông Tây Land", "Era Vietnam", "Sunland Realty", "Khải Hoàn Land", "Mai Việt Land"]
    positions = ["Chuyên viên tư vấn", "Chuyên viên tư vấn", "Chuyên viên tư vấn cao cấp", "Trưởng nhóm kinh doanh", "Giám đốc sàn"]

    projects = [
        {"name": "Imperia Smart City", "blocks": ["Tòa Imperia Lake Z38", "Tòa Imperia Lake Z39", "Tòa Park 1", "Tòa Park 2"], "prefix": "ISC"},
        {"name": "The Matrix One Phase 2", "blocks": ["Tòa B1 Matrix Chaise", "Tòa B2 Matrix Chaise", "Phân khu Landmark"], "prefix": "TMO"},
        {"name": "Imperia Ocean Park", "blocks": ["Tòa Glow Z1", "Tòa Glow Z2", "Tòa Oasis Z3"], "prefix": "IOP"},
        {"name": "Imperia Grand Plaza Đức Hòa", "blocks": ["Phố Phồn Hoa Zone A", "Phố Thịnh Vượng Zone B", "Phố Bối Zone C"], "prefix": "IGP"}
    ]

    types_config = [
        {"type": "Căn hộ 1BR+1", "area_min": 43.0, "area_max": 48.5, "price_m2_cost": 45000000, "price_m2_list": 54000000},
        {"type": "Căn hộ 2BR-2WC", "area_min": 62.0, "area_max": 69.0, "price_m2_cost": 48000000, "price_m2_list": 58000000},
        {"type": "Căn hộ 3BR-2WC", "area_min": 78.0, "area_max": 86.0, "price_m2_cost": 50000000, "price_m2_list": 61000000},
        {"type": "Duplex", "area_min": 110.0, "area_max": 140.0, "price_m2_cost": 65000000, "price_m2_list": 80000000},
        {"type": "Penthouse", "area_min": 160.0, "area_max": 220.0, "price_m2_cost": 75000000, "price_m2_list": 95000000},
        {"type": "Shophouse Thương mại", "area_min": 100.0, "area_max": 150.0, "price_m2_cost": 90000000, "price_m2_list": 115000000},
        {"type": "Biệt thự Đơn lập", "area_min": 220.0, "area_max": 350.0, "price_m2_cost": 110000000, "price_m2_list": 140000000}
    ]

    # --- 1. Populate sales_agents (40 agents) ---
    agents_data = []
    for i in range(1, 41):
        agent_id = f"SA-{1000 + i}"
        name = f"{random.choice(ho)} {random.choice(dem)} {random.choice(ten)}"
        agency = random.choice(agencies)
        phone = f"09{random.randint(10000000, 99999999)}"
        email = f"sales.{name.lower().replace(' ', '.')}@mikgroup.vn" if agency == "MIK Direct Sales" else f"{name.lower().replace(' ', '.')}@{agency.lower().replace(' ', '')}.com"
        position = random.choice(positions)
        hire_year = random.randint(2023, 2025)
        hire_month = random.randint(1, 12)
        hire_day = random.randint(1, 28)
        hire_date = f"{hire_year}-{hire_month:02d}-{hire_day:02d}"
        status = "Đang hoạt động" if random.random() > 0.05 else "Tạm nghỉ"

        agents_data.append((agent_id, name, agency, phone, email, position, hire_date, status))

    cursor.executemany("INSERT INTO sales_agents VALUES (?, ?, ?, ?, ?, ?, ?, ?);", agents_data)

    # --- 2. Populate products (220 products: 170 active/sold/reserved, 50 upcoming) ---
    products_data = []
    prod_id_counter = 1001

    # We want ~170 products launched before Aug 2026, and ~50 launching after Aug 15 2026 (Sắp mở bán)
    for project in projects:
        proj_name = project["name"]
        prefix = project["prefix"]
        blocks = project["blocks"]

        # Generate ~42-60 products per project
        for b_idx, block in enumerate(blocks):
            for floor in range(2, 22):
                if prod_id_counter > 1220:
                    break
                
                # Each floor 2-3 units
                for unit_idx in range(1, 3):
                    product_id = f"PRD-{prod_id_counter}"
                    # Create unique unit code per block, floor, unit
                    block_tag = "".join([c for c in block if c.isalnum() or c==' ']).replace("Tòa ", "").replace("Phân khu ", "").replace("Phố ", "").replace(" ", "")
                    unit_code = f"{prefix}-{block_tag}-F{floor:02d}U{unit_idx:02d}"

                    # Determine property type
                    if "Plaza" in proj_name or "Đức Hòa" in proj_name:
                        t_cfg = random.choice([types_config[5], types_config[6]]) # Shophouse or Villa
                    elif "Matrix" in proj_name:
                        t_cfg = random.choice(types_config[1:5]) # 2BR, 3BR, Duplex, Penthouse
                    else:
                        t_cfg = random.choice(types_config[0:3]) # 1BR+, 2BR, 3BR

                    net_area = round(random.uniform(t_cfg["area_min"], t_cfg["area_max"]), 1)
                    # Add small variation to price per m2
                    cost_m2 = t_cfg["price_m2_cost"] * random.uniform(0.95, 1.05)
                    list_m2 = t_cfg["price_m2_list"] * random.uniform(0.96, 1.06)

                    cost_price = round(cost_m2 * net_area, -6) # Round to millions
                    list_price = round(list_m2 * net_area, -6)

                    if list_price <= cost_price:
                        list_price = round(cost_price * 1.18, -6)

                    # Determine status and launch_date
                    # ~22% Sắp mở bán (launching between 2026-08-20 and 2026-11-30)
                    # ~78% Active/Sold/Reserved (launching between 2025-09-01 and 2026-05-15)
                    is_upcoming = (random.random() < 0.22) or (b_idx == len(blocks) - 1 and floor > 15)

                    if is_upcoming:
                        status = "Sắp mở bán"
                        l_days = random.randint(5, 100)
                        l_date = (datetime(2026, 8, 15) + timedelta(days=l_days)).strftime("%Y-%m-%d")
                    else:
                        # Could be 'Đang bán', 'Đã đặt cọc', or 'Đã bán'
                        l_days = random.randint(90, 320)
                        l_date = (datetime(2026, 8, 15) - timedelta(days=l_days)).strftime("%Y-%m-%d")
                        
                        # We will update status to 'Đã bán' / 'Đã đặt cọc' when creating transactions
                        status = "Đang bán"

                    products_data.append((product_id, proj_name, block, unit_code, t_cfg["type"], net_area, cost_price, list_price, status, l_date))
                    prod_id_counter += 1

    cursor.executemany("INSERT INTO products VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", products_data)

    # --- 3. Populate sales_transactions (Jan 1, 2026 to Aug 15, 2026) ---
    # Select available products (status == 'Đang bán')
    cursor.execute("SELECT product_id, list_price, launch_date FROM products WHERE status = 'Đang bán';")
    available_products = cursor.fetchall()
    
    # We want ~105-120 sales transactions strictly between 2026-01-01 and 2026-08-15
    active_agents = [a[0] for a in agents_data if a[7] == "Đang hoạt động"]

    transactions_data = []
    updated_product_statuses = []

    # Start date & End date
    start_dt = datetime(2026, 1, 3)
    end_dt = datetime(2026, 8, 14)
    total_days = (end_dt - start_dt).days

    sample_size = min(115, len(available_products))
    chosen_products = random.sample(available_products, sample_size)

    for idx, prod in enumerate(chosen_products, 1):
        tx_id = f"TX-2026-{idx:04d}"
        prod_id, list_price, launch_date = prod
        
        # Transaction date must be >= launch_date and between 2026-01-01 and 2026-08-15
        l_dt = datetime.strptime(launch_date, "%Y-%m-%d")
        t_start = max(start_dt, l_dt)
        if t_start >= end_dt:
            t_dt = end_dt - timedelta(days=random.randint(0, 5))
        else:
            random_day_offset = random.randint(0, (end_dt - t_start).days)
            t_dt = t_start + timedelta(days=random_day_offset)

        tx_date_str = t_dt.strftime("%Y-%m-%d")
        agent_id = random.choice(active_agents)

        contract_type = "Hợp đồng mua bán" if t_dt < datetime(2026, 8, 1) else random.choice(["Hợp đồng mua bán", "Văn bản thỏa thuận cọc"])
        
        gross_price = list_price
        # Discount: 3% to 7%
        discount_rate = random.choice([0.03, 0.04, 0.05, 0.06, 0.07])
        discount_amount = round(gross_price * discount_rate, -5)
        net_revenue = gross_price - discount_amount

        # Commission rate: 2.5% to 4.5%
        comm_rate = random.choice([0.025, 0.030, 0.035, 0.040, 0.045])
        comm_amount = round(net_revenue * comm_rate, -4)

        if contract_type == "Hợp đồng mua bán":
            payment_status = random.choice(["Đã thanh toán", "Đã thanh toán", "Chờ duyệt đợt 2"])
            prod_status = "Đã bán"
        else:
            payment_status = "Chờ làm HĐMB"
            prod_status = "Đã đặt cọc"

        transactions_data.append((
            tx_id, prod_id, agent_id, tx_date_str, contract_type,
            gross_price, discount_amount, net_revenue, comm_rate, comm_amount, payment_status
        ))
        updated_product_statuses.append((prod_status, prod_id))

    cursor.executemany("INSERT INTO sales_transactions VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", transactions_data)

    # Update products status
    cursor.executemany("UPDATE products SET status = ? WHERE product_id = ?;", updated_product_statuses)

    # --- 4. Populate sales_plan (Months 2026-01 to 2026-08 for each project) ---
    plan_data = []
    months = [f"2026-{m:02d}" for m in range(1, 9)]

    plan_id_cnt = 1
    for m_str in months:
        for project in projects:
            p_name = project["name"]
            plan_id = f"PLN-2026-{m_str.split('-')[1]}-{project['prefix']}"
            
            # Target units: 10 to 30 per month
            if "Smart City" in p_name:
                t_units = random.randint(15, 25)
                avg_unit_price = 3_200_000_000
            elif "Matrix One" in p_name:
                t_units = random.randint(10, 18)
                avg_unit_price = 6_500_000_000
            elif "Ocean Park" in p_name:
                t_units = random.randint(12, 22)
                avg_unit_price = 3_800_000_000
            else: # Grand Plaza Đức Hòa
                t_units = random.randint(8, 15)
                avg_unit_price = 8_500_000_000

            # For Aug 2026 (up to Aug 15), target is half month
            if m_str == "2026-08":
                t_units = max(4, int(t_units * 0.5))

            t_revenue = round(t_units * avg_unit_price, -8)
            t_comm_budget = round(t_revenue * 0.035, -6)
            notes = f"Kế hoạch bán hàng tháng {m_str.split('-')[1]}/2026 - Dự án {p_name}"
            if m_str == "2026-08":
                notes += " (Số liệu chốt tới 15/08/2026)"

            plan_data.append((plan_id, m_str, p_name, t_units, t_revenue, t_comm_budget, notes))
            plan_id_cnt += 1

    cursor.executemany("INSERT INTO sales_plan VALUES (?, ?, ?, ?, ?, ?, ?);", plan_data)

    conn.commit()
    conn.close()
    print("Database populated successfully.")

def export_sql_and_csv():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # Dump SQL script
    with open(SQL_SCRIPT_PATH, 'w', encoding='utf-8') as f:
        for line in conn.iterdump():
            f.write(f'{line}\n')
    print(f"Exported SQL dump to {SQL_SCRIPT_PATH}")

    # Dump CSV files
    tables = ["sales_agents", "products", "sales_transactions", "sales_plan"]
    for table in tables:
        csv_path = os.path.join(CSV_DIR, f"{table}.csv")
        cursor.execute(f"SELECT * FROM {table};")
        rows = cursor.fetchall()
        col_names = [description[0] for description in cursor.description]

        with open(csv_path, 'w', newline='', encoding='utf-8-sig') as f:
            writer = csv.writer(f)
            writer.writerow(col_names)
            writer.writerows(rows)
        print(f"Exported CSV for {table} to {csv_path}")

    conn.close()

if __name__ == "__main__":
    create_database()
    generate_data()
    export_sql_and_csv()
