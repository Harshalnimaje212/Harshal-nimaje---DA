-- Module 4) DA - SQL - Introduction and Getting started with sql 
-- Assessment 1: 

CREATE DATABASE HARSHALNIMAJE ;

USE HARSHALNIMAJE ;

CREATE TABLE WORKER (
    WORKER_ID INT PRIMARY KEY ,
	FIRST_NAME VARCHAR(25) ,
	LAST_NAME VARCHAR(25) ,
	SALARY INT ,
	JOINING_DATE DATETIME ,
	DEPARTMENT VARCHAR(30)
) ;

INSERT INTO WORKER VALUES (1, 'Monika', 'Arora', 100000, STR_TO_DATE('2/20/2014 9:00','%m/%d/%Y %H:%i'), 'HR');
INSERT INTO WORKER VALUES (2,  'Niharika', 'Verma', 80000, STR_TO_DATE('6/11/2014 9:00','%m/%d/%Y %H:%i'), 'Admin');
INSERT INTO WORKER VALUES (3, 'Vishal', 'Singhal', 300000, STR_TO_DATE('2/20/2014 9:00','%m/%d/%Y %H:%i'), 'HR');
INSERT INTO WORKER VALUES (4, 'Amitabh', 'Singh', 500000, STR_TO_DATE('2/20/2014 9:00','%m/%d/%Y %H:%i'), 'Admin');
INSERT INTO WORKER VALUES (5, 'Vivek', 'Bhati', 500000, STR_TO_DATE('6/11/2014 9:00','%m/%d/%Y %H:%i'), 'Admin');
INSERT INTO WORKER VALUES (6, 'Vipul', 'Diwan', 200000, STR_TO_DATE('6/11/2014 9:00','%m/%d/%Y %H:%i'), 'Account');
INSERT INTO WORKER VALUES (7, 'Satish', 'Kumar', 75000, STR_TO_DATE('1/20/2014 9:00','%m/%d/%Y %H:%i'), 'Account'); 
INSERT INTO WORKER VALUES (8, 'Geetika', 'Chauhan', 90000, STR_TO_DATE('4/11/2014 9:00','%m/%d/%Y %H:%i'), 'Admin');

/* 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
Ascending and DEPARTMENT Descending. */
 
SELECT * FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC ;

/* 2. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” 
from the Worker table. */

SELECT FIRST_NAME FROM worker WHERE FIRST_NAME IN ("vipul" , "satish") ;

/* 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
contains six alphabets. */

SELECT * FROM WORKER WHERE FIRST_NAME LIKE "_____H" ;

/* 4. Write an SQL query to print details of the Workers whose SALARY lies between 1. */

SELECT * FROM WORKER WHERE SALARY <= 100000 ;

/* 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. */

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT, COUNT(*) FROM WORKER  GROUP BY FIRST_NAME, LAST_NAME, DEPARTMENT 
HAVING COUNT(*) > 1 ;

/* 6. Write an SQL query to show the top 6 records of a table. */

SELECT * FROM WORKER LIMIT 6 ;

/* 7. Write an SQL query to fetch the departments that have less than five people in them. */

SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) < 5 ;

/* 8. Write an SQL query to show all departments along with the number of people in there.*/ 

SELECT DEPARTMENT, COUNT(FIRST_NAME) FROM WORKER GROUP BY DEPARTMENT ;

/* 9. Write an SQL query to print the name of employees having the highest salary in each 
department. */

# SELECT MAX(SALARY), DEPARTMENT FROM WORKER GROUP BY DEPARTMENT ;

SELECT FIRST_NAME, SALARY, DEPARTMENT FROM WORKER WHERE ( DEPARTMENT, SALARY) IN (SELECT DEPARTMENT, MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT ) ;


/* Question 2: Open school database, then select student table and use following SQL statements. 
TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT */

CREATE TABLE STUDENT (
	stdID INT PRIMARY KEY,
	stdName VARCHAR(30),
	Sex VARCHAR(10),
	Percentage INT,
    Class VARCHAR(10),
    Sec VARCHAR(10),
    Stream VARCHAR(20),
    DOB DATE
    );

INSERT INTO student VALUES (1001, 'Surekha Joshi', 'Female', 82, '12', 'A', 'Science', STR_TO_DATE('3/8/1998', '%m/%d/%Y'));
INSERT INTO student VALUES (1002, 'MAAHI AGARWAL', 'Female', 56, '11', 'C', 'Commerce', STR_TO_DATE('11/23/2008', '%m/%d/%Y'));
INSERT INTO student VALUES (1003, 'Sanam Verma', 'Male', 59, '11', 'C', 'Commerce', STR_TO_DATE('6/29/2006', '%m/%d/%Y'));
INSERT INTO student VALUES (1004, 'Ronit Kumar', 'Male', 63, '11', 'C', 'Commerce', STR_TO_DATE('11/5/1997', '%m/%d/%Y'));
INSERT INTO student VALUES (1005, 'Dipesh Pulkit', 'Male', 78, '11', 'B', 'Science', STR_TO_DATE('14/09/2003', '%d/%m/%Y'));
INSERT INTO student VALUES (1006, 'JAHANVI Puri', 'Female', 60, '11', 'B', 'Commerce', STR_TO_DATE('11/7/2008', '%m/%d/%Y'));
INSERT INTO student VALUES (1007, 'Sanam Kumar', 'Male', 23, '12', 'F', 'Commerce', STR_TO_DATE('3/8/1998', '%m/%d/%Y'));
INSERT INTO student VALUES (1008, 'SAHIL SARAS', 'Male', 56, '11', 'C', 'Commerce', STR_TO_DATE('11/7/2008', '%m/%d/%Y'));
INSERT INTO student VALUES (1009, 'AKSHRA AGARWAL', 'Female', 72, '12', 'B', 'Commerce', STR_TO_DATE('10/1/1996', '%m/%d/%Y'));
INSERT INTO student VALUES (1010, 'STUTI MISHRA', 'Female', 39, '11', 'F', 'Science', STR_TO_DATE('11/23/2008', '%m/%d/%Y'));
INSERT INTO student VALUES (1011, 'HARSH AGARWAL', 'Male', 42, '11', 'C', 'Science', STR_TO_DATE('3/8/1998', '%m/%d/%Y'));
INSERT INTO student VALUES (1012, 'NIKUNJ AGARWAL', 'Male', 49, '12', 'C', 'Commerce', STR_TO_DATE('28/06/1998', '%d/%m/%Y'));
INSERT INTO student VALUES (1013, 'AKRITI SAXENA', 'Female', 89, '12', 'A', 'Science', STR_TO_DATE('11/23/2008', '%m/%d/%Y'));
INSERT INTO student VALUES (1014, 'TANI RASTOGI', 'Female', 82, '12', 'A', 'Science', STR_TO_DATE('11/23/2008', '%m/%d/%Y'));

/* 1 To display all the records form STUDENT table. */ 

SELECT * FROM student ;

/* 2. To display any name and date of birth from the table STUDENT. */ 

SELECT StdName, DOB FROM STUDENT ;

/* 3. To display all students record where percentage is greater of equal to 80 FROM student table. */ 

SELECT * FROM STUDENT WHERE Percentage >= 80 ;

/* 4. To display student name, stream and percentage where percentage of student is more than 80 */ 

SELECT * FROM stdName, Stream, Percentage WHERE Percentage >= 80 ;

/* 5. To display all records of science students whose percentage is more than 75 form student table. */ 

SELECT* FROM STUDENT WHERE Stream ="Science" AND Percentage >= 75 ;
