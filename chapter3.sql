-- Stacking One Rowset atop Another

--Problem
-- you want to return data stored in more than one table
-- stackingone result set atop the other. 

-- use a CASE expression in the ORDER BY clause
SELECT ename AS ename_and_dname, deptno
FROM emp
WHERE deptno = 10
UNION 
SELECT '----------', NULL
FROM dept
UNION All
SELECT dname, deptno
FROM dept


-- Combining Related Rows

--Problem
-- you want to return rows from multiple tables by joining 
-- on a known common column or join on share values

-- solution with an equijoin
SELECT E.ename, 
		D.loc
FROM emp E, dept D 
WHERE E.deptno = D.deptno 
    AND E.deptno = 10

-- solution with a traditional inner join
SELECT E.ename, 
		D.loc
FROM emp AS E
JOIN dept AS D
ON E.deptno = D.deptno 
WHERE  E.deptno = 10


-- Finding Rows in Common Between Table

--Problem
-- you want to find common rows between two tables but there are 
-- multiple columns on which you can join.

-- join the Table using multiple join conditions
SELECT E.empno, 
		E.ename, 
		E.job, 
		E.sal, 
		E.deptno
FROM EMP E, V
WHERE E.ename = V.ename
	AND E.job = V.job
	AND E.sal = V.sal


-- perform the same join via the JOIN clause
SELECT E.empno, 
		E.ename, 
		E.job, 
		E.sal, 
		E.deptno
FROM EMP E
JOIN V 
ON (V.ename = E.ename
	AND E.job = V.job
	AND E.sal = V.sal)



-- Retrieving Values from One Table That Do Not Exist in Another

--Problem
-- you want to find those values in one table
-- that do not exist in some target table

-- dept 40 from the DEPT table does not exist in EMP table
SELECT deptno
FROM dept
-- SubQuery shows all the DEPTNOs in EMP
WHERE deptno NOT IN (SELECT deptno FROM emp)



-- Retrieving Rows from One Table That Do Not Corresponds to Rows in Another

--Problem
-- you want to find rows that are in one table that do not have match in another
-- ie. find which departments have no Employees

-- . SQL left outer join returns all rows in the left table (A) and all the matching rows found in the right table (B). 
-- It means the result of the SQL left join always contains the rows in the left table.
SELECT *
FROM dept d 
LEFT OUTER JOIN emp e
ON (e.DEPTNO = d.DEPTNO)


--Solution below works by joining and then keeping only rows that have no
-- match ~ also called an AntiJoin
SELECT d.*, e.*
FROM dept d 
LEFT OUTER JOIN emp e
ON (e.DEPTNO = d.DEPTNO)
WHERE e.deptno IS NULL


-- Adding Joins to a Query Without Interfering with Other Joins

--Problem
-- you have a query that returns the results that you want. You need additional information,
-- but when trying to get it, you lose the data from the original set.

-- ie. you want to return all the employees, 
-- the location of the departments in which they work, 
-- and the date they received a bonus


-- this table returns the results of all the employees that received a bonus
SELECT e.ename, d.loc , eb.received
FROM dept d 
JOIN emp e ON e.DEPTNO = d.DEPTNO
JOIN emp_bonus eb ON eb.empno = e.empno 

-- to improve this table; display all the results
SELECT e.ename, d.loc , eb.received
FROM dept d 
JOIN emp e ON e.DEPTNO = d.DEPTNO
LEFT JOIN emp_bonus eb ON eb.empno = e.empno 
ORDER BY 2, 1


-- Identifying and Avoiding Cartesian Products

--Problem
-- you want to return the name of each employee in department 10 
SELECT e.ename, d.loc  
FROM  emp e
JOIN dept d
ON d.DEPTNO = e.DEPTNO
WHERE d.deptno =10-- along with the location of the department 



