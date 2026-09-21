--window function 1

WITH customer_totals AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * p.price) AS total_spend
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY o.customer_id
)
SELECT
    c.customer_name,
    ct.total_spend,
    RANK() OVER (
        ORDER BY ct.total_spend DESC
    ) AS spending_rank
FROM customer_totals ct
JOIN customers c
    ON c.customer_id = ct.customer_id;



--window function 2

    SELECT
    o.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    ROW_NUMBER() OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date
    ) AS order_number
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.customer_id, o.order_date;



--window function 3

WITH order_totals AS (
    SELECT
        o.order_id,
        o.order_date,
        SUM(oi.quantity * p.price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY o.order_id, o.order_date
)
SELECT
    order_id,
    order_date,
    order_total,
    SUM(order_total) OVER (
        ORDER BY order_date, order_id
    ) AS running_revenue
FROM order_totals
ORDER BY order_date, order_id;


--window fuction 4

SELECT
    customer_id,
    order_id,
    order_date,
    previous_order_date,
    order_date - previous_order_date AS days_between_orders
FROM (
    SELECT
        customer_id,
        order_id,
        order_date,
        LAG(order_date) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_order_date
    FROM orders
) x
WHERE previous_order_date IS NOT NULL
ORDER BY customer_id, order_date;