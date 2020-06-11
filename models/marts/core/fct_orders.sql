with orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}    

),

payments as (

    select * from {{ ref('stg_stripe__payments') }}

),

order_payments as (

    select
        order_id,
        sum(amount) as amount

    from payments

    group by 1
),

final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status as order_status,
        amount

    from orders

    left join order_payments using (order_id)
)
select * from final
