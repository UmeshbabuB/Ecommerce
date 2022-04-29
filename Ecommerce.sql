-- 1.Create new schema as ecommerce
create database ecommerce;

-- 2.Import .csv file users_data into MySQL.
#select ecommerce schema,right click on tables,select table data import wizard, browse the file and then import the file and click on finish.

-- 3.Run SQL command to see the structure of table.
use ecommerce;
desc users_data;

-- 4.Run SQL command to select first 100 rows of the database.
select * from users_data limit 100;

-- 5.How many distinct values exist in table for field country and language.
select count(distinct(country)) country, count(distinct(language)) language from users_data;

-- 6.Check whether male users are having maximum followers or female users.
select max(socialnbfollowers),gender from users_data group by gender ;

-- 7.Calculate the total users those
-- a.Uses Profile Picture in their Profile
select count(hasprofilepicture) from users_data where hasprofilepicture="true";
-- b.Uses Application for Ecommerce platform
select count(hasanyapp) from users_data where hasanyapp = "true";
-- c.Uses Android app
select count(hasandroidapp) from users_data where  hasandroidapp="true";
-- d.Uses ios app
select count(hasiosapp) from users_data where hasiosapp="true";

-- 8.Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
select count(productsbought),country from users_data where productsbought!=0 group by country order by count(productsbought) desc;

-- 9.Calculate the average number of sellers for each country and sort the result in ascending order of total number of sellers.
select avg(productssold),country from users_data where productssold!=0 group by country order by avg(productssold) asc;

-- 10.Display name of top 10 countries having maximum products pass rate.
select country, max(productspassrate) from users_data group by country order by max(productspassrate) desc limit 10 ;

-- 11.Calculate the number of users on an ecommerce platform for different language choices.
select count(hasanyapp),language  from users_data where hasanyapp="true" group by language;

-- 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
select sum(productswished), sum(socialproductsliked) from users_data where hasanyapp="true" and gender = "F" ;

-- 13.Check the choice of male users about being seller or buyer.
select sum(productssold) from users_data where gender = "M" and productssold!=0;
select sum(productsbought) from users_data where gender = "M" and productsbought!=0;

-- 14.Which country is having maximum number of buyers?
select productsbought, country from users_data where productsbought=(select max(productsbought) from users_data) group by country;

-- 15.List the name of 10 countries having zero number of sellers.
select country, productssold from users_data where productssold=0 group by country limit 10 ;

-- 16.Display record of top 110 users who have used ecommerce platform recently.
select * from users_data where hasanyapp="true" order by seniority desc limit 110;

-- 17.Calculate the number of female users those who have not logged in since last 100 days.
select count(gender) from users_data where gender="F" and  dayssincelastlogin>100;

-- 18.Display the number of female users of each country at ecommerce platform.
select count(gender),country,gender from users_data  where hasanyapp="true" and gender="F" group by country;

-- 19.Display the number of male users of each country at ecommerce platform.
select count(gender),country,gender from users_data  where hasanyapp="true" and gender="M" group by country;

-- 20.Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
select avg(productssold), avg(productsbought), country from users_data where hasanyapp="true" and gender="M" group by country;