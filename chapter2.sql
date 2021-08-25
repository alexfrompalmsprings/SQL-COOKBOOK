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

-- use a CASE expression to conditionally sort the column to create a FLAG with two values
--                      one =           NULLS
--                      other value =   NOT NULLS


-- nonNulls sorted ASC; all NULLS last
SELECT ename, 
	sal, 
	comm
FROM (
	SELECT ename, sal, comm,
		CASE
		WHEN comm IS NULL THEN 0
		ELSE 1
		END AS is_null
	FROM emp
	) x
ORDER BY is_null DESC, comm, sal ASC


-- nonNULLS sorted DESC; all NULLS last
SELECT ename, 
	sal, 
	comm
FROM (
	SELECT ename, sal, comm,
		CASE
		WHEN comm IS NULL THEN 0
		ELSE 1
		END AS is_null
	FROM emp
	) x
ORDER BY is_null DESC, comm DESC

-- nonNULLS sorted ASC; all NULLS first
SELECT ename, 
	sal, 
	comm
FROM (
	SELECT ename, sal, comm,
		CASE
		WHEN comm IS NULL THEN 0
		ELSE 1
		END AS is_null
	FROM emp
	) x
ORDER BY is_null, comm

-- nonNULLS sorted DESC; all NULLS first
SELECT ename, 
	sal, 
	comm
FROM (
	SELECT ename, sal, comm,
		CASE
		WHEN comm IS NULL THEN 0
		ELSE 1
		END AS is_null
	FROM emp
	) x
ORDER BY is_null, comm DESC


-- Sorting on Data Dependant Key

--Problem
-- you want to sort based on some conditional logic; 
-- ie; job is SALESMAN, you want to sort on the COMM else sort on the SAL

-- use a CASE expression in the ORDER BY clause
SELECT ename, sal, job, comm
FROM emp
ORDER BY (
		CASE 
        WHEN JOB = 'Salesman' THEN COMM
        ELSE SAL
        END
		)
