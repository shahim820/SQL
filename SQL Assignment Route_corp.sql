-- 1. HR wants to track leave applications. Create a table leave_requests with an auto-numbered request ID, the employee who applied (must be a real employee in the company), leave type (only Sick, Casual or Paid), start date, number of days (compulsory, and must be between 1 and 30), a reason, and an approval status that is "Pending" unless stated otherwise.
USE route_corp; 
CREATE TABLE leave_requests (
    REQUEST_ID INT PRIMARY KEY AUTO_INCREMENT,
    EMP_ID INT NOT NULL,
    LEAVE_TYPE ENUM ('Sick', 'Casual', 'Paid') NOT NULL,
    START_DATE DATE NOT NULL,
    DAYS INT NOT NULL CHECK (days BETWEEN 1 AND 30),
    REASON VARCHAR(255),
    APPROVAL_STATUS ENUM ('Pending', 'Approved', 'Rejected')
        DEFAULT 'Pending',
    FOREIGN KEY (EMP_ID) REFERENCES employees(emp_id)
);
 
-- 2. Add 6 leave requests for different employees. For at least two of them, don't mention the status at all. 
INSERT INTO leave_requests
(emp_id, leave_type, start_date, days, reason, approval_status)
VALUES (1, 'Sick', '2026-11-10', 2, 'Fever', 'Approved'),
(2, 'Casual', '2026-11-12', 1, 'Personal work', 'Pending'),
(3, 'Paid', '2026-11-15', 5, 'Family trip', 'Approved'),
(4, 'Sick', '2026-11-18', 3, 'Medical reason', 'Pending');

INSERT INTO leave_requests
(emp_id, leave_type, start_date, days, reason)
VALUES
(5, 'Casual', '2026-11-20', 2, 'Personal reason'),
(6, 'Paid', '2026-11-25', 4, 'Vacation');


-- 3. Two new people joined today. Add them to the employees table (one in the Sales department, one in IT). Don't specify their status or bonus.
INSERT INTO employees
(first_name, last_name, email, phone, city,
dept_id, job_title, salary, join_date)
VALUES ('Akhil', 'Raj', 'akhil.raj@routecorp.com',
'9876543210', 'Kochi', 3, 'Sales Executive',
40000, CURDATE()),

('Nikhil', 'Das', 'nikhil.das@routecorp.com',
'9876543211', 'Trivandrum', 1, 'Data Analyst',
55000, CURDATE());
 
-- 4. Display everything in the leave requests table. 
SELECT * FROM leave_requests;

-- Part B: Changing the Structure 


-- 5. Add a column to employees to store each person's blood group. 
ALTER TABLE employees
ADD COLUMN blood_group VARCHAR(5);

-- 6. Some job titles are longer than 40 characters in the company's new naming plan. Increase that column's size to 60. 
ALTER TABLE EMPLOYEES MODIFY column JOB_TITLE VARCHAR (60) NOT NULL;

-- 7. Rename the location column in departments to office_city. 
ALTER TABLE DEPARTMENTS RENAME column LOCATION TO OFFICE_DUTY;

-- 8. The blood group column is no longer needed. Remove it. 
ALTER TABLE employees
DROP COLUMN blood_group;

-- Part C: Searching and Sorting 

-- 9. Show the names, city and salary of everyone who works in Kochi. 
SELECT FIRST_NAME,CITY,SALARY FROM EMPLOYEES WHERE CITY='KOCHI';

-- 10. List all the cities where the company has employees, with no repeats.
SELECT distinct CITY FROM EMPLOYEES;
 
-- 11. Find employees in Sales who earn more than ₹34,000. 
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE DEPT_ID=3 AND SALARY>34000;

-- 12. Find employees who are either in Bengaluru or earn above ₹80,000. 
SELECT FIRST_NAME, SALARY, CITY FROM EMPLOYEES WHERE CITY='BENGALURU' AND SALARY>34000;

-- 13. Show everyone who is not currently Active. 
SELECT * FROM EMPLOYEES WHERE STATUS <> 'ACTIVE';
SELECT * FROM DEPARTMENTS;

-- 14. List employees who joined between January 2021 and December 2022. 
SELECT * FROM EMPLOYEES WHERE JOIN_DATE between '2021-1-1' AND '2022-12-31';

-- 15. Show employees whose salary is between ₹40,000 and ₹60,000. 
SELECT FIRST_NAME ,SALARY FROM EMPLOYEES WHERE SALARY between '40000' AND '60000';

-- 16. Show employees from Kochi, Kottayam or Kozhikode only. 
SELECT FIRST_NAME ,CITY FROM EMPLOYEES WHERE CITY IN ('KOCHI','KOTTAYAM','KOZIKODE');

-- 17. Find all employees whose first name starts with the letter 'S'. 
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A%';

-- 18. Find employees whose email is not a company email, meaning it doesn't end with routecorp.com.
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME ,EMAIL FROM EMPLOYEES WHERE  EMAIL LIKE '%routecorp.com%';

-- 19. Find employees whose last name contains "Menon" or whose job title contains the word "Manager". 
SELECT LAST_NAME,JOB_TITLE FROM EMPLOYEES WHERE  LAST_NAME LIKE '%MENON' AND JOB_TITLE = 'HR MANAGER';

-- 20. Show all employees ordered from highest salary to lowest. Where salaries match, show the earlier joiner first. 
SELECT FIRST_NAME ,SALARY,JOIN_DATE FROM EMPLOYEES ORDER BY SALARY DESC,JOIN_DATE;

-- 21. Show the 3 highest paid employees. 
SELECT FIRST_NAME , SALARY FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 3;

-- 22. Show the 5 most recently joined employees. 
SELECT FIRST_NAME , JOIN_DATE FROM EMPLOYEES ORDER BY JOIN_DATE DESC LIMIT 5;

-- 23. Find the Active employees in IT who earn more than ₹50,000 and have a bonus of at least 4%, sorted by name. 
SELECT FIRST_NAME , STATUS , DEPT_ID,STATUS ,BONUS_PCT,SALARY FROM EMPLOYEES  WHERE DEPT_ID =1 AND STATUS='ACTIVE' AND SALARY>'50000' AND BONUS_PCT >='4%';

-- Part D: Cleaning and Calculating 

-- 24. Create a "Full Name" column showing first and last name together, with city next to it separated by " | ". 
SELECT CONCAT(first_name, ' ', last_name,
' | ', city) AS full_name_city
FROM employees;

-- 25. HR needs short city codes. Show each employee's name with the first 3 letters of their city in capitals, such as "TRI" or "KOC". 
SELECT FIRST_NAME ,LAST_NAME , UPPER(LEFT(CITY,3)) AS CITY_CODES FROM EMPLOYEES;

-- 26. For privacy, show only the last 4 digits of each phone number along with the employee's name.
SELECT FIRST_NAME ,LAST_NAME,RIGHT(PHONE,4) AS LAST_DIGIT_NUM FROM EMPLOYEES;

-- 27. Show each employee's email with "routecorp.com" replaced by "route.in".
SELECT email, REPLACE(email, 'routecorp.com', 'route.in')
AS updated_email
FROM employees;

-- 28. Show each employee's job title with the word "Executive" shortened to "Exec".

SELECT job_title, REPLACE(job_title, 'Executive', 'Exec') AS updated_job_title FROM employees;

 -- 29. Calculate each employee's bonus amount (salary × bonus %), rounded to the nearest rupee.
-- Route Upskill Academy | SQL Assignment: Route Corp HR Database Page 2 

SELECT first_name, last_name, salary, bonus_pct, ROUND(salary * bonus_pct / 100, 0) AS bonus_amount FROM employees;

-- 30. Show each salary in thousands, rounded down (₹62,000 → 62), and also rounded up to the next whole thousand. 
SELECT first_name, salary, FLOOR(salary / 1000) AS rounded_down, CEIL(salary / 1000) AS rounded_up FROM employees;

-- 31. If every salary increases by 10% each year, show what Arun Kumar's (and everyone's) salary would be after 3 years. 
SELECT first_name, salary, FLOOR(salary / 1000) AS rounded_down, CEIL(salary / 1000) AS rounded_up FROM employees;


-- 32. Calculate a "salary index" for each employee as the square root of their salary, rounded to 2 decimals. 
SELECT first_name, last_name, salary, ROUND(SQRT(salary), 2) AS salary_index FROM employees;

-- Part E: Changing and Removing Data 

-- 33. Give a 5% raise to everyone in the IT department. 
UPDATE employees SET salary = salary * 1.05 WHERE dept_id = 1;

-- 34. Anjali Das has returned from leave. Update her status, and also give her a bonus of 3%.
UPDATE employees SET status = 'Active', bonus_pct = 3 WHERE first_name = 'Anjali' AND last_name = 'Das';
SET SQL_SAFE_UPDATES =0;

 -- 35. Change the status of all employees who joined before 2018 to "Active" (in case it was missed).
 UPDATE employees SET status = 'Active' WHERE join_date < '2018-01-01';
 
--  36. Delete the employees who have resigned and have no leave requests. 
DELETE FROM employees
WHERE status = 'Resigned'
AND NOT EXISTS (
    SELECT 1 FROM leave_requests WHERE leave_requests.emp_id = employees.emp_id
);
-- 37. HR decides to wipe all test leave requests and start fresh. Clear that table completely but keep its structure. 
TRUNCATE TABLE leave_requests;

-- Part F: Cleaning Up 

-- 38. Remove the leave requests table from the database entirely. 
DROP TABLE leave_requests;

-- 39. Try to remove the departments table. What happens, and why? Write your answer in a comment.

-- The DROP TABLE departments command will fail
-- because the employees table has a foreign key
-- referencing departments.dept_id.
-- We must remove the foreign key constraint first
-- before dropping the departments table.
