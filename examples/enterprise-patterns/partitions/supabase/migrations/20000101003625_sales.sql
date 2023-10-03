
create table sales (
    id bigint generated by default as identity,
    order_date date not null,
    customer_id bigint,
    amount bigint,

    -- We need to include all the 
    -- partitioning columns in constraints:
    primary key (order_date, id) 
) 
partition by range (order_date);

create table sales_2000_01
	partition of sales
  for values from ('2000-01-01') to ('2000-02-01');

create table sales_2000_02 
	partition of sales
	for values from ('2000-02-01') to ('2000-03-01');