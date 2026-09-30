"""Trang tìm kiếm laptop: tìm theo tên, lọc theo hãng / CPU / GPU, có phân trang.

Chạy: streamlit run app_laptop_search.py
"""
import re
import sqlite3
from contextlib import closing
from math import ceil
from pathlib import Path

import pandas as pd
import streamlit as st

DB_PATH = Path(__file__).with_name("mik_bds_2026.db")
PAGE_SIZES = [10, 20, 50]

# DB được import từ Postgres nên NULL nằm trong file dưới dạng chuỗi '\N'
NULL_TOKEN = r"'\N'"

SELECT_CLAUSE = f"""SELECT l.name AS laptop,
       b.name AS brand,
       c.name AS cpu,
       g.name AS gpu,
       l.year_introduce AS year,
       CAST(NULLIF(l.screen_size, {NULL_TOKEN}) AS REAL) AS screen_size,
       CAST(NULLIF(l.battery_capacity_whr, {NULL_TOKEN}) AS REAL) AS battery_whr,
       CAST(NULLIF(l.laptop_weight, {NULL_TOKEN}) AS REAL) / 1000.0 AS weight_kg,
       l.is_gaming_laptop = 'true' AS is_gaming
"""
FROM_CLAUSE = """FROM laptop l
LEFT JOIN brand b ON b.id = l.brand_id
LEFT JOIN cpu c ON c.id = l.cpu_model_id
LEFT JOIN gpu g ON g.id = l.gpu_model_id
"""
BASE_CONDITIONS = ["l.is_active = 'true'", "l.is_visible = 'true'"]

st.set_page_config(page_title="Tìm kiếm Laptop", page_icon="💻", layout="wide")


def connect() -> sqlite3.Connection:
    return sqlite3.connect(f"{DB_PATH.as_uri()}?mode=ro", uri=True)


def build_where(search: str, brands: list, cpus: list, gpus: list) -> tuple[str, list]:
    clauses = list(BASE_CONDITIONS)
    params: list = []
    if search:
        escaped = search.replace("\\", "\\\\").replace("%", "\\%").replace("_", "\\_")
        like = f"%{escaped}%"
        clauses.append(
            f"(l.name LIKE ? ESCAPE '\\' "
            f"OR NULLIF(l.brand_model_codename, {NULL_TOKEN}) LIKE ? ESCAPE '\\')"
        )
        params += [like, like]
    for column, values in (("b.name", brands), ("c.name", cpus), ("g.name", gpus)):
        if values:
            clauses.append(f"{column} IN ({','.join('?' * len(values))})")
            params += values
    return "WHERE " + "\n  AND ".join(clauses), params


def build_select(search, brands, cpus, gpus, page, page_size) -> tuple[str, list]:
    where, params = build_where(search, brands, cpus, gpus)
    sql = (
        f"{SELECT_CLAUSE}{FROM_CLAUSE}{where}\n"
        "ORDER BY l.year_introduce DESC, l.name, l.id\n"
        "LIMIT ? OFFSET ?"
    )
    return sql, params + [page_size, (page - 1) * page_size]


def inline_params(sql: str, params: list) -> str:
    """Điền giá trị vào các dấu ? để hiển thị; chỉ dùng để đọc, không dùng để chạy."""
    values = iter(params)

    def literal(_match) -> str:
        value = next(values)
        if isinstance(value, (int, float)):
            return str(value)
        return "'" + str(value).replace("'", "''") + "'"

    return re.sub(r"\?", literal, sql)


@st.cache_data(ttl=300)
def load_filter_options() -> dict[str, list[str]]:
    """Chỉ liệt kê hãng/CPU/GPU đang có laptop, tránh chọn phải giá trị luôn ra 0 kết quả."""
    where, _ = build_where("", [], [], [])
    options = {}
    with closing(connect()) as conn:
        for key, column in (("brand", "b.name"), ("cpu", "c.name"), ("gpu", "g.name")):
            rows = conn.execute(
                f"SELECT DISTINCT {column}\n{FROM_CLAUSE}{where}\n  AND {column} IS NOT NULL\n"
                f"ORDER BY {column} COLLATE NOCASE"
            ).fetchall()
            options[key] = [r[0] for r in rows]
    return options


def count_laptops(search, brands, cpus, gpus) -> int:
    where, params = build_where(search, brands, cpus, gpus)
    with closing(connect()) as conn:
        return conn.execute(f"SELECT COUNT(*)\n{FROM_CLAUSE}{where}", params).fetchone()[0]


def fetch_laptops(search, brands, cpus, gpus, page, page_size) -> pd.DataFrame:
    sql, params = build_select(search, brands, cpus, gpus, page, page_size)
    with closing(connect()) as conn:
        df = pd.read_sql_query(sql, conn, params=params)
    df["year"] = df["year"].astype("Int64")
    df["is_gaming"] = df["is_gaming"].astype(bool)
    return df


def reset_page() -> None:
    st.session_state.page = 1


def go_to_page(page: int) -> None:
    st.session_state.page = page


def clear_filters() -> None:
    st.session_state.update(q="", brands=[], cpus=[], gpus=[], page=1)


# ---------------------------------------------------------------- UI
if not DB_PATH.exists():
    st.error(f"Không tìm thấy CSDL tại: {DB_PATH}")
    st.stop()

st.session_state.setdefault("page", 1)
options = load_filter_options()

st.title("💻 Tìm kiếm Laptop")

with st.sidebar:
    st.header("Bộ lọc")
    search = st.text_input(
        "Tên / mã model", key="q", placeholder="VD: Zenbook, ROG, UX5406", on_change=reset_page
    ).strip()
    brands = st.multiselect("Hãng", options["brand"], key="brands", on_change=reset_page)
    cpus = st.multiselect("CPU", options["cpu"], key="cpus", on_change=reset_page)
    gpus = st.multiselect("GPU", options["gpu"], key="gpus", on_change=reset_page)
    page_size = st.selectbox("Số dòng mỗi trang", PAGE_SIZES, key="page_size", on_change=reset_page)
    st.button("Xóa bộ lọc", on_click=clear_filters, width="stretch")

# Nếu số trang co lại (dữ liệu đổi) thì kéo trang hiện tại về trong khoảng hợp lệ
total = count_laptops(search, brands, cpus, gpus)
total_pages = max(1, ceil(total / page_size))
st.session_state.page = min(max(st.session_state.page, 1), total_pages)
page = st.session_state.page

if total == 0:
    st.info("Không có laptop nào khớp với bộ lọc hiện tại.")
else:
    df = fetch_laptops(search, brands, cpus, gpus, page, page_size)
    first_row = (page - 1) * page_size + 1
    df.insert(0, "stt", range(first_row, first_row + len(df)))

    st.caption(
        f"Tìm thấy **{total}** laptop · hiển thị {first_row}–{first_row + len(df) - 1} "
        f"· chỉ gồm laptop đang hoạt động"
    )

    st.dataframe(
        df,
        hide_index=True,
        width="stretch",
        height=(len(df) + 1) * 35 + 3,
        column_config={
            "stt": st.column_config.NumberColumn("#", width="small"),
            "laptop": st.column_config.TextColumn("Laptop", width="medium"),
            "brand": st.column_config.TextColumn("Hãng", width="small"),
            "cpu": st.column_config.TextColumn("CPU", width="medium"),
            "gpu": st.column_config.TextColumn("GPU", width="medium"),
            "year": st.column_config.NumberColumn("Năm", format="%d", width="small"),
            "screen_size": st.column_config.NumberColumn('Màn hình (")', format="%.1f", width="small"),
            "battery_whr": st.column_config.NumberColumn("Pin (Wh)", format="%.0f", width="small"),
            "weight_kg": st.column_config.NumberColumn("Nặng (kg)", format="%.2f", width="small"),
            "is_gaming": st.column_config.CheckboxColumn("Gaming", width="small"),
        },
    )

    first_col, prev_col, page_col, next_col, last_col, _spacer = st.columns([1, 1, 1.4, 1, 1, 5])
    first_col.button("⏮", on_click=go_to_page, args=(1,), disabled=page == 1, help="Trang đầu")
    prev_col.button("◀", on_click=go_to_page, args=(page - 1,), disabled=page == 1, help="Trang trước")
    page_col.number_input(
        "Trang", min_value=1, max_value=total_pages, key="page", disabled=total_pages == 1,
        label_visibility="collapsed",
    )
    next_col.button(
        "▶", on_click=go_to_page, args=(page + 1,), disabled=page == total_pages, help="Trang sau"
    )
    last_col.button(
        "⏭", on_click=go_to_page, args=(total_pages,), disabled=page == total_pages, help="Trang cuối"
    )
    st.caption(f"Trang {page} / {total_pages}")

st.divider()
st.subheader("Câu lệnh SQL")
sql, params = build_select(search, brands, cpus, gpus, page, page_size)
st.code(inline_params(sql, params), language="sql")
st.caption("Giá trị tham số được điền sẵn cho dễ đọc; khi chạy thật ứng dụng dùng tham số ràng buộc (`?`).")
