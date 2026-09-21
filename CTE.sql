SELECT
    o.customer_id,
    oi.quantity * p.price AS item_total
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;



    SELECT
    o.customer_id,
    SUM(oi.quantity * p.price) AS total_spend
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY o.customer_id;



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
    c.customer_id,
    c.customer_name,
    ct.total_spend
FROM customer_totals ct
JOIN customers c
    ON c.customer_id = ct.customer_id
WHERE ct.total_spend > (
    SELECT AVG(total_spend)
    FROM customer_totals
)
ORDER BY ct.total_spend DESC;