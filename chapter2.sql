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

-- Sorting by Substrings

--Problem
-- you want to sort the results of a query by specific parts of a string. 
-- sort by the last two characters in the job fields
	job
FROM emp
    -- SUBSTRING(string, start, length)
    --LEN(string); length of the word
ORDER BY SUBSTRING(job, LEN(job)-2, 2)


-- Dealing with NULLS when Sorting

--Problem
-- you want to sort results from EMP by COMM, but the field is NULLABLE
-- find a way to find out the null sorts first/last

-- nulls first
SELECT ename, 
	sal, 
	comm
FROM emp
ORDER BY comm

-- order by DESC 
SELECT ename, 
	sal, 
	comm
FROM emp
ORDER BY comm DESC