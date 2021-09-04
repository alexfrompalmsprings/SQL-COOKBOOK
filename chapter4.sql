-- Inserting a New Record

--Problem
-- you want to insert a new record into a table.

-- ie. you want to insert a record into the dept table
-- deptno 50, location Baltimore &  name of the dept 'Programming'

INSERT INTO dbo.DEPT
    (
        DEPTNO,
        DNAME,
        LOC
    )

VALUES
    (   50,  -- DEPTNO - int
        'Programming', -- DNAME - varchar(14)
        'Baltimore'  -- LOC - varchar(13)
        )

-- After the insert
-- DEPTNO	DNAME	LOC
-- 10	ACCOUNTING	NEW YORK
-- 20	RESEARCH	DALLAS
-- 30	SALES	CHICAGO
-- 40	OPERATIONS	BOSTON
-- 50	Programming	Baltimore


-- Inserting Default Values

-- Problem
-- You want to insert a row of default values without having to specify those values.

--The DEFAULT keyword in the values list will insert the value that was specified as the default 
--for a particular column during table creation. 
create table D (id integer default 0, foo varchar(10))
