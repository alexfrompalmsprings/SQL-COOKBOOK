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