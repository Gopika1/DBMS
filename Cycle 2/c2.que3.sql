CREATE TABLE customer
	(
      cust_id   INT PRIMARY KEY,
       cust_name VARCHAR(20) NOT NULL
    );
Describe customer;
CREATE TABLE item
     (item_id INT PRIMARY KEY,
     item_name VARCHAR(25),
     price INT
    );
Describe item;
CREATE TABLE sale
(
     bill_no   INT PRIMARY KEY,
     bill_date DATE NOT NULL,
	 cust_id   INT NOT NULL,
     item_id   INT NOT NULL,
     qty_sold  NUMERIC(6,3) NOT NULL,
     FOREIGN KEY(item_id) 
     REFERENCES item(item_id),
     FOREIGN KEY (cust_id) 
	 REFERENCES customer(cust_id)
);
Describe sale;
INSERT INTO customer(cust_id,cust_name) VALUES
( 1, 'Rekha'),(2, 'Rani'),(3, 'Rocky'),( 4, 'Xin'),( 5, 'Kim');
select * from customer;
INSERT INTO item (item_id,item_name,price) VALUES (1, 'Rusk', 120),( 2, 'Banana', 50),( 3, 'Sanitizer', 60),
( 4, 'Cake', 420),( 5, 'Laddu', 25);
select * from item;
INSERT INTO sale (bill_no,bill_date,cust_id,item_id,qty_sold)VALUES 
(10, '2020-10-01', 1, 1, 3),
( 11, '2020-10-01', 1, 3, 2),
( 12, '2020-10-01', 1, 5, 7),
( 13, '2018-10-01', 4, 4, 1),
( 14, '2018-10-11', 4, 2, 2),
( 15, '2018-09-29', 5, 1, 5),
( 16, '2019-12-25', 3, 1, 5),
( 17, '1995-06-21', 5, 4, 4),
( 18, '2002-04-01', 4, 5, 5),
( 19, '2020-02-12', 1, 2, 1);
select * from sale;
SELECT * FROM customer,item, sale WHERE price > 200 AND sale.item_id = item.item_id
 AND sale.cust_id = customer.cust_id;
 SELECT cust_name,prod_nums, bill_date FROM customer,
     (SELECT cust_id,COUNT(item_id) AS prod_nums,bill_date FROM sale
 GROUP BY (bill_date, cust_id )
    ) ci
WHERE ci.cust_id = customer.cust_id;

SELECT cust_name,COUNT(item_id),bill_date FROM customer c,sale s WHERE c.cust_id = s.cust_id
GROUP BY cust_name,bill_date HAVING extract(YEAR FROM bill_date) = 2018;
SELECT item_name FROM item,sale  WHERE sale.item_id = item.item_id  AND sale.cust_id = 5;
SELECT item_name,price,qty_sold FROM item ,sale,(SELECT sysdate AS Today FROM dual ) tod
 WHERE sale.item_id = item.item_id AND bill_date = today ;
SELECT item_name,  qty_sold,  price,(qty_sold * price) AS total_amount FROM customer,item, sale 
WHERE cust_name  = 'Rekha' AND sale.item_id = item.item_id AND sale.cust_id = customer.cust_id;







