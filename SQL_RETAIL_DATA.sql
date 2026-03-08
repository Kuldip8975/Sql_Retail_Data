
create table retail_sales(
  transactions_id int primary key,
  sale_dated DATE,
  sale_time time,
  customer_id int,
  gender varchar(10),
  age	int,
  category varchar(16),
  quantiy int,
  price_per_unit float,
  cogs	 float,
  total_sale int
)

SELECT * FROM retail_sales LIMIT 10;

SELECT COUNT(*) FROM retail_sales;

select count(customer_id) from retail_sales;

select count(category) from retail_sales where category = 'Clothing';

select count(transactions_id) from retail_sales where transactions_id is null;

select count(sale_dated) from retail_sales where sale_dated is null;


-- DATA CLEANING--
select * from retail_sales where 
	transactions_id is null
	OR 
	sale_dated is null
	OR
	sale_time is null
	OR
	customer_id is null
	OR
	gender is null
	OR 
	category is null
	OR
	quantiy is null
	OR 
	price_per_unit is null
	OR 
	cogs is null
	OR
	total_sale is null;
	

delete from retail_sales 
	where 
	transactions_id is null
	OR 
	sale_dated is null
	OR
	sale_time is null
	OR
	customer_id is null
	OR
	gender is null
	OR 
	category is null
	OR
	quantiy is null
	OR 
	price_per_unit is null
	OR 
	cogs is null
	OR
	total_sale is null;
	

-- DATA EXPLORATION---

--How Many Records we have ---

select count(1) from retail_sales;

-- How many sales we have --> 1997

select count(1) as total_sales from retail_sales ;

-- How many customer we have--->  155

select count(DISTINCT customer_id) as total_customer from retail_sales ;


-- How many category we have--> 3 clothing,beauty,electronics

select count(Distinct category) as total_category from retail_sales;

select  distinct category from retail_sales;


--DATA ANALYSIS--

select  * from retail_sales;

--write query to retrive all coloumn for sales made on '2022-11-05'
select count(*) from retail_sales where sale_dated='2022-11-05';
select * from retail_sales where sale_dated='2022-11-05';


-- --write a sql query to retrival all transacttion where the category is 'Clothing' and quantity sold is more that 
-- 10 month of NOV-2022
select * from retail_sales where category ='Clothing'
	AND TO_CHAR(sale_dated,'YYYY-MM')='2022-11'
	AND 
	quantiy >= 4


--write query calculate total sales for each category

select category,sum(total_sale) as net_sale, count(*) as total_orders
	from retail_sales  group by all category;


-- write query to find average age of customers who purchace items from the 'Beauty' category

select 	round(avg(age)) as avg_age from retail_sales where category = 'Beauty';


--write a query to find all transaction where the total_sale is grether that 1000.

select * from retail_sales where total_sale > 1000;


--write a sql query to find teh total number of transactions (transaction_id) made by each gender in each category,

select category,gender,count(transactions_id) as total_trans from retail_sales group by category,gender;



--write sql query calculate the average sale for each month,find out best selling month in each year.

select * from (

		select 
		extract(year from sale_dated) as year,
		extract(month from sale_dated) as month,
		round(avg(total_sale)) as avg_sale,
		rank() over(partition by extract (year from sale_dated) order by avg(total_sale) desc) as rank
		from retail_sales
		group by 1,2
		) as t1
		where rank =1
		-- order by 1,2

-- write the query find the top 5 customer based on thier highest total sale

select customer_id,sum(total_sale) as total_sales
from retail_sales group by 1 order by 2 desc limit 5;



--write the query to find the number of unique customer who purchace items for each category.

select category,count(distinct customer_id) as unique_customer from retail_sales group by category;





		



















select * from retail_sales;


































