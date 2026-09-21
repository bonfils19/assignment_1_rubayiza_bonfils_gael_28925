
--insert into customers
INSERT INTO customers (customer_id, customer_name, email, city)
VALUES
    (1, 'Jean Kamali', 'jean@gmail.com', 'Kigali'),
    (2, 'Elodie Uwanyina', 'elodie@gmail.com', 'Huye'),
    (3, 'Eric Karemera', 'eric@gmail.com', 'Musanze'),
    (4, 'Edson Kamana', 'edson@gmail.com', 'Kigali'),
    (5, 'David Habimpamvu', 'david@gmail.com', 'Rubavu'),
    (6, 'Sarah Niyibigena', 'sarah@gmail.com', 'Kigali');

--insert into products
    INSERT INTO products (product_id, product_name, category, price)
VALUES
    (1, 'Rice 5kg', 'Groceries', 7500.00),
    (2, 'Sugar 2kg', 'Groceries', 3000.00),
    (3, 'Cooking Oil 1L', 'Groceries', 2500.00),
    (4, 'Milk 1L', 'Dairy', 1800.00),
    (5, 'Bread', 'Bakery', 1500.00),
    (6, 'Cheese 500g', 'Dairy', 6500.00),
    (7, 'Coffee 250g', 'Beverages', 4500.00),
    (8, 'Tea 100 bags', 'Beverages', 3500.00),
    (9, 'Biscuits', 'Bakery', 2000.00),
    (10, 'Flour 2kg', 'Groceries', 2200.00);

--insert into orders
    INSERT INTO orders (order_id, customer_id, order_date)
VALUES
    (1, 1, '2026-09-01'),
    (2, 2, '2026-09-02'),
    (3, 3, '2026-09-03'),
    (4, 1, '2026-09-05'),
    (5, 4, '2026-09-06'),
    (6, 2, '2026-09-08'),
    (7, 5, '2026-09-10'),
    (8, 3, '2026-09-11'),
    (9, 1, '2026-09-13'),
    (10, 4, '2026-09-14'),
    (11, 2, '2026-09-16'),
    (12, 5, '2026-09-17'),
    (13, 3, '2026-09-19'),
    (14, 1, '2026-09-20'),
    (15, 4, '2026-09-21');


--insert into order-items
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
    (1,  1,  1, 2),
    (2,  1,  5, 2),

    (3,  2,  2, 3),
    (4,  2,  4, 2),

    (5,  3,  7, 1),
    (6,  3,  8, 2),

    (7,  4,  3, 3),
    (8,  4,  9, 2),

    (9,  5,  6, 1),
    (10, 5, 4, 3),

    (11, 6, 1, 1),
    (12, 6, 10, 2),

    (13, 7, 2, 2),
    (14, 7, 5, 3),

    (15, 8, 7, 2),
    (16, 8, 9, 4),

    (17, 9, 1, 3),
    (18, 9, 3, 2),

    (19, 10, 6, 2),
    (20, 10, 8, 1),

    (21, 11, 2, 4),
    (22, 11, 10, 2),

    (23, 12, 3, 3),
    (24, 12, 4, 2),

    (25, 13, 7, 2),
    (26, 13, 5, 2),

    (27, 14, 1, 2),
    (28, 14, 6, 1),

    (29, 15, 8, 3),
    (30, 15, 9, 2);