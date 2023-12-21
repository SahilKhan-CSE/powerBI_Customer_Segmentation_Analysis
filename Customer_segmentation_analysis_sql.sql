SELECT * FROM project_customer_segmentation.customer;
use project_customer_segmentation;

-- How is the shopping distribution according to gender?
SELECT
    gender,
    SUM(quantity) AS total_quantity,
    SUM(price) AS total_amount
FROM
    customer
GROUP BY
    gender;
    
-- Which gender did we sell more products to?
SELECT gender, SUM(quantity) AS total_quantity
FROM customer
GROUP BY gender
ORDER BY total_quantity DESC;

-- Which gender generated more revenue?
SELECT gender, SUM(price) AS total_price
FROM customer
GROUP BY gender
ORDER BY total_price DESC;

-- Distribution of purchase categories relative to other columns?
-- Count the number of purchases for each category
SELECT
    category,
    COUNT(*) AS purchase_count
FROM
    customer
GROUP BY
    category;

-- Calculate the average quantity and price for each category
SELECT
    category,
    AVG(quantity) AS avg_quantity,
    AVG(price) AS avg_price
FROM
    customer
GROUP BY
    category;

-- Count the number of purchases for each gender
SELECT
    gender,
    category,
    COUNT(*) AS purchase_count
FROM
    customer
GROUP BY
    gender,
    category;

-- Calculate the average age for each gender
SELECT
    gender,
    category,
    AVG(age) AS avg_age
FROM
    customer
GROUP BY
    gender,
    category;

-- Count the number of purchases for each payment method
SELECT
    payment_method,
    category,
    COUNT(*) AS purchase_count
FROM
    customer
GROUP BY
    payment_method,
    category;

-- Count the number of purchases for each shopping mall
SELECT
    shopping_mall,
    category,
    COUNT(*) AS purchase_count
FROM
    customer
GROUP BY
    shopping_mall,
    category;

-- How is the shopping distribution according to age?
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        WHEN age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '65+'
    END AS age_group,
    gender,
    category,
    payment_method,
    SUM(quantity) AS total_quantity
FROM
    customer
GROUP BY
    age_group, gender, category, payment_method
ORDER BY
    age_group, gender, category, payment_method;


-- Which age category did we sell more products to?
SELECT age, SUM(quantity) AS total_quantity_sold
FROM customer
GROUP BY age
ORDER BY total_quantity_sold DESC;

-- Which age cat generated more revenue?
SELECT age, SUM(price * quantity) AS total_revenue
FROM customer
GROUP BY age
ORDER BY total_revenue DESC;

-- Does the payment method have a relation with other columns?
-- Check the count of each payment method within categories
SELECT category, payment_method, COUNT(*) AS payment_count
FROM customer
GROUP BY category, payment_method;

-- Check the count of each payment method within age groups
SELECT age, payment_method, COUNT(*) AS payment_count
FROM customer
GROUP BY age, payment_method;

-- How is the distribution of the payment method?
SELECT payment_method, COUNT(*) as payment_count
FROM customer
GROUP BY payment_method;



