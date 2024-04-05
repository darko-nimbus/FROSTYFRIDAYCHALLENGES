-----------------
-- set up code --
-----------------

CREATE TABLE w78 AS
SELECT
  SEQ4() AS sales_id,
  CASE
    WHEN MOD(SEQ4(), 4) = 0 THEN 'Product A'
    WHEN MOD(SEQ4(), 4) = 1 THEN 'Product B'
    WHEN MOD(SEQ4(), 4) = 2 THEN 'Product C'
    ELSE 'Product D'
  END AS product_name,
  UNIFORM(1, 10, RANDOM())::INTEGER AS quantity_sold,
  DATEADD('day', -UNIFORM(1, 365, RANDOM())::INTEGER, CURRENT_DATE()) AS sales_date,
  UNIFORM(20, 100, RANDOM())::FLOAT * UNIFORM(1, 10, RANDOM())::INTEGER AS sales_amount
FROM TABLE(GENERATOR(ROWCOUNT => 1000));

-- create variable named sales_avg --
SET sales_avg = (select avg(SALES_AMOUNT) from W78);

-- final script -- 
SELECT *
FROM w78
WHERE sales_amount between $sales_avg - 50 and $sales_avg +50;
