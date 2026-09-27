CREATE TABLE suppliers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(150) NOT NULL,
  contact VARCHAR(40) NOT NULL,
  email VARCHAR(150) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'Active'
);

CREATE TABLE medicines (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  supplier_id INTEGER,
  name VARCHAR(150) NOT NULL,
  category VARCHAR(80) NOT NULL,
  batch VARCHAR(50) NOT NULL UNIQUE,
  expiry DATE NOT NULL,
  stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
  reorder_level INTEGER NOT NULL DEFAULT 0 CHECK (reorder_level >= 0),
  purchase_price DECIMAL(10, 2) NOT NULL CHECK (purchase_price >= 0),
  selling_price DECIMAL(10, 2) NOT NULL CHECK (selling_price >= 0),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE sales (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  medicine_id INTEGER NOT NULL,
  customer VARCHAR(150) NOT NULL DEFAULT 'Walk-in customer',
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
  sold_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (medicine_id) REFERENCES medicines(id)
);

CREATE TABLE purchases (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  supplier_id INTEGER NOT NULL,
  items INTEGER NOT NULL CHECK (items > 0),
  amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
  status VARCHAR(20) NOT NULL DEFAULT 'Pending',
  ordered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

INSERT INTO suppliers (name, contact, email) VALUES
('Sehat Pharma Distributors', '+92 21 3456 7812', 'orders@sehatpharma.pk'),
('MedCare Pakistan', '+92 51 2876 4100', 'hello@medcare.pk'),
('Karachi Health Supplies', '+92 21 3890 2244', 'supply@khs.pk');
