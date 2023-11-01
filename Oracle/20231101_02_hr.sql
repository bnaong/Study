SELECT USER
FROM DUAL;
--==>> HR


--○ EMPLOYEES 테이블의 직원을 SALARY 를 10 % 인상한다.
--   단, 부서명이 'IT' 인 직원들만 한정한다.
--   (또한, 쿼리문에 대한 변경 결과 확인 후 ROLLBACK 을 수행한다~!!!)

-- EMPLOYEES 테이블에서 부서명이 IT인 직원정보 확인
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT');


-- DEPARTMENTS 테이블에서 부서이름으로 부서아이디를 얻어낸다.
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';

-- EMPLOYEES 테이블에서 부서아이디가 일치하는 부서사람 정보를 업데이트함
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');
                       
ROLLBACK;





--○ EMPLOYEES 테이블에서 JOB_TITLE 이 'Sales Manager' 인 사원들의
--   SALARY 를 해당 직무(직종)의 최고급여(MAX_SALARY)로 수정한다.
--   단, 입사일이 2006년 이전(해당 년도 제외) 입사자에 한해 적용될 수 있도록 처리한다.
--   (또한, 변경에 대한 결과 확인 후 ROLLBACK 수행한다~!!!)


SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;


-- 첫 번째 방법

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
AND EXTRACT(YEAR FROM HIRE_DATE) < 2006;

--==>> 3개 행 이(가) 업데이트되었습니다.
/*
145	John	Russell	    JRUSSEL	    011.44.1344.429268	2004-10-01	SA_MAN	20080	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	20080	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	20080	0.3	100	80
*/


-- 조건이 될 JOB_ID
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';

-- 수정할 급여
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';

-- 롤백
ROLLBACK;
--==>> 롤백 완료.




--○ EMPLOYEES 테이블에서 SALARY 를 각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
--   Finance -> 10%
--   Executive -> 15%
--   Accounting -> 20%
--   (결과 확인 후 롤백~!!!)

SELECT *
FROM EMPLOYEES;

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting');

SELECT *
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting');
--==>>
/*
100	Steven	King	SKING	515.123.4567	2003-06-17	AD_PRES	    24000			90	90	Executive	100	1700
101	Neena	Kochhar	NKOCHHAR	515.123.4568	2005-09-21	AD_VP	17000		100	90	90	Executive	100	1700
102	Lex	De Haan	LDEHAAN	515.123.4569	2001-01-13	AD_VP	        17000		100	90	90	Executive	100	1700
108	Nancy	Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	12008		101	100	100	Finance	108	1700
109	Daniel	Faviet	DFAVIET	515.124.4169	2002-08-16	FI_ACCOUNT	9000		108	100	100	Finance	108	1700
110	John	Chen	JCHEN	515.124.4269	2005-09-28	FI_ACCOUNT	8200		108	100	100	Finance	108	1700
111	Ismael	Sciarra	ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	7700		108	100	100	Finance	108	1700
112	Jose Manuel	Urman	JMURMAN	515.124.4469	2006-03-07	FI_ACCOUNT	7800		108	100	100	Finance	108	1700
113	Luis	Popp	LPOPP	515.124.4567	2007-12-07	FI_ACCOUNT	6900		108	100	100	Finance	108	1700
205	Shelley	Higgins	SHIGGINS	515.123.8080	2002-06-07	AC_MGR	12008		101	110	110	Accounting	205	1700
206	William	Gietz	WGIETZ	515.123.8181	2002-06-07	AC_ACCOUNT	8300		205	110	110	Accounting	205	1700
*/


UPDATE (SELECT E.*
        , DECODE(DEPARTMENT_NAME,'Finance', SALARY*1.1,'Executive', SALARY*1.15, 'Accounting', SALARY*1.2, SALARY) "인상급여"
        FROM EMPLOYEES E JOIN DEPARTMENTS D
        ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        WHERE D.DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
        )
SET SALARY = "인상급여";



-- 선생님 풀이방법---------------------------------------------------------------------------
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance') THEN SALARY*1.1
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Executive') THEN SALARY*1.15
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Accounting') THEN SALARY*1.2
                                ELSE SALARY
                                END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting'));
--> 마지막에 있는 WHERE절이 있어도, 없어도 같은 기능, 같은 결과로 실행되지만
--  WHERE절이 없으면 107개 행이 업데이트 되며, WHERE절이 있으면 11개 행이 업데이트 된다.
--  따라서, 후자처럼, WHERE절을 사용하는 것이 바람직하겠다. 


SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';
--==>> 100

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';
--==>> 90

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';
--==>> 110
-------------------------------------------------------------------------------------------

-- 롤백
ROLLBACK;
--==>> 롤백 완료.



--■■■ DELETE ■■■--

-- 1. 테이블에서 지정된 행(레코드)을 삭제하는데 사용하는 구문

-- 2. 형식 및 구조
-- DELETE [FROM] 테이블명
-- [WHERE 조건절];

-- 유의사항 2가지
-- ① FROM을 꼭 붙여야 실수를 줄일 수 있다.
-- ② SELECT * FROM 테이블명 WHERE 조건절;
--    을 통해 조회하여 삭제할 내용을 꼭 확인해본 후 『SELECT *』 을 『DELETE』 로 수정하면 실수를 줄일 수 있다.



-- DELETE 에서도 UPDATE문과 같이 서브쿼리를 사용할 수 있다,


--○ EMPLOYEES 테이블에서 직원들의 데이터를 삭제한다.
--   단, 부서명이 'IT'인 경우로 한정한다.

--※ 실제로는 EMPLOYEES 테이블의 데이터가(-> 삭제하고자 하는 대상 데이터)
--   다른 레코드에 의해 참조당하고 있는 경우
--   삭제되지 않을 수 있다는 사실을 인지할 수 있어야 하며...
--   그에 대한 이유도 알아야 한다.


SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'IT');

DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'IT');









