SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 서브쿼리를 활용하여 TBL_SAWON 테이블을 대상으로 다음과 같이 조회할 수 있도록 한다.
/*
-----------------------------------------------------
  사원명    성별   현재나이    급여   나이보너스
-----------------------------------------------------

*/

-- VIEW_SAWON을 이용하는 것이 아님.
-- 나이보너스는 현재 나이가 40세 이상이면 급여의 70%
-- 30세 이상 40세 미만이면 급여의 50%
-- 20세 이상 30세 미만이면 급여의 30%로 한다.

-- 또한, 이렇게 완성된 조회 구문을 통해
-- VIEW_SAWON2 라는 이름의 뷰(VIEW)를 생성할 수 있도록 한다.


SELECT *
FROM TBL_SAWON;


CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT S.*
, CASE WHEN S.현재나이>= 40 THEN S.급여*0.7
       WHEN S.현재나이>= 30 THEN S.급여*0.5
       WHEN S.현재나이>= 20 THEN S.급여*0.3
       ELSE 0
       END "나이보너스"
FROM
(
    SELECT SANAME "사원명"
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','3') THEN '남성'
           WHEN SUBSTR(JUBUN, 7, 1) IN ('2','4') THEN '여성'
           ELSE '몰라'
           END "성별"
    , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899)
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
           ELSE -1
      END"현재나이"
    , SAL "급여"
    FROM TBL_SAWON
) S;
--==>> View VIEW_SAWON2이(가) 생성되었습니다.


SELECT *
FROM VIEW_SAWON2;
--==>>
/*
강혜성	남성  	27	3000	900
박가영	여성  	29	4000	1200
박나영	여성	    25	4000	1200
최혜인	여성	    27	5000	1500
아이유	여성	    19	1000	0
이하이	여성	    18	1000	0
인순이	여성	    59	2000	1400
선동열	남성	    55	2000	1400
이이경	남성  	19	1500	0
선우용녀	여성  	58	1300	910
이윤수	남성  	29	4000	1200
선우선	여성  	18	2000	0
남진	    남성	    59	2000	1400
이주형	남성  	25	2000	600
남궁민	남성  	22	2300	690
*/




--------------------------------------------------------------------------------


--○ RANK() -> 등수(순위)를 반환하는 함수

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
      , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1
7902	FORD	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	4
7698	BLAKE	30	2850	5
7782	CLARK	10	2450	6
7499	ALLEN	30	1600	7
7844	TURNER	30	1500	8
7934	MILLER	10	1300	9
7521	WARD	30	1250	10
7654	MARTIN	30	1250	10
7876	ADAMS	20	1100	12
7900	JAMES	30	950	    13
7369	SMITH	20	800	    14
*/
-- 먼저 급여를 내림차순 정렬을 한 후 -> 등수를 매기는 것


-- ※ 논리적으로 구분하는 것을 파티션이라고 부름
SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
      , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여순위"
      , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1	1
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7698	BLAKE	30	2850	1	5
7782	CLARK	10	2450	2	6
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7934	MILLER	10	1300	3	9
7521	WARD	30	1250	4	10
7654	MARTIN	30	1250	4	10
7876	ADAMS	20	1100	4	12
7900	JAMES	30	950	    6	13
7369	SMITH	20	800	    5	14
*/


SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
      , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여순위"
      , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP
ORDER BY DEPTNO;
--==>>
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	6
7934	MILLER	10	1300	3	9
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7876	ADAMS	20	1100	4	12
7369	SMITH	20	800	    5	14
7698	BLAKE	30	2850	1	5
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7654	MARTIN	30	1250	4	10
7521	WARD	30	1250	4	10
7900	JAMES	30	950	6	13
*/



--○ DENSE_RANK() -> 서열을 반환하는 함수
-- 서열(앞에 1위가 여러명일 때 그 다음등수가 2위가 됨)

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
      , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여서열"
      , DENSE_RANK() OVER(ORDER BY SAL DESC) "전체급여서열"
FROM EMP
ORDER BY 3,4 DESC;
--==>>
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	5
7934	MILLER	10	1300	3	8
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	2	3
7876	ADAMS	20	1100	3	10
7369	SMITH	20	800	    4	12
7698	BLAKE	30	2850	1	4
7499	ALLEN	30	1600	2	6
7844	TURNER	30	1500	3	7
7654	MARTIN	30	1250	4	9
7521	WARD	30	1250	4	9
7900	JAMES	30	950	    5	11
*/



--○ EMP 테이블의 사원 데이터를 사원명, 부서번호, 연봉, 부서내연봉순위, 전체연봉순위 항목으로 조회한다.

SELECT *
FROM EMP;

SELECT T.*
, RANK() OVER(PARTITION BY T.부서번호 ORDER BY T.연봉 DESC) "부서내연봉순위"
, RANK() OVER(ORDER BY T.연봉 DESC) "전체연봉순위"
FROM
(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
    FROM EMP
)T;



--○ EMP 테이블에서 전체연봉순위가 1등 부터 5등까지만 사원명, 부서번호, 연봉, 전체연봉순위항목으로 조회한다.
--① 첫번째 방법
SELECT A.*
FROM
(
    SELECT T.*, RANK() OVER(ORDER BY T.연봉 DESC) "전체연봉순위"
    FROM
    (
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
    FROM EMP
    )T
)A
WHERE A.전체연봉순위<=5;


--② 두번째 방법
SELECT T.*
FROM
(
SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
, RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "전체연봉순위"
FROM EMP
)T
WHERE T.전체연봉순위<=5;
--==>>
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/

--※ RANK() OVER() 함수를 WHERE 조건절에서 사용하려고 한다면 에러 발생한다.
--   이 경우, 우리는 INLINE VIEW를 활용해서 풀이해야 한다.


--○ EMP 테이블에서 각 부서별로 연봉 등수가 1등부터 2등까지만 조회한다.
--   사원명, 부서번호, 연봉, 부서내연봉등수, 전체연봉등수 항목을 조회할 수 있도록 쿼리문을 구성한다.

SELECT T.*
FROM
(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM,0) "연봉"
    , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC) "부서내연봉등수"
    , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"전체연봉등수"
    FROM EMP
) T
WHERE 부서내연봉등수<=2;

--SELECT T2.*
--FROM
--(
--    SELECT T1.*
--        , RANK() OVER(PARTITION BY T1.부서번호 ORDER BY T1.연봉 DESC) "부서내연봉순위"
--        , RANK() OVER(ORDER BY T1.연봉 DESC) "전체연봉순위"
--    FROM
--)
--==>>
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
FORD	20	36000	1	2
SCOTT	20	36000	1	2
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
*/

--※ 정정
--LN() 자연로그 존재함~!!!
SELECT LN(95)
FROM DUAL;
--==>> 4.55387689160054083460978676511404117675


--※ 2023-10-20 시트에서 필기한 부분 수정하기 (그 때 배운 로그함수는 상용로그~!)


--※ 추가
--○ TRIM() 이라는 함수도 존재한다

SELECT TRIM('           TEST          ') "COL1"
,      LTRIM('           TEST          ') "COL2"
,      RTRIM('           TEST          ') "COL3"
FROM DUAL;
--==>> TEST	TEST          	           TEST




--------------------------------------------------------------------------------

--■■■ 그룹 함수 ■■■--

-- SUM() 합, AVG() 평균, COUNT() 카운트, MAX() 최대값, MIN() 최소값
-- , VARIENCE() 분산, STDDEV() 표준편차

--※ 그룹함수의 가장 큰 특징
--   처리해야할 데이터들 중 NULL이 존재한다면(포함되어 있다면)
--   이 NULL은 제외한 상태로 연산을 수행한다는 것이다.
--   즉, NULL은 연산의 대상에서 제외된다.

SELECT SAL
FROM EMP;
--==>>
/*
800
1600
1250
2975
1250
2850
2450
3000
5000
1500
1100
950
3000
1300
*/

SELECT SUM(SAL) -- 800 + 1600 + ... + 1300
FROM EMP;
--==>> 29025


SELECT COMM
FROM EMP;
--==>>
/*
(null)
300
500
(null)
1400
(null)
(null)
(null)
(null)
0
(null)
(null)
(null)
(null)
*/


SELECT SUM(COMM)   -- NULL은 연산대상에서 제외하고, 300 + 500 + 1400
FROM EMP;
--==>> 2200

--○ COUNT() 행(레코드)의 갯수 조회 -> 데이터가 몇 건인지 확인
SELECT COUNT(ENAME)     -- NULL을 제외하므로 전체 데이터 갯수가 아님을 주의
FROM EMP;
--==>> 14

SELECT COUNT(COMM)      -- NULL을 제외하므로 전체 데이터 갯수가 아님을 주의
FROM EMP;
--==>> 4

SELECT COUNT(*)
FROM EMP;
--==>> 14
-- NULL은 카운트 대상에서 제외하므로 특정 컬럼을 조회하기보다 전체를 조회하는 것이 일반적이다.


--○ AVG() 평균 반환

SELECT AVG(SAL) "COL1"
     , SUM(SAL) / COUNT(SAL) "COL2"
     , 29025 / 14 "COL3"
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286
2073.214285714285714285714285714285714286
2073.214285714285714285714285714285714286
*/

SELECT AVG(COMM) "COL1"
     , SUM(COMM) / COUNT(COMM) "COL2"
     , 2200 / 4 "COL3"    -- 논리적으로 2200을 14로 나눈 값이 아니기때문에 전체 평균이라고 할 수 없다.
     , 2200 / 14 "COL4"   -- 정답
FROM EMP;
--==>>
/*
550
550
550
157.142857142857142857142857142857142857
*/

--※ 데이터가 NULL 인 컬럼의 레코드는 연산 대상에서 제외되기 때문에 주의하여 연산처리해야 한다.


SELECT SUM(COMM) / COUNT(*) "COL1"
FROM EMP;
--==>> 157.142857142857142857142857142857142857


-- VARIANCE() / STDDEV()
--※ 표준편차의 제곱이 분산, 분산의 제곱근이 표준편차

SELECT VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>
/*

*/

SELECT POWER(STDDEV(SAL),2) "COL1"
      ,VARIANCE(SAL) "COL2"
FROM EMP;
--==>> 
/*
1398313.87362637362637362637362637362637
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL)) "COL1"
        ,STDDEV(SAL) "COL2"
FROM EMP;
--==>>
/*
1182.503223516271699458653359613061928508
1182.503223516271699458653359613061928508
*/

--MAX() / MIN()
-- 최대값 / 최소값 반환
SELECT MAX(SAL) "COL"   -- EMP 테이블에서 급여를 가장 많이 받는 직원의 급여
FROM EMP;
--==>> 5000

--※ 주의
SELECT ENAME, SUM(SAL)  -- 다중행의 레코드와 단일행의 레코드를 동시에 보려고 하는 구문은 사용불가
FROM EMP;
--==>> 에러 발생
--      (ORA-00937: not a single-group group function)


--○ GROUP BY : 그룹으로 묶어줘~
-- 다중행의 레코드와 단일행의 레코드를 동시에 보려고 하는 구문이 사용가능해진다.
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
10	8750
*/


--○ 기존 테이블 제거
DROP TABLE TBL_EMP;
--=>> Table TBL_EMP이(가) 삭제되었습니다.


--○ 실습테이블 다시 생성(복사)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.


DESC TBL_EMP;

--○ 실습 데이터 추가 입력
INSERT INTO TBL_EMP VALUES
(8001, '이윤수', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8002, '임하성', 'CLERK', 7566, SYSDATE, 2000, 10, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8003, '김민지', 'SALESMAN', 7698, SYSDATE, 1700, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8004, '정현욱', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8005, '박나영', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	800		(null)  20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	    30
7566	JONES	MANAGER	    7839	1981-04-02	2975	(null)	20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850	(null)	30
7782	CLARK	MANAGER	    7839	1981-06-09	2450	(null)	10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000	(null)	20
7839	KING	PRESIDENT		    1981-11-17	5000	(null)	10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	    7788	1987-07-13	1100	(null)	20
7900	JAMES	CLERK	    7698	1981-12-03	950		(null)  30
7902	FORD	ANALYST	    7566	1981-12-03	3000	(null)	20
7934	MILLER	CLERK	    7782	1982-01-23	1300	(null)	10
8001	이윤수	CLERK	    7566	2023-10-24	1500	(null)  10	
8002	임하성	CLERK	    7566	2023-10-24	2000	(null)  10	
8003	김민지	SALESMAN	7698	2023-10-24	1700	(null)	(null)
8004	정현욱	SALESMAN	7698	2023-10-24	2500	(null)	(null)
8005	박나영	SALESMAN	7698	2023-10-24	1000	(null)	(null)
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

SELECT DEPTNO, SAL, COMM
FROM TBL_EMP
ORDER BY COMM DESC;
--==>>
/*
20	800	
	1700	
	1000	
10	1300	
20	2975	
30	2850	
10	2450	
20	3000	
10	5000	
	2500	
20	1100	
30	950	
20	3000	
30	1250	1400
30	1250	500
30	1600	300
	1500	10
	2000	10
30	1500	0
*/

--※ 오라클에서는 NULL 을 가장 큰 값으로 간주한다.
--   (ORACLE 9i 까지는 NULL 을 가장 작은 값으로 간주했었다.)

-- MSSQL은 NULL을 가장 작은 값으로 간주한다.


--○ TBL_EMP 테이블을 대상으로 부서별 급여합 조회
--   부서번호, 급여합 항목 조회

SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>>
/*
10	8750
20	10875
30	9400
	8700            -- 부서번호가 NULL 인 사원들의 급여합
*/

SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	8700
	37725            -- 모든 부서 직원들의 급여총합
*/


SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO) ;
--==>>
/*
10	8750
20	10875
30	9400
	29025
*/

------- 내 풀이
SELECT CASE WHEN T.부서번호 IS NULL
            THEN '모든부서'
            ELSE TO_CHAR(T.부서번호) END "부서번호"
,T.급여합 "급여합"
FROM
(
    SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
    FROM EMP
    GROUP BY ROLLUP(DEPTNO)
) T;


---------- 선생님 풀이

SELECT NVL(DEPTNO, '모든부서') "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>> 에러 발생
--      (ORA-01722: invalid number)

SELECT NVL(TO_CHAR(DEPTNO), '모든부서') "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);


SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO), '모든부서') "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
----------------------------------------------

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO), '모든부서') "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
모든부서	    8700
모든부서	    37725
*/

-- GROUPING()

SELECT GROUPING(DEPTNO), DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY DEPTNO;
--==>>
/*
0	30	9400
0		8700
0	20	10875
0	10	8750
*/

SELECT GROUPING(DEPTNO), DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

--==>>
/*
0	10	8750
0	20	10875
0	30	9400
0		8700
1		37725
*/
-- GROUPING 했을 때 1번 그룹으로 묶은 것들은 0으로 반환되고, 총 2번 묶은 것들은 1로 반환되므로
-- NULL이더라도 구분할 수 있는 상황이 된다.



--○ 위에서 조회한 해당 내용을 
--==>>
/*
10	    8750
20	    10875
30	    9400
인턴  	8700
모든부서	37725
*/

SELECT NVL(TO_CHAR(DEPTNO), CASE GROUPING(DEPTNO) WHEN 0 THEN '인턴' ELSE '모든부서' END) "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);


-- 나영아 안녕^_^
-- 나 누구게~ ^^**
-- @}-^---


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'인턴')
            ELSE '모든부서' END "부서번호"
, SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
인턴  	8700
모든부서	37725
*/

--○ TBL_SAWON 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
----------  --------
   성별      급여합
----------  --------
   남         XXXX
   여         XXXX
 모든사원     XXXX
----------  --------
*/
SELECT NVL(T.성별, '모든사원') "성별",  SUM(T.급여) "급여합"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여'
                ELSE '몰라' END "성별"
                ,SAL "급여"
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.성별);
--==>>
/*
남	    16800
여	    20300
모든사원	37100
*/

SELECT *
FROM VIEW_SAWON;

--○ TBL_SAWON 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
-------  -----------
연령대     인원수
-------  -----------
10          X
20          X
50          X
전체        X
-------  -----------
*/
SELECT NVL(TO_CHAR(T.연령대),'전체') "연령대", COUNT(T.연령대) "인원수"
FROM
(
    SELECT TRUNC(CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
                      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899)
                      WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
                      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
                      ELSE -1 END,-1) "연령대"
    FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.연령대);
--==>>
/*
10	4
20	7
50	4
전체	15
*/

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 1,2;
--==>>
/*
10	CLERK	1300
10	MANAGER	2450
10	PRESIDENT	5000
20	ANALYST	6000
20	CLERK	1900
20	MANAGER	2975
30	CLERK	950
30	MANAGER	2850
30	SALESMAN	5600
*/


SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	CLERK	    1300                -- 10번 부서 CLERK 직종의 급여합
10	MANAGER	    2450                -- 10번 부서 MANAGER 직종의 급여합
10	PRESIDENT	5000                -- 10번 부서 PRESIEDENT 직종의 급여합
10		        8750                -- 10번 부서 모든 직종의 급여합
20	ANALYST	    6000                -- 20번 부서 ANALYST 직종의 급여합
20	CLERK	    1900                -- 20번 부서 CLERK 직종의 급여합
20	MANAGER	    2975                -- 20번 부서 MANAGER 직종의 급여합
20		        10875               -- 20번 부서 모든 직종의 급여합
30	CLERK	    950                 -- 30번 부서 CLERK 직종의 급여합
30	MANAGER	    2850                -- 30번 부서 MANAGER 직종의 급여합
30	SALESMAN	5600                -- 30번 부서 SALESMAN 직종의 급여합
30		        9400                -- 30번 부서 모든 직종의 급여합
                29025               -- 모든 부서 모든 직종의 급여합
*/


--○ CUBE() -> ROLLUP 보다 더 자세한 결과를 반환받는다.


SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (null)	    8750
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20		(null)      10875
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400
(null)	ANALYST	    6000            -- 모든 부서 ANALYST 직종의 급여합
(null)	CLERK	    4150            -- 모든 부서 CLERK 직종의 급여합
(null)	MANAGER	    8275            -- 모든 부서 MANAGER 직종의 급여합
(null)	PRESIDENT	5000            -- 모든 부서 PRESIDENT 직종의 급여합
(null)	SALESMAN	5600            -- 모든 부서 SALESMAN 직종의 급여합
(null)	(null)	    29025
*/

--※ ROLLUP()과 CUBE()는 그룹을 묶어주는 방식이 다르다. (차이)
-- EX. ROLLUP(A, B, C)
--     -> (A, B, C) / (A, B) / (A) / ()

--     CUBE(A, B, C)
--     -> (A, B, C) / (A, B) / (A, C) / (B, C) / (A) / (B) / (C) / ()
-- ROLLUP(롤업)은 묶음방식이 다소 모자랄 때가 있고, CUBE(큐브)는 다소 지나칠 때가 있기 때문에
-- 다음과 같은 방식의 쿼리를 더 많이 사용하게 된다.
-- 다음 작성하는 쿼리는 조회하고자 하는 그룹만
-- GROUPING SETS를 이용하여 선택적으로 묶어주는 방식이다.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') ELSE '전체부서' END "부서번호"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '전체직종' END "직종"
       ,SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	CLERK	1300
10	MANAGER	2450
10	PRESIDENT	5000
10	전체직종	8750
20	ANALYST	6000
20	CLERK	1900
20	MANAGER	2975
20	전체직종	10875
30	CLERK	950
30	MANAGER	2850
30	SALESMAN	5600
30	전체직종	9400
인턴	CLERK	3500
인턴	SALESMAN	5200
인턴	전체직종	8700
전체부서	전체직종	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') ELSE '전체부서' END "부서번호"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '전체직종' END "직종"
       ,SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	    CLERK	        1300
10	    MANAGER	        2450
10	    PRESIDENT	    5000
10	    전체직종    	    8750

20	    ANALYST	        6000
20	    CLERK	        1900
20	    MANAGER	        2975
20	    전체직종	        10875

30	    CLERK	        950
30	    MANAGER	        2850
30	    SALESMAN	    5600
30	    전체직종	        9400

인턴	    CLERK	        3500
인턴  	SALESMAN	    5200
인턴  	전체직종	        8700

전체부서	ANALYST	    6000
전체부서	CLERK	    7650
전체부서	MANAGER	    8275
전체부서	PRESIDENT	5000
전체부서	SALESMAN	10800
전체부서	전체직종	    37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') ELSE '전체부서' END "부서번호"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '전체직종' END "직종"
       ,SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())
ORDER BY 1,2;
--==>> 큐브를 사용했을 경우와 같은 조회 결과를 반환한다.


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') ELSE '전체부서' END "부서번호"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '전체직종' END "직종"
       ,SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())
ORDER BY 1,2;
--==>> 롤업을 사용했을 경우와 같은 조회 결과를 반환한다.



--------------------------------------------------------------------------------

--○ TBL_EMP 테이블을 대상으로 입사년도별 인원수를 조회한다.


SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도", COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1 ;


SELECT TO_CHAR(HIREDATE, 'YYYY') "입사년도", COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY')
ORDER BY 1 ;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2023	5
*/


-- 데이터 형식을 맞추는 것도 중요하지만 GROUP BY에서 묶어줄 때 사용한 방법을 그대로 인용해서 SELECT 에서 사용해야 한다.

SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0 
THEN EXTRACT(YEAR FROM HIREDATE) ELSE '전체'
END "입사년도", COUNT(*) 인원수
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;

-- GROUP BY로 숫자타입으로 그룹으로 묶어준 다음 SELECT 가 실행되는데, 이 때 ELSE 결과인 '전체'를 나타내주기 위한 처리로
-- GROUP BY를 사용한 것이기 때문에 처음부터 숫자 또는 문자 형태로 GROUP BY와 결과의 데이터 타입을 맞춰주어야 한다~!!!

SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0 
THEN TO_CHAR(HIREDATE, 'YYYY') ELSE '전체'
END "입사년도", COUNT(*) 인원수
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;






















