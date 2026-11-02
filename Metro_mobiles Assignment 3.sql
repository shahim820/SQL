-- 1. Show everything stored in the phones table.
USE  metro_mobiles;
SHOW TABLES;
SELECT * FROM PHONES;

-- 2. The owner has some changes. After each one, show the table to check the result:
-- • The price of the Redmi Note 12 is now 14999.00.
UPDATE PHONES SET PRICE=1499.00 WHERE PHONE_ID=2;

-- • The stock of the Vivo Y28 is now 20.
UPDATE PHONES SET STOCK=20 WHERE PHONE_ID=4;

-- • The Oppo A58 has a new price of 13999.00 and new stock of 15. Change both in one
-- command.
UPDATE PHONES SET PRICE=1399.00,STOCK=15 WHERE PHONE_ID=5;

-- • Increase the price of every phone by 500.
UPDATE PHONES SET PRICE=PRICE+500;
SET SQL_SAFE_UPDATES=0;
SELECT * FROM PHONES;

-- 3. The Vivo Y28 has been discontinued. Remove it from the table and show the table.
DELETE FROM PHONES WHERE phone_ID=4;

-- 4. The shop has stopped selling Oppo phones. Remove all Oppo phones and show the table.
DELETE FROM PHONES WHERE BRAND= 'OPPO';

-- 5. Remove all rows from old_stock in a way that is fast and keeps the table. Show the table and
-- check its structure to confirm it still exists.
SELECT * FROM OLD_STOCK;
truncate TABLE OLD_STOCK;

-- 6. Remove all rows from temp_list in a way that would also let you choose which rows to
-- remove. Show the table and check its structure.
SELECT * FROM TEMP_LIST;
DELETE FROM TEMP_LIST;

-- 7. Remove the temp_list table completely. Then try to show its data and write down the error
-- you get.
DROP TABLE TEMP_LIST;

-- 8. At the end of your file, write one line each as comments on how DELETE, TRUNCATE and
-- DROP are different.
-- DELETE = Delete use , Removes selected rows from a table.
-- TRUNCATE = Removes all rows from a table.
--  DROP = Deletes the entire table.