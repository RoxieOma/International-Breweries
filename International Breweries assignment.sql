/* Created Tables for international breweries and exported the CSV files*/

CREATE TABLE breweries (
	  SALES_ID INT,
	  SALES_REP VARCHAR,
	  EMAILS VARCHAR,
	  BRANDS VARCHAR,
	  PLANT_COST INT,	
	  UNIT_PRICE INT,
	  QUANTITY INT,
	  COSTS INT,
	  PROFIT INT,
	  COUNTRIES VARCHAR,
	  REGION VARCHAR,
	  MONTHS VARCHAR,
	  YEARS INT
);


/*Write an SQL query to fetch “SALES_REP” from breweries  table using the alias name as WORKER_NAME.*/
SELECT sales_rep AS WORKER_NAME
FROM breweries;

/* Write an SQL query to fetch “BRANDS” from breweries table in upper case. */
SELECT UPPER(brands) AS brands
FROM breweries;

/* Write an SQL query to print all details from the breweries table; sort the QUANTITY column in 
Ascending order and the COSTS column in Descending order */
SELECT * FROM breweries
ORDER BY quantity ASC, COSTS DESC;

/* Write an SQL query to print the profit made from two BRANDS, “trophy” and “eagle” 
in the first quarter of 2019 */
SELECT brands, 
	SUM(profit)
FROM breweries
WHERE brands IN ('trophy', 'eagle lager') AND
months IN ('January', 'February', 'March') AND years = 2019
GROUP BY brands;

/* Write a query that reduces the cost of the trophy brand by 2% */
SELECT 0.98*COSTS AS reduced_costs 
FROM breweries
WHERE brands = 'trophy';

/* Which sales rep made the highest profit in Ghana in the year 2017? */
SELECT	sales_rep
FROM breweries
WHERE countries = 'Ghana' AND years = '2017'
ORDER BY profit DESC
LIMIT 1;

/* What region recorded the lowest quantity of goods in the last quarter of every year?*/
SELECT region, 
	MIN(quantity) AS quantity_of_goods,
	years
FROM breweries
WHERE months IN ('October', 'November', 'December')
GROUP BY region, years
ORDER BY MIN(quantity) ASC;

/* The Breweries company has a yearly tradition of promoting the sales_rep who makes the highest 
profit in the year. Who deserves this promotion in 2019? */
SELECT sales_rep, 
	years
FROM breweries
WHERE years = 2019
ORDER BY profit DESC
LIMIT 1;

/*Regions with quantities of trophy which are less than 60000, need to be restocked. 
What regions do we restock with the trophy brand? */
SELECT region,
	brands,
	quantity
FROM breweries
WHERE quantity < 60000 AND brands = 'trophy';
