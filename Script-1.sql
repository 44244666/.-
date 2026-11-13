select * from `user` u 
limit 1000
-- 查看数据

select * from user_behavior ub 
limit 1000
-- 查看数据

select *
from(
select 
ub.behavior_type ,
ub.global_user_id ,
ub.platform ,
ub.behavior_time ,
u.city ,
u.age ,
u.gender ,
u.user_level,
ub.behavior_type ,
ub.referrer 
from user_behavior ub left join `user` u
on u.global_user_id=ub.global_user_id 
)t1
limit 1000
-- 清洗无关数据，查看结构

create table table1 as
select 
ub.behavior_type ,
ub.global_user_id ,
ub.platform ,
ub.behavior_time ,
u.city ,
u.age ,
u.gender ,
u.user_level,
ub.referrer 
from user_behavior ub left join `user` u
on u.global_user_id=ub.global_user_id 


select * from `order` o 
limit 1000
-- 查看数据


select
o.global_user_id ,
o.order_id ,
o.order_time ,
o.platform ,
o.total_amount ,
o.order_status ,
u.city ,
o.payment_time ,
u.gender ,
u.platform_user_id ,
u.user_level ,
o.promotion_id  
from `user` u  left join `order` o 
on u.global_user_id=o.global_user_id 
limit 1000
-- 清洗无关数据，查看结构

create table table2 as
select
o.global_user_id ,
o.order_id ,
o.order_time ,
o.platform ,
o.total_amount ,
o.order_status ,
u.city ,
o.payment_time ,
u.gender ,
u.platform_user_id ,
u.user_level ,
o.promotion_id 
from `user` u  left join `order` o 
on u.global_user_id=o.global_user_id
-- 保留全部用户

create table table5 as
select
o.global_user_id ,
o.order_id ,
o.order_time ,
o.platform ,
o.total_amount ,
o.order_status ,
u.city ,
o.payment_time ,
u.gender ,
u.platform_user_id ,
u.user_level ,
o.promotion_id 
from `user` u  inner join `order` o 
on u.global_user_id=o.global_user_id
-- 剔除沉默用户及没下单用户


select *
from order_item oi 
limit 1000


select
t5.total_amount ,
oi.global_product_id ,
oi.order_id,
t5.platform ,
t5.user_level ,
t5.order_status 
from table5 t5 left join order_item oi 
on t5.order_id = oi.order_id 
limit 1000


create table table3 as
select
t5.total_amount ,
oi.global_product_id ,
oi.order_id,
t5.platform ,
t5.user_level ,
t5.order_status 
from table5 t5 left join order_item oi 
on t5.order_id = oi.order_id 

select *
from product p 
limit 1000

select 
t3.total_amount ,
t3.global_product_id ,
t3.order_id ,
p.category ,
t3.order_status ,
p.brand 
from table3 t3 left join product p 
on t3.global_product_id  = p.global_product_id 
limit 10000

create table table4 as
select 
t3.total_amount ,
t3.global_product_id ,
t3.order_id ,
p.category ,
t3.order_status ,
p.brand 
from table3 t3 left join product p 
on t3.global_product_id  = p.global_product_id 

create table table6 as
select *
from table4 t4 
where t4.order_status in ('已付款','已发货','已完成')






