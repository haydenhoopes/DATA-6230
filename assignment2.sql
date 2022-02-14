-- Hayden Hoopes
-- Assignment 2

/*
Query 1
Give the total revenue per sku during the month of June 2012. Show the sku and 
the total revenue amount (as price multiplied by quantity) for orderlines 
created from Jun 1, 2012 to July 1, 2012.
*/
 

/*
Query 2
Show a list of how many products are listed in the products table by brand name.
The results should show brand name and a count of products with that brand 
(use sku). Order by the brands with the most products.
*/


/*
Query 3
List the total number of items that have been purchased by sku. This can be 
found in the orderlines table by adding up the quantity field. Exclude skus that
are null and skus where only one total item was ever sold.
*/


/*
Query 4
For each product in the product list table, list the brand name from the brand
table and the average price of the items in that brand. Use the product list
table for the price. Sort by the brands with the highest average price first.
Round the price to 2 decimal places and display that column as average_price.
*/


/*
Query 5
Querying the orderlines table, show the top 2 orders by the total order price
(calculated as price * quantity for each orderline, then adding all of the
orderlines for an order together). Display the order number and the total order
price.
*/


/*
Query 6
The keyword column in the products table has keywords separated by commas.
We want to display only the first keyword listed. To do this, first, find where
the comma is and then take the string from the start up to that comma. If there
is no comma in the keywords column then return the full keyword column. Return
these keywords. Exclude rows where the keyword field is blank.
*/


/*
Query 7
Find the product that weighs the most for each brand from the products table.
Display the brand name, sku, and weight of those products. Your query should
only return one row per brand name unless the brand has more than one product
that weighs the same. Sort by brand name. Use a subquery.
*/

/*
Query 8
Using your query from #7, find any duplicate brand names in your results.
Display the brand names with duplicates.
*/

/*
Query 9
Find all orders with a discount on a product that is greater than the average of
all discounts. Display the order number, sku, order price (from the orderline
table), product price (from the product table), and the discount percent.
Calculate the discount percent as product price minus orderline price then
divide by product price. Multiply the results of this by 100 to turn it into
a percentage. Only show results where the orderline price is greater than zero
and where the orderline price is different than the product price. Also, filter
to records where the discount percentage of that row is greater than the average
discount price of all records in our table. (Hint: use a subquery to find this
average amount and use the same filters in the subquery as the outer query).
 */



/*
Query 10
How many customers have purchased more than ten times? Count the order numbers
by customer. Display the count.
*/

/*
Query 11
What day of the week has the most orders? Display the number of orders by day of
the week that the order is placed on. Format the day of the week to remove
trailing spaces. Show only the day of the week with the highest count of orders
with the order count.
*/