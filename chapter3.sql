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