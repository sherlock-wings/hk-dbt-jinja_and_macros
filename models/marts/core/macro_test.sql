select * from {{ source('jaffle_shop', 'orders') }}
{{ get_last_x_days('jaffle_shop.orders', 'order_date', 15)}}