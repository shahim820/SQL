use COLLEGE_DB;
SHOW TABLES;
SELECT * FROM STUDENTS;
SELECT * FROM COURSES;
SELECT * FROM ENROLLMENTS;
-- 1. Display the first names of all students in capital letters.
SELECT UPPER(FIRST_NAME) AS 'CAPITAL LETTER' FROM STUDENTS;

-- 2. Display the last names of all students in small letters.
SELECT LOWER(LAST_NAME) AS 'LAST NAME' FROM STUDENTS;

-- 3. Display the full name of every student (first name, a space, then last name) with the heading Full Name.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'FULL NAME' FROM STUDENTS;

-- 4. Display each student’s first name along with the number of letters in it.
SELECT FIRST_NAME ,LENGTH(FIRST_NAME) FROM STUDENTS;

-- 5. Display the first three letters of each student’s first name.
SELECT LEFT(FIRST_NAME,3) FROM STUDENTS;

-- 6. Display each student’s initials, made of the first letter of the first name followed by the first letter of the last name, with the heading Initials.
SELECT CONCAT(LEFT(FIRST_NAME,1),LEFT(LAST_NAME,1)) AS INITIALS FROM STUDENTS;

-- 7. Display the first names of students whose first name has more than 6 letters.
SELECT FIRST_NAME,LENGTH(FIRST_NAME) FROM STUDENTS WHERE LENGTH(FIRST_NAME)>6;

-- -- 8. Display a student code for every student, made of the first four letters of the department in capital letters followed by the student ID
--  (for example COMP1), with the heading Student Code.
SELECT DEPARTMENT,CONCAT(LEFT(DEPARTMENT,4),STUDENT_ID) AS'STUDENT CODE' FROM STUDENTS;

-- 9. Display the text Route Academy (with 3 spaces on each side) after removing the extra spaces, and
--  also display its length before and after removing the spaces.
SELECT CONCAT(' ',' ',' ','ROUTE ACADEMY',' ',' ',' ') AS CONCAT;
SELECT TRIM(CONCAT(' ',' ',' ','ROUTE ACADEMY',' ',' ',' ')) AS TRIM;
SELECT LENGTH(CONCAT(' ',' ',' ','ROUTE ACADEMY',' ',' ',' ')) AS LENGTH;

-- 10. Display each student’s first name along with the year of birth.
SELECT FIRST_NAME,YEAR(DATE_OF_BIRTH) AS 'DATE_YEAR' FROM STUDENTS;

-- 11. Display each student’s first name along with the month of birth as a number.
SELECT FIRST_NAME,MONTH(DATE_OF_BIRTH) AS 'DATE_MONTH' FROM STUDENTS;

-- 12. Display the first name and date of birth of students born in March.
SELECT FIRST_NAME ,MONTH(DATE_OF_BIRTH) AS MONTH FROM STUDENTS WHERE MONTH(DATE_OF_BIRTH)=3;

-- 13. Display each student’s date of birth in the form 12-03-2004 (day, month, year).
SELECT  first_name,date_of_birth,date_format(date_of_birth,'%d-%m-%y') from students;

-- 14. Display each student’s date of birth in the form 12 March 2004.
select first_name,date_format(date_of_birth,'%d %M %y') from students;

-- 15. Display each student’s first name along with the number of days from the date of birth to 1 January 2026.
Select first_name,date_of_birth,datediff('2026-01-01',date_of_birth) from students;

-- 16. Display the number of students born in each year.
Select year(date_of_birth) as year_born ,count(student_id)from students group by year(date_of_birth) order by year (date_of_birth) asc;

-- 17. For students born in 2004, display the departments that have at least 5 such students, along with the number of students.

select department,count(STUDENT_ID) from students where year(date_of_birth) =2004 group by department having count(STUDENT_ID)>=5;