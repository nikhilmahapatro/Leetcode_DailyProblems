select p.product_name, unit
from products p
join (
  select product_id, order_date, sum(unit) unit
  from orders 
  where DATE_FORMAT(order_date, '%Y-%m') = '2020-02' 
  group by product_id
) as o
on p.product_id = o.product_id
where unit >= 100
group by p.product_name 