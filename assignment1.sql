-- Hayden Hoopes
-- A02080595
-- 1. For each product in the product table, list the sku, title and brand name.
-- Products should be listed in ascending order of the sku
SELECT SKU, TITLE, BRAND_NAME 
FROM BC.products
ORDER BY SKU ASC;

-- 2. List the order date, status, and order number of any orders that are not
-- in "shipped" status. Display the order date in the format that would show
-- like this: 01 Jan 2021. Name that column ORDERDATE. List the results sorted
-- by order date descending and then status.
SELECT TO_CHAR(ORDER_DATE, 'DD MON YYYY') as ORDERDATE, STATUS, ORDER_NUMBER
FROM BC.ORDERS
WHERE STATUS != 'shipped'
ORDER BY ORDER_DATE DESC, STATUS;

-- 3. Show the product_group for products in the following divisions. Eliminate 
--duplicates from your query results and sort the list by product group. Use the 
--keyword of "IN" in this query.
SELECT DISTINCT PRODUCT_GROUP
FROM BC.PRODUCTS
WHERE DIVISION IN ('Ski', 'Snowboard', 'Bikes and Frames')
ORDER BY PRODUCT_GROUP
;

-- 4. Show the customer id's for customers who have placed an order from Jan 1,
-- 2013 to now. Only show each customer id once.
SELECT DISTINCT CUSTOMER_ID
FROM BC.ORDERS
WHERE ORDER_DATE BETWEEN TO_DATE('01-01-2013', 'DD-MM-YYYY') AND SYSDATE;

-- 5. List all of the orderline columns for rows that have a sku that starts 
-- with �OAK� and that have a price that is not zero or negative.
SELECT *
FROM BC.ORDERLINES
WHERE SKU LIKE 'OAK%' AND
    PRICE > 0;
    
-- 6. For each orderline, display the order_number, order_date from the orders 
--table, the customer last name from the customers table, and the line_type, sku
-- and price for each item ordered in the orderlines table.
SELECT OD.ORDER_NUMBER, O.ORDER_DATE, C.LAST_NAME, OD.LINE_TYPE, OD.SKU, OD.PRICE
FROM BC.ORDERLINES OD
    JOIN BC.ORDERS O ON OD.ORDER_NUMBER = O.ORDER_NUMBER
    JOIN BC.CUSTOMERS C ON C.CUSTOMER_ID = O.CUSTOMER_ID
;

-- 7. Show all order numbers and the website name that it was purchased on. Join
-- with the USING keyword. Filter to orders placed in the year 2012 by 
-- transforming the order_date to a string of the year.
SELECT O.ORDER_NUMBER, W.WEBSITE_NAME
FROM BC.ORDERS O
    JOIN BC.WEBSITES W USING (WEBSITE_ID)
WHERE TO_CHAR(O.ORDER_DATE, 'YYYY') = '2012'
;

-- 8. Find all orders that took more than 3 days to ship after the order date. 
-- Compare the order date to the shipped date in the orders table. Display the 
-- order_number of each of these orders and the time to ship calculation. Ignore
-- orders that did not ship (shipped_date will be null). Sort with the highest 
-- time to ship first.
SELECT ORDER_NUMBER 
    , ORDER_DATE
    , SHIPPED_DATE
    , (SHIPPED_DATE - ORDER_DATE) DAYS_TO_SHIP
FROM BC.ORDERS
WHERE SHIPPED_DATE - ORDER_DATE > 3
    AND SHIPPED_DATE IS NOT NULL
ORDER BY DAYS_TO_SHIP DESC
;

-- 9. Find all products with a weight from 5 to 10 pounds in the products table.
-- Use the BETWEEN keyword. Display the brand, sku and weight.
SELECT BRAND_NAME
    , SKU
    , WEIGHT
FROM BC.PRODUCTS
WHERE WEIGHT BETWEEN 5 AND 10
;
 

-- 10. From the orders and orderlines tables, display the order number, line 
-- number, line type and sku of all orders that meet one of the following 
-- criteria: 1) order date in the month of April 2012 and a shipmode of 
-- "ECONOMY" or 2) order status of "canceled". Keep in mind that the order date 
-- includes a time.
SELECT OL.ORDER_NUMBER
    , OL.LINE_NUMBER
    , OL.LINE_TYPE
    , OL.SKU
FROM BC.ORDERLINES OL
    JOIN BC.ORDERS O ON OL.ORDER_NUMBER = O.ORDER_NUMBER
WHERE (
        O.ORDER_DATE BETWEEN TO_DATE('2012-04-01', 'YYYY-MM-DD') AND
            TO_DATE('2012-05-01', 'YYYY-MM-DD')
        AND O.SHIPMODE = 'ECONOMY'
        )
    OR O.STATUS = 'cancelled'
;
 

-- 11. Calculate the orderline total for each orderline by multiplying the 
-- quantity by the price. Display the order number, line number, line type and 
-- orderline total calculation (be sure to name the column orderline_total). 
-- Display all orderlines except for orderlines with a line_type of "tax".
SELECT ORDER_NUMBER
    , LINE_NUMBER
    , LINE_TYPE
    , QUANTITY*PRICE ORDERLINE_TOTAL
FROM BC.ORDERLINES
WHERE LINE_TYPE <> 'tax'
;
 

-- 12. Find all products that have sold with a quantity of more than 3 in a 
-- single order based on the orderline table. Only show each product once. 
-- Display the product brand name and title. Order by the product's brand name 
-- and then title.
 SELECT DISTINCT P.BRAND_NAME
    , P.TITLE
FROM BC.PRODUCTS P
    JOIN BC.ORDERLINES OL ON OL.SKU = P.SKU
WHERE OL.QUANTITY > 3
ORDER BY P.BRAND_NAME, P.TITLE
;


-- 13. Display all products with the word "waterproof" in either upper or 
-- lowercase anywhere in the description column of the product table. Show the 
-- sku of these products.
SELECT SKU
FROM BC.PRODUCTS
WHERE DESCRIPTION LIKE '%waterproof%'
;
 

-- 14. Using the orderline table, display the line_type of all rows that are 
-- missing a sku value. Only show each line type once.
SELECT DISTINCT LINE_TYPE
FROM BC.ORDERLINES
WHERE SKU IS NULL
;

-- 15. What was yesterday's date?
SELECT SYSDATE - 1
FROM DUAL
;