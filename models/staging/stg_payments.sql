select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    (amount / 100) :: decimal(19,2) as amount,
    created
    
from raw.stripe.payment
where status = 'success'