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