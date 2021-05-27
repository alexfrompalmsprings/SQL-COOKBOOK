--Retrieving all the rows and columns from a table

--Problem
-- You have a table and want to see all the data from the table
SELECT * 
FROM dbo.EMP


--Retrieving a subset of Rows from a Table

--Problem
-- You have a table and want to see records that satisfy a specific condition
-- condition all Employees from the department 10
SELECT * FROM dbo.EMP
WHERE DEPTNO = 10


--Finding records that satisfy multiple conditions

--Problem
-- You want to return records that satisfy multiple conditions
-- find all employees in dept 10, 
-- along with employees who earn a commission, 
-- along with employees from dept 20 who earned more than $2000
SELECT * FROM dbo.EMP
WHERE DEPTNO = 10
    OR COMM IS NOT NULL
    OR (DEPTNO = 10 AND COMM > 1999)


--  Retrieving a subset of columns from a table

--Problem
-- You have a table and want to see the values of specific columns rather than for all the columns
--      want to see only name, deptno & salaray
SELECT sal, comm, deptno
FROM EMP


--  Providing meaningful names for columns

--Problem
-- You want to name your columns with an easier name for the user
SELECT sal AS 'SALARY', 
        comm AS 'Commission', 
        deptno AS 'Department Number'
FROM EMP



--  Referencing an aliased column in the where clause

--Problem
-- You have used aliases to provide more meaningful column names for your result set
-- and would like to exclude some of the rows using the WHERE clause fails

-- the code below would give you this error: Invalid column name 'SALARY'.
SELECT sal AS 'SALARY', 
        comm AS 'Commission', 
        deptno AS 'Department Number'
FROM EMP
WHERE SALARY > 5000

-- solution to the error
SELECT * 
    FROM (SELECT
            sal AS 'SALARY', 
            comm AS 'Commission', 
            deptno AS 'Department Number'
          FROM EMP  
        ) 
WHERE SALARY < 5000



