
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

![Customer Orders](https://github.com/ikuzweelisa/assignment_1_ikuzwe_shema_elysee_28938/blob/main/screenshots/customer's%20order.png)