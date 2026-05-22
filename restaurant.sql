CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    phone TEXT
);

CREATE TABLE Menu (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_name TEXT NOT NULL,
    price REAL NOT NULL
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    order_date TEXT,
    total_bill REAL,
    tip REAL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_id INTEGER,
    item_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu(item_id)
);

INSERT INTO Customers (name, phone) VALUES
('Rahul Sharma', '9876543210'),
('Priya Mehta', '9123456789'),
('Amit Verma', '9988776655'),
('Sneha Kapoor', '9090909090'),
('Rohan Singh', '9812345678');

INSERT INTO Menu (item_name, price) VALUES
('Margherita Pizza', 250),
('Veg Burger', 150),
('Pasta Alfredo', 220),
('Cold Coffee', 120),
('French Fries', 100),
('Chocolate Shake', 180),
('Paneer Sandwich', 160);

INSERT INTO Orders (customer_id, order_date, total_bill, tip) VALUES
(1, '2026-05-20', 520, 40),
(2, '2026-05-21', 380, 30),
(3, '2026-05-21', 700, 60),
(4, '2026-05-22', 450, 50),
(5, '2026-05-22', 300, 20);

INSERT INTO OrderDetails (order_id, item_id, quantity) VALUES
(1, 1, 1),  -- Pizza
(1, 4, 2),  -- Cold Coffee
(2, 2, 2),  -- Burger
(2, 5, 1),  -- Fries
(3, 1, 2),  -- Pizza
(3, 3, 1),  -- Pasta
(4, 7, 2),  -- Sandwich
(5, 6, 1);  -- Shake

SELECT * FROM ORDERS;
SELECT c.name, o.total_bill, o.tip,
       ROUND((o.tip / o.total_bill) * 100, 2) AS tip_percent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
ORDER BY tip_percent DESC;

SELECT * FROM OrderDetails;
CREATE VIEW CustomerBills AS
SELECT c.name, o.total_bill, o.tip,
       ROUND((o.tip / o.total_bill) * 100, 2) AS tip_percent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
SELECT * FROM CustomerBills ORDER BY tip_percent DESC;



