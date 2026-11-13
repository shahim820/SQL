USE COLLEGE_DB;
SELECT * FROM COURSES;
SELECT * FROM ENROLLMENTS;
SELECT * FROM STUDENTS;

-- 1. Display the total number of students.
SELECT COUNT(STUDENT_ID) FROM STUDENTS;

-- 2. Display the number of students whose percentage is available.
SELECT COUNT(PERCENTAGE) AS 'PERCENTAGE' FROM STUDENTS;

-- 3. Display the highest, lowest and average percentage of all students, with the headings
-- Highest, Lowest and Average.
SELECT MAX(PERCENTAGE) AS 'HIGHEST PRCTGE',MIN(PERCENTAGE) AS 'LOWEST PRCTGE',AVG(PERCENTAGE) AS 'AVERAGE PRCTGE' FROM STUDENTS;

-- 4. Display the total number of courses and the total credits in the courses table.
SELECT COUNT(COURSE_ID) AS 'TOTAL NUMBER OF COURSES' ,COUNT(CREDITS) AS 'TOTAL CREDITS' FROM COURSES;

-- 5. Display the highest and lowest marks in the enrollments table.
SELECT MIN(MARKS) AS 'LOWEST MARK', MAX(MARKS) AS 'HIGH MARKS' FROM ENROLLMENTS;

-- 6. Display the number of students in each department.
select COUNT(STUDENT_ID) AS 'TOTAL STUDENTS',DEPARTMENT FROM STUDENTS GROUP BY DEPARTMENT;

-- 7. Display the number of students from each city.
SELECT CITY,COUNT(STUDENT_ID) AS 'TOTAL STUDENTS' FROM STUDENTS GROUP BY CITY;

-- 8. Display the average percentage of each department.
SELECT DEPARTMENT,AVG(PERCENTAGE) AS 'AVERAGE PERCENTGE' FROM STUDENTS GROUP BY DEPARTMENT;

-- 9. Display the number of students admitted in each year, with the latest year first.
SELECT ADMISSION_YEAR,COUNT(STUDENT_ID)AS 'NUMBER OF STUDENTS' FROM STUDENTS GROUP BY ADMISSION_YEAR ORDER BY ADMISSION_YEAR DESC;

-- 10. Display the number of male and female students in each department.
SELECT DEPARTMENT, GENDER,COUNT(STUDENT_ID) AS 'TOTAL NUMBER STUDENTS' FROM STUDENTS GROUP BY DEPARTMENT,GENDER;

-- 11. Display the average marks of each course in the enrollments table, showing the course ID.
SELECT * FROM ENROLLMENTS;
SELECT COURSE_ID, AVG(MARKS) AS 'AVERAGE MARKS' FROM ENROLLMENTS GROUP BY COURSE_ID;

-- 12. Display the student ID and the number of courses for students who are enrolled in at least 2
-- courses.
SELECT STUDENT_ID,COUNT(COURSE_ID) AS 'NUMBER OF COURSES' FROM ENROLLMENTS GROUP BY STUDENT_ID HAVING COUNT(COURSE_ID)>=2 ;

-- 13. Display the cities that have at least 6 students.
SELECT CITY,COUNT(STUDENT_ID) AS 'NUMBER OF STUDENTS' FROM STUDENTS GROUP BY CITY HAVING COUNT(STUDENT_ID)>=6;

-- 14. Display the departments whose average percentage is above 70.
SELECT DEPARTMENT,AVG(PERCENTAGE) AS 'AVERAGE PERCENTAGE' FROM STUDENTS GROUP BY DEPARTMENT HAVING AVG(PERCENTAGE)>70;

-- 15. For students admitted in 2022 or later, display the departments whose average percentage
-- is 75 or more.
SELECT FIRST_NAME ,DEPARTMENT,AVG(PERCENTAGE) AS 'AVERAGE PERCENTAGE' FROM STUDENTS  GROUP BY FIRST_NAME ,DEPARTMENT HAVING AVG(PERCENTAGE)>=75 ;

-- 16. Among enrollments with marks of 80 or more, display the course IDs that have at least 3
-- such enrollments.
SELECT course_id, COUNT(*) AS number_of_enrollments
FROM enrollments
WHERE marks >= 80
GROUP BY course_id
HAVING COUNT(*) >= 3;