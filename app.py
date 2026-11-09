"""
Staff Portal - simple Tkinter GUI backed by SQLite.

Files (keep them in the same folder):
    db.py   -> creates factory.db with all 13 tables + data
    app.py  -> this file (the GUI)

Run:  python app.py
The first run builds factory.db automatically using db.py.
"""
import sqlite3
import tkinter as tk
from tkinter import ttk, messagebox

import db  # our own db.py: builds factory.db

MONTHS = ["All months", "January", "February", "March", "April", "May", "June",
          "July", "August", "September", "October", "November", "December"]

PASS_FAIL = "CASE {c} WHEN 1 THEN 'Pass' ELSE 'FAIL' END"

# ---------------------------------------------------------------------------
# Each record category: SQL (without WHERE), the date column used for the
# year/month filter, and (optionally) a clause to show only "my" records.
# ---------------------------------------------------------------------------
CATEGORIES = {
    "Maintenance Records": dict(
        sql="""SELECT m.RecordID AS ID, m.CreatedDate AS Date,
                      mc.MachineryName AS Machine, m.RecordType AS Type,
                      s.EngineerName AS Staff, m.DamagePercentage AS 'Damage %'
               FROM MaintenanceRecord m
               JOIN Machinery mc ON m.MachineryID = mc.MachineryID
               JOIN Staff s ON m.StaffID = s.StaffID""",
        date="m.CreatedDate", mine="m.StaffID = ?"),
    "Purchase Orders": dict(
        sql="""SELECT p.OrderID AS ID, p.OrderDate AS Date,
                      sup.SupplierName AS Supplier,
                      r.EngineerName AS 'Requested By',
                      a.EngineerName AS 'Approved By',
                      p.ExpectedDeliveryDate AS Expected, p.Status
               FROM PurchaseOrder p
               JOIN Supplier sup ON p.SupplierID = sup.SupplierID
               JOIN Staff r ON p.RequestBy = r.StaffID
               JOIN Staff a ON p.ApprovedBy = a.StaffID""",
        date="p.OrderDate", mine="(p.RequestBy = ? OR p.ApprovedBy = ?)"),
    "Deliveries": dict(
        sql="""SELECT d.DeliveryID AS ID, d.ReceivedDate AS Date,
                      d.OrderID AS 'Order', s.EngineerName AS 'Received By',
                      d.Remarks
               FROM Delivery d
               LEFT JOIN Staff s ON d.ReceivedBy = s.StaffID""",
        date="d.ReceivedDate", mine="d.ReceivedBy = ?"),
    "Initial Checks": dict(
        sql="""SELECT i.InitialCheckID AS ID, i.RecordDate AS Date,
                      mc.MachineryName AS Machine,
                      """ + PASS_FAIL.format(c="st.Status") + """ AS Stress,
                      """ + PASS_FAIL.format(c="q.Status") + """ AS Quality,
                      """ + PASS_FAIL.format(c="l.Status") + """ AS Laser
               FROM Initial_check i
               JOIN Machinery mc ON i.MachineryID = mc.MachineryID
               LEFT JOIN Stress_test st ON i.StressID = st.StressID
               LEFT JOIN Quality_control q ON i.QualityID = q.QualityID
               LEFT JOIN Laser_scans l ON i.LaserID = l.LaserID""",
        date="i.RecordDate", mine=None),
    "Stress Tests": dict(
        sql="SELECT StressID AS ID, StressDate AS Date, Description, "
            + PASS_FAIL.format(c="Status") + " AS Result FROM Stress_test",
        date="StressDate", mine=None),
    "Quality Control": dict(
        sql="SELECT QualityID AS ID, QualityDate AS Date, Description, "
            + PASS_FAIL.format(c="Status") + " AS Result FROM Quality_control",
        date="QualityDate", mine=None),
    "Laser Scans": dict(
        sql="SELECT LaserID AS ID, LaserDate AS Date, Description, "
            + PASS_FAIL.format(c="Status") + " AS Result FROM Laser_scans",
        date="LaserDate", mine=None),
    "Materials": dict(
        sql="""SELECT m.MaterialID AS ID, m.MaterialDate AS Date,
                      m.MaterialName AS Material, s.SupplierName AS Supplier,
                      m.Composition AS 'Composition %', m.Stock
               FROM Material m
               JOIN Supplier s ON m.SupplierID = s.SupplierID""",
        date="m.MaterialDate", mine=None),
}


# ---------------------------------------------------------------------------
# Database helpers (tables are built in db.py)
# ---------------------------------------------------------------------------
def query(sql, params=()):
    """Run a SELECT and return (column_names, rows)."""
    conn = sqlite3.connect(db.DB_PATH)
    try:
        cur = conn.execute(sql, params)
        cols = [d[0] for d in cur.description]
        return cols, cur.fetchall()
    finally:
        conn.close()


def get_staff():
    return query("SELECT StaffID, EngineerName, Role FROM Staff ORDER BY EngineerName")[1]


def get_colleagues(staff_id):
    """SELF JOIN: other staff who share the same Role as staff_id."""
    return query(
        """SELECT b.StaffID, b.EngineerName, b.Role
           FROM Staff a
           JOIN Staff b ON a.Role = b.Role AND a.StaffID <> b.StaffID
           WHERE a.StaffID = ?
           ORDER BY b.EngineerName""", (staff_id,))[1]


def get_years():
    """All years that appear in any record table."""
    sql = """
        SELECT DISTINCT y FROM (
            SELECT strftime('%Y', CreatedDate) y FROM MaintenanceRecord UNION
            SELECT strftime('%Y', OrderDate) FROM PurchaseOrder UNION
            SELECT strftime('%Y', ReceivedDate) FROM Delivery UNION
            SELECT strftime('%Y', RecordDate) FROM Initial_check UNION
            SELECT strftime('%Y', StressDate) FROM Stress_test UNION
            SELECT strftime('%Y', QualityDate) FROM Quality_control UNION
            SELECT strftime('%Y', LaserDate) FROM Laser_scans UNION
            SELECT strftime('%Y', MaterialDate) FROM Material
        ) WHERE y IS NOT NULL ORDER BY y"""
    return [r[0] for r in query(sql)[1]]


def get_records(category, year, month, staff_id=None):
    """
    category : key of CATEGORIES
    year     : '2026' or '' for all years
    month    : 0 = all months, 1-12 = specific month
    staff_id : if given (and the category supports it) only that staff's records
    """
    cfg = CATEGORIES[category]
    where, params = [], []
    if year:
        where.append(f"strftime('%Y', {cfg['date']}) = ?")
        params.append(year)
    if month:
        where.append(f"strftime('%m', {cfg['date']}) = ?")
        params.append(f"{month:02d}")
    if staff_id is not None and cfg["mine"]:
        where.append(cfg["mine"])
        params.extend([staff_id] * cfg["mine"].count("?"))
    sql = cfg["sql"]
    if where:
        sql += " WHERE " + " AND ".join(where)
    sql += f" ORDER BY {cfg['date']}"
    return query(sql, params)


# ---------------------------------------------------------------------------
# GUI
# ---------------------------------------------------------------------------
def make_tree(parent, columns, rows, height=15):
    """Create a Treeview with a scrollbar and fill it."""
    frame = ttk.Frame(parent)
    tree = ttk.Treeview(frame, columns=columns, show="headings", height=height)
    ysb = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
    xsb = ttk.Scrollbar(frame, orient="horizontal", command=tree.xview)
    tree.configure(yscrollcommand=ysb.set, xscrollcommand=xsb.set)
    for c in columns:
        tree.heading(c, text=c)
        tree.column(c, width=110, minwidth=50, anchor="w")
    for r in rows:
        tree.insert("", "end", values=["" if v is None else v for v in r])
    tree.grid(row=0, column=0, sticky="nsew")
    ysb.grid(row=0, column=1, sticky="ns")
    xsb.grid(row=1, column=0, sticky="ew")
    frame.rowconfigure(0, weight=1)
    frame.columnconfigure(0, weight=1)
    return frame, tree


class App(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Staff Portal")
        self.geometry("980x620")
        self.minsize(800, 500)
        self.staff = None  # (StaffID, Name, Role) once logged in
        self.show_login()

    def clear(self):
        for w in self.winfo_children():
            w.destroy()

    # ---------------- login screen ----------------
    def show_login(self):
        self.clear()
        self.staff = None
        box = ttk.Frame(self, padding=20)
        box.pack(fill="both", expand=True)
        ttk.Label(box, text="Staff Portal", font=("Segoe UI", 20, "bold")).pack()
        ttk.Label(box, text="Click your name to start").pack(pady=(0, 10))

        frame, tree = make_tree(box, ("ID", "Name", "Role"),
                                get_staff(), height=14)
        tree.column("ID", width=50, stretch=False)
        tree.column("Name", width=250)
        tree.column("Role", width=200)
        frame.pack(fill="both", expand=True)

        def enter(_event=None):
            sel = tree.selection()
            if not sel:
                messagebox.showinfo("Select a name", "Please click your name first.")
                return
            sid, name, role = tree.item(sel[0], "values")
            self.staff = (int(sid), name, role)
            self.show_main()

        tree.bind("<Double-1>", enter)
        ttk.Button(box, text="Continue", command=enter).pack(pady=10)

    # ---------------- main screen ----------------
    def show_main(self):
        self.clear()
        sid, name, role = self.staff

        top = ttk.Frame(self, padding=(10, 8))
        top.pack(fill="x")
        ttk.Label(top, text=f"Logged in as: {name}  ({role})",
                  font=("Segoe UI", 12, "bold")).pack(side="left")
        ttk.Button(top, text="Switch user", command=self.show_login).pack(side="right")

        nb = ttk.Notebook(self)
        nb.pack(fill="both", expand=True, padx=10, pady=(0, 10))
        self.build_staff_tab(nb)
        self.build_records_tab(nb)

    # ---------------- tab 1: staff directory (self join) ----------------
    def build_staff_tab(self, nb):
        sid, name, role = self.staff
        tab = ttk.Frame(nb, padding=10)
        nb.add(tab, text="Staff Directory")

        ttk.Label(tab, text="All staff (click one to see colleagues with the same role)"
                  ).pack(anchor="w")
        frame, tree = make_tree(tab, ("ID", "Name", "Role"), get_staff(), height=9)
        tree.column("ID", width=50, stretch=False)
        tree.column("Name", width=250)
        tree.column("Role", width=200)
        frame.pack(fill="both", expand=True)

        info = ttk.Label(tab, font=("Segoe UI", 10, "bold"))
        info.pack(anchor="w", pady=(10, 2))
        cframe = ttk.Frame(tab)
        cframe.pack(fill="both", expand=True)

        def show_colleagues(staff_id, staff_name):
            for w in cframe.winfo_children():
                w.destroy()
            rows = get_colleagues(staff_id)
            info.config(text=f"Colleagues of {staff_name} (same role) - {len(rows)} found")
            f, t = make_tree(cframe, ("ID", "Name", "Role"), rows, height=5)
            t.column("ID", width=50, stretch=False)
            t.column("Name", width=250)
            t.column("Role", width=200)
            f.pack(fill="both", expand=True)

        def on_select(_e):
            sel = tree.selection()
            if sel:
                v = tree.item(sel[0], "values")
                show_colleagues(int(v[0]), v[1])

        tree.bind("<<TreeviewSelect>>", on_select)
        show_colleagues(sid, name)  # default: the logged-in user

    # ---------------- tab 2: records by year / month ----------------
    def build_records_tab(self, nb):
        sid, _, _ = self.staff
        tab = ttk.Frame(nb, padding=10)
        nb.add(tab, text="Records")

        bar = ttk.Frame(tab)
        bar.pack(fill="x", pady=(0, 8))

        ttk.Label(bar, text="Record type:").grid(row=0, column=0, padx=(0, 4))
        cat_var = tk.StringVar(value=list(CATEGORIES)[0])
        ttk.Combobox(bar, textvariable=cat_var, values=list(CATEGORIES),
                     state="readonly", width=20).grid(row=0, column=1, padx=(0, 12))

        ttk.Label(bar, text="Year:").grid(row=0, column=2, padx=(0, 4))
        years = get_years()
        year_var = tk.StringVar(value=years[-1] if years else "")
        ttk.Combobox(bar, textvariable=year_var, values=["All years"] + years,
                     state="readonly", width=10).grid(row=0, column=3, padx=(0, 12))

        ttk.Label(bar, text="Month:").grid(row=0, column=4, padx=(0, 4))
        month_var = tk.StringVar(value=MONTHS[0])
        ttk.Combobox(bar, textvariable=month_var, values=MONTHS,
                     state="readonly", width=12).grid(row=0, column=5, padx=(0, 12))

        mine_var = tk.BooleanVar(value=False)
        mine_chk = ttk.Checkbutton(bar, text="Only my records", variable=mine_var)
        mine_chk.grid(row=0, column=6, padx=(0, 12))

        status = ttk.Label(tab, font=("Segoe UI", 10, "bold"))
        holder = ttk.Frame(tab)

        def refresh(*_):
            cat = cat_var.get()
            year = "" if year_var.get() == "All years" else year_var.get()
            month = MONTHS.index(month_var.get())

            can_filter_mine = CATEGORIES[cat]["mine"] is not None
            mine_chk.state(["!disabled"] if can_filter_mine else ["disabled"])
            if not can_filter_mine:
                mine_var.set(False)

            cols, rows = get_records(cat, year, month,
                                     sid if mine_var.get() else None)
            for w in holder.winfo_children():
                w.destroy()
            f, t = make_tree(holder, cols, rows, height=15)
            # make long text columns wider
            for c in cols:
                if c in ("Description", "Remarks", "Supplier"):
                    t.column(c, width=330)
            f.pack(fill="both", expand=True)

            when = " ".join(x for x in [
                month_var.get() if month else "", year or "(all years)"] if x)
            status.config(text=f"{cat}: {len(rows)} record(s) for {when}"
                          + ("  [mine only]" if mine_var.get() else ""))

        for var in (cat_var, year_var, month_var, mine_var):
            var.trace_add("write", refresh)

        status.pack(anchor="w")
        holder.pack(fill="both", expand=True)
        refresh()


if __name__ == "__main__":
    try:
        db.init_db()
    except Exception as e:
        # show a friendly error instead of a crash
        root = tk.Tk()
        root.withdraw()
        messagebox.showerror("Database error", str(e))
        raise SystemExit(1)
    App().mainloop()
