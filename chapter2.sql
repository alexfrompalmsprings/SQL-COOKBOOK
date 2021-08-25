-- Returning Query Results in a Specified Order

--Problem
-- you want to display the name, job and salaries of employees in the department 10 
-- order by salary
SELECT ename, 
		job, 
		sal
FROM emp
WHERE deptno = 10
ORDER BY sal ASC


-- you can also accomplish the same thing by writing the number of the column
-- not ZeroBasedIndex
SELECT ename, 
		job, 
		sal
FROM emp
WHERE deptno = 10
ORDER BY 3 DESC


-- Sorting by Multiple Fields

--Problem
-- you want to sort the rows from EMP by DEPTNO ascending, then by salary desc
SELECT empno,
		deptno, 
		sal, 
		ename, 
		job
FROM emp
ORDER BY  deptno ASC, sal DESC

