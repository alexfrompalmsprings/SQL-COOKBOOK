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

