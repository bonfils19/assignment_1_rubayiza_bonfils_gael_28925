
# Sunrise Super Market

- Names:rubayiza bonfils gael
- ID:28925
- Database Used :Mysql

## Scenerio 

Sunrise Supermarket is a retail store that sells a variety of products such as groceries. Customers visit the supermarket to purchase products and place orders containing one or more items. The supermarket serves customers from different locations and records their purchases and sales.

### Customer's order


```sql

select o.order_id,
       c.customer_name as name,
       c.city,
       o.order_date
  from orders o
 inner join customers c
on o.customer_id = c.customer_id;
```

![Customer Orders] https://github.com/bonfils19/assignment_1_rubayiza_bonfils_gael_28925/blob/master/screenshot/Screenshot%20(30).png


```sql
SELECT
    oi.order_item_id,
    p.product_name,
    p.category,
    p.price,
    oi.quantity,
    p.price * oi.quantity AS item_total
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id;

    ```
    ![order item] https://github.com/bonfils19/assignment_1_rubayiza_bonfils_gael_28925/blob/master/screenshot/Screenshot%20(41).png
    `


```sql

    SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;

```
[customer with orders]https://github.com/bonfils19/assignment_1_rubayiza_bonfils_gael_28925/blob/master/screenshot/Screenshot%20(43).png

```sql
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

```

[spend above average] https://github.com/bonfils19/assignment_1_rubayiza_bonfils_gael_28925/blob/master/screenshot/Screenshot%20(36).png

```sql
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

```
[customer order number] https://github.com/bonfils19/assignment_1_rubayiza_bonfils_gael_28925/blob/master/screenshot/Screenshot%20(37).png


```sql
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

```
[revenue ] https://github.com/bonfils19/assignment_1_rubayiza_bonfils_gael_28925/blob/master/screenshot/Screenshot%20(38).png


```sql
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
```

[days btn orders] https://github.com/bonfils19/assignment_1_rubayiza_bonfils_gael_28925/blob/master/screenshot/Screenshot%20(39).png
