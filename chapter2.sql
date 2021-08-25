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
