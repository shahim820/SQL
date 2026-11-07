
-- 1. Display all students admitted in 2021 or 2024.
USE COLLEGE_DB;
SHOW TABLES;
SELECT * FROM COURSES;
SELECT * FROM ENROLLMENTS;
SELECT * FROM STUDENTS;
SELECT FIRST_NAME , ADMISSION_YEAR FROM STUDENTS WHERE ADMISSION_YEAR IN (2021,2024);

-- 2. Display all students who are not in the Electronics or Commerce department.

SELECT * FROM STUDENTS WHERE DEPARTMENT NOT IN  ('Electronics') OR ('COMMERCE');

-- 3. Display first_name, department and percentage of students who scored between 60
-- and 70.
SELECT FIRST_NAME ,DEPARTMENT,PERCENTAGE FROM STUDENTS WHERE PERCENTAGE BETWEEN 60 AND 70;

-- 4. Display first_name and date_of_birth of students born in the year 2004.
SELECT FIRST_NAME , DATE_OF_BIRTH FROM STUDENTS WHERE DATE_OF_BIRTH between '2004-01-01' AND '2004-12-31';

-- 5. Display all students whose first name starts with the letter A.
SELECT FIRST_NAME FROM STUDENTS WHERE FIRST_NAME LIKE 'A%';

-- 6. Display all students whose last name ends with "an".
SELECT LAST_NAME FROM STUDENTS WHERE LAST_NAME LIKE '%AN';

-- 7. Display all students whose first name contains "th".
SELECT FIRST_NAME FROM STUDENTS WHERE FIRST_NAME LIKE '%TH%';

-- 8. Display all students whose first name has exactly 4 letters.
SELECT FIRST_NAME FROM STUDENTS WHERE FIRST_NAME LIKE '_';

-- 9. Display all students whose percentage is not yet available.
SELECT FIRST_NAME, PERCENTAGE FROM STUDENTS WHERE PERCENTAGE IS NULL;

-- 10. Display first_name and city of Computer Science students whose percentage is not yet
-- available.
SELECT FIRST_NAME, CITY,DEPARTMENT FROM STUDENTS WHERE DEPARTMENT='COMPUTER SCINCE' AND PERCENTAGE IS NULL;

-- 11. Display all enrollments where the marks have not been entered yet.
SELECT * FROM ENROLLMENTS WHERE MARKS IS NULL;

-- 12. Display first_name and last_name of all students sorted by first name from A to Z.
SELECT FIRST_NAME, LAST_NAME  FROM STUDENTS ORDER BY FIRST_NAME;

-- 13. Display first_name, department and percentage of all students sorted by department
 -- from A to Z, and within each department by percentage from highest to lowest.
 SELECT FIRST_NAME , DEPARTMENT,PERCENTAGE FROM STUDENTS ORDER BY DEPARTMENT, PERCENTAGE DESC;
 
-- 14. Display the top 5 students by percentage.
SELECT FIRST_NAME,PERCENTAGE FROM STUDENTS ORDER BY PERCENTAGE DESC LIMIT 5;

-- 15. Display first_name and date_of_birth of the 3 youngest students.
SELECT FIRST_NAME, DATE_OF_BIRTH FROM STUDENTS ORDER BY DATE_OF_BIRTH DESC LIMIT 3;
SELECT * FROM STUDENTS;

-- 16. Display first_name and percentage of the 3 Commerce students with the lowest
SELECT FIRST_NAME,PERCENTAGE,DEPARTMENT FROM STUDENTS WHERE DEPARTMENT='COMMERCE' ORDER BY PERCENTAGE LIMIT 3;
