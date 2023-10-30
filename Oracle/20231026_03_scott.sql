SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ UNION / UNION ALL ■■■--


--○ 실습 테이블 생성(테이블명 : TBL_JUMUN)
CREATE TABLE TBL_JUMUN                  -- 주문 테이블 생성
( JUNO      NUMBER                      -- 주문 번호
, JECODE    VARCHAR2(30)                -- 주문 코드
, JUSU      NUMBER                      -- 주문 수량
, JUDAY     DATE  DEFAULT SYSDATE       -- 주문 일자
);
--==>> Table TBL_JUMUN이(가) 생성되었습니다.
-- 고객의 주문이 발생(접수)되었을 경우
-- 주문 내용에 대한 데이터가 입력될 수 있도록 처리하는 테이블


-- 실습 진행 간 제품코드()에는
-- 편의상 제품의 코드를 참조한다고 가정하고 제품의 이름을 입력한다.


--○ 데이터 입력 -> 고객의 주문 발생(접수)
INSERT INTO TBL_JUMUN
VALUES(1, '포스틱', 20, TO_DATE('2001-11-01 09:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(2, '빅파이', 10, TO_DATE('2001-11-01 10:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(3, '사또밥', 30, TO_DATE('2001-11-01 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(4, '포카칩', 20, TO_DATE('2001-11-02 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(5, '포카칩', 30, TO_DATE('2001-11-03 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(6, '빅파이', 20, TO_DATE('2001-11-04 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(7, '홈런볼', 10, TO_DATE('2001-11-05 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(8, '홈런볼', 10, TO_DATE('2001-11-06 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(9, '오예스', 20, TO_DATE('2001-11-07 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(10, '사또밥', 10, TO_DATE('2001-11-08 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(11, '빼빼로', 20, TO_DATE('2001-11-09 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(12, '감자깡', 10, TO_DATE('2001-11-10 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(13, '빼빼로', 20, TO_DATE('2001-11-11 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(14, '홈런볼', 20, TO_DATE('2001-11-12 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(15, '포카칩', 10, TO_DATE('2001-11-13 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(16, '포카칩', 20, TO_DATE('2001-11-16 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(17, '마이쮸', 20, TO_DATE('2001-11-17 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(18, '맛동산', 30, TO_DATE('2001-11-18 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(19, '맛동산', 20, TO_DATE('2001-11-19 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN
VALUES(20, '꼬북칩', 30, TO_DATE('2001-11-20 11:10:10', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 행 이(가) 삽입되었습니다. * 20

--○ 커밋
COMMIT;
--==>> 커밋 완료.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	포스틱	20	2001-11-01 09:10:10
2	빅파이	10	2001-11-01 10:10:10
3	사또밥	30	2001-11-01 11:10:10
4	포카칩	20	2001-11-02 11:10:10
5	포카칩	30	2001-11-03 11:10:10
6	빅파이	20	2001-11-04 11:10:10
7	홈런볼	10	2001-11-05 11:10:10
8	홈런볼	10	2001-11-06 11:10:10
9	오예스	20	2001-11-07 11:10:10
10	사또밥	10	2001-11-08 11:10:10
11	빼빼로	20	2001-11-09 11:10:10
12	감자깡	10	2001-11-10 11:10:10
13	빼빼로	20	2001-11-11 11:10:10
14	홈런볼	20	2001-11-12 11:10:10
15	포카칩	10	2001-11-13 11:10:10
16	포카칩	20	2001-11-16 11:10:10
17	마이쮸	20	2001-11-17 11:10:10
18	맛동산	30	2001-11-18 11:10:10
19	맛동산	20	2001-11-19 11:10:10
20	꼬북칩	30	2001-11-20 11:10:10
*/

--○ 추가 데이터 입력 -> 2001년 부터 시작된 주문이 현재(2023년)까지 계속 발생~!!! 진행중!

INSERT INTO TBL_JUMUN VALUES(98764, '꼬북칩', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98765, '빼빼로', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98766, '빼빼로', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98767, '에이스', 40, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98768, '홈런볼', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98769, '감자깡', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98770, '맛동산', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98771, '웨하스', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98772, '맛동산', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98773, '오레오', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98774, '빼빼로', 50, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98775, '오감자', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	    포스틱	20	2001-11-01 09:10:10
2	    빅파이	10	2001-11-01 10:10:10
3	    사또밥	30	2001-11-01 11:10:10
4	    포카칩	20	2001-11-02 11:10:10
5	    포카칩	30	2001-11-03 11:10:10
6	    빅파이	20	2001-11-04 11:10:10
7	    홈런볼	10	2001-11-05 11:10:10
8	    홈런볼	10	2001-11-06 11:10:10
9	    오예스	20	2001-11-07 11:10:10
10	    사또밥	10	2001-11-08 11:10:10
11	    빼빼로	20	2001-11-09 11:10:10
12	    감자깡	10	2001-11-10 11:10:10
13	    빼빼로	20	2001-11-11 11:10:10
14	    홈런볼	20	2001-11-12 11:10:10
15	    포카칩	10	2001-11-13 11:10:10
16	    포카칩	20	2001-11-16 11:10:10
17	    마이쮸	20	2001-11-17 11:10:10
18	    맛동산	30	2001-11-18 11:10:10
19	    맛동산	20	2001-11-19 11:10:10
20	    꼬북칩	30	2001-11-20 11:10:10
        
98764	꼬북칩	10	2023-10-26 12:46:19
98765	빼빼로	30	2023-10-26 12:46:55
98766	빼빼로	20	2023-10-26 12:47:24
98767	에이스	40	2023-10-26 12:47:54
98768	홈런볼	10	2023-10-26 12:48:14
98769	감자깡	20	2023-10-26 12:48:39
98770	맛동산	10	2023-10-26 12:49:02
98771	웨하스	20	2023-10-26 12:49:27
98772	맛동산	30	2023-10-26 12:49:44
98773	오레오	20	2023-10-26 12:50:07
98774	빼빼로	50	2023-10-26 12:50:29
98775	오감자	10	2023-10-26 12:50:53
*/


--※ 현욱이가 과자 쇼핑몰 운영 중...
--   TBL_JUMUN 테이블이 무거워진 상황
--   어플리케이션과의 연동으로 인해 주문 내역을 앞으로는 다른 테이블에 저장될 수 있도록
--   만드는 것은 거의 불가능한 상황
--   기존의 모든 데이터를 덮어놓고 지우는 것도 불가능한 상황
--   결과적으로... 현재까지 누적된 주문 데이터 중 금일 발생한 주문내역을 제외하고
--   TBL_JUMUN 테이블의 나머지 데이터를 다른 테이블(TBL_JUMUNBACKUP)로 이관하자~!





SELECT *
FROM TBL_JUMUN;



CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> Table TBL_JUMUNBACKUP이(가) 생성되었습니다.


SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	포스틱	20	2001-11-01 09:10:10
2	빅파이	10	2001-11-01 10:10:10
3	사또밥	30	2001-11-01 11:10:10
4	포카칩	20	2001-11-02 11:10:10
5	포카칩	30	2001-11-03 11:10:10
6	빅파이	20	2001-11-04 11:10:10
7	홈런볼	10	2001-11-05 11:10:10
8	홈런볼	10	2001-11-06 11:10:10
9	오예스	20	2001-11-07 11:10:10
10	사또밥	10	2001-11-08 11:10:10
11	빼빼로	20	2001-11-09 11:10:10
12	감자깡	10	2001-11-10 11:10:10
13	빼빼로	20	2001-11-11 11:10:10
14	홈런볼	20	2001-11-12 11:10:10
15	포카칩	10	2001-11-13 11:10:10
16	포카칩	20	2001-11-16 11:10:10
17	마이쮸	20	2001-11-17 11:10:10
18	맛동산	30	2001-11-18 11:10:10
19	맛동산	20	2001-11-19 11:10:10
20	꼬북칩	30	2001-11-20 11:10:10
*/
-- TBL_JUMUN 테이블의 데이터들 중 금일 주문 내역 이외의 데이터는 모두 TBL_JUMBACKUP 테이블에
-- 백업을 마친 상태~!!!

-- TBL_JUMUN 테이블의 데이터들 중
-- 백업을 마친 데이터들... 즉, 금일 발생한 주문내역이 아닌 데이터를 제거


DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');
--==>> 20개 행 이(가) 삭제되었습니다.
--     (-> 93763 개의 데이터 삭제~!)
--==>>
/*
98764	꼬북칩	10	2023-10-26 12:46:19
98765	빼빼로	30	2023-10-26 12:46:55
98766	빼빼로	20	2023-10-26 12:47:24
98767	에이스	40	2023-10-26 12:47:54
98768	홈런볼	10	2023-10-26 12:48:14
98769	감자깡	20	2023-10-26 12:48:39
98770	맛동산	10	2023-10-26 12:49:02
98771	웨하스	20	2023-10-26 12:49:27
98772	맛동산	30	2023-10-26 12:49:44
98773	오레오	20	2023-10-26 12:50:07
98774	빼빼로	50	2023-10-26 12:50:29
98775	오감자	10	2023-10-26 12:50:53
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--※ 아직 제품 발송이 이루어지지 않은 금일 주문 데이터를 제외하고
--   이전의 모든 주문 데이터들이 삭제된 상황이므로
--   테이블은 행(레코드)의 갯수가 줄어들어 매우 가벼워진 상황이다.

-- 그런데, 지금까지 주문받은 내역에 대한 정보를
-- 제품별 총 주문량으로 나타내어야 할 상황이 발생하게 되었다.
-- TBL_JUMUN 테이블의 TBL_JUMUNBACKUP 테이블의 레코드(행)와
-- TBL_JUMUN 테이블의 레코드(행)을 모두 합쳐
-- 하나의 테이블을 조회하는 것과 같은 결과를 확인할 수 있도록
-- 조회가 이루어져야 한다.

--※ 컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우
--   JOIN을 사용하지만
--  레코드와 레코드를 결합하고자 하는 경우
--  UNION / UNION ALL 을 사용할 수 있다.


SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;
-- 둘 다 같은 결과가 나온다.
--==>>
/*
1	    포스틱	20	2001-11-01 09:10:10
2	    빅파이	10	2001-11-01 10:10:10
3	    사또밥	30	2001-11-01 11:10:10
4	    포카칩	20	2001-11-02 11:10:10
5	    포카칩	30	2001-11-03 11:10:10
6	    빅파이	20	2001-11-04 11:10:10
7	    홈런볼	10	2001-11-05 11:10:10
8	    홈런볼	10	2001-11-06 11:10:10
9	    오예스	20	2001-11-07 11:10:10
10	    사또밥	10	2001-11-08 11:10:10
11	    빼빼로	20	2001-11-09 11:10:10
12	    감자깡	10	2001-11-10 11:10:10
13	    빼빼로	20	2001-11-11 11:10:10
14	    홈런볼	20	2001-11-12 11:10:10
15	    포카칩	10	2001-11-13 11:10:10
16	    포카칩	20	2001-11-16 11:10:10
17	    마이쮸	20	2001-11-17 11:10:10
18	    맛동산	30	2001-11-18 11:10:10
19	    맛동산	20	2001-11-19 11:10:10
20	    꼬북칩	30	2001-11-20 11:10:10
98764	꼬북칩	10	2023-10-26 12:46:19
98765	빼빼로	30	2023-10-26 12:46:55
98766	빼빼로	20	2023-10-26 12:47:24
98767	에이스	40	2023-10-26 12:47:54
98768	홈런볼	10	2023-10-26 12:48:14
98769	감자깡	20	2023-10-26 12:48:39
98770	맛동산	10	2023-10-26 12:49:02
98771	웨하스	20	2023-10-26 12:49:27
98772	맛동산	30	2023-10-26 12:49:44
98773	오레오	20	2023-10-26 12:50:07
98774	빼빼로	50	2023-10-26 12:50:29
98775	오감자	10	2023-10-26 12:50:53
*/



SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;


SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;



--※ UNION -- 첫번째 컬럼 기준으로 오름차순 정렬이 됨, 중복되는 레코드(행)은 제외하고 결과를 출력함
--※ UNION ALL -- 쿼리문에서 테이블을 명시한 순서(결합한 순서)대로 조회한 결과를 반환함, 중복되는 레코드(행)을 포함하여 결과 출력함
-- 정렬, 중복 비교가 포함된 기능은 부하가 발생하므로 실무에서는 리소스 소모가 적은 UNION ALL을 더 많이 사용함



--○ 지금까지 주문받은 데이터를 통해
--   제품별 총 주문량을 조회할 수 있는 쿼리문을 구성한다.

SELECT T.JECODE, SUM(T.JUSU)
FROM
(
    SELECT *
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT *
    FROM TBL_JUMUN
) T
GROUP BY JECODE
ORDER BY 2 DESC;
--==>>
/*
빼빼로	140
맛동산	90
포카칩	80
홈런볼	50
사또밥	40
꼬북칩	40
에이스	40
빅파이	30
감자깡	30
웨하스	20
포스틱	20
오예스	20
마이쮸	20
오레오	20
오감자	10
*/


--○ INTERSECT / MINUS (교집합 / 차집합(테이블 합에서 교집합 제외한 것))

-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
-- 제품코드와 주문수량의 값이 똑같은 행만 추출해서 조회하고자 한다.


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
맛동산	30
빼빼로	20
홈런볼	10
*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
감자깡	10
꼬북칩	30
마이쮸	20
맛동산	20
빅파이	10
빅파이	20
사또밥	10
사또밥	30
오예스	20
포스틱	20
포카칩	10
포카칩	20
포카칩	30
홈런볼	20
*/


-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블을 대상으로
-- 제품코드와 주문량의 값이 똑같은 행의 정보를
-- 주문번호, 제품코드, 주문량, 주문일자 항목으로 조회한다.




SELECT *
FROM TBL_JUMUNBACKUP;

SELECT *
FROM TBL_JUMUN;



-- 첫번째 방법 풀이
SELECT T.*
FROM
(
    SELECT *
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT *
    FROM TBL_JUMUN
) T
WHERE (T.JECODE, T.JUSU) IN (SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN);



-- 두번째 방법 풀이

SELECT T1.*
FROM
(
    SELECT *
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT *
    FROM TBL_JUMUN
) T1
JOIN
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE AND T1.JUSU = T2.JUSU;


-- 세번째 방법
SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
)T
WHERE CONCAT(T.JECODE, T.JUSU) -- CONCAT 활용
IN (
    SELECT CONCAT(JECODE, JUSU)
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT CONCAT(JECODE, JUSU)
    FROM TBL_JUMUN
);


-------------------------------------------------------------------------------

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/


SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D;
--==>> 에러 발생
--     (ORA-00905: missing keyword)

--○ NATURAL JOIN
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E NATURAL JOIN DEPT D;
--==>> 
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/
-- 오라클에게 알아서 JOIN 해줘~
--> 확인하는 용도로 쓰는 것이 아니라 프로그램을 구성할 때
-- 이러한 방식으로 오라클에게 모두 맡기는 것은 바람직하지 않다.

--○ USING
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
USING(DEPTNO);
-- 오라클은 내부적으로 WHERE 조건절이 있는 형태로 변환과정을 한 번 거치는 과정이
-- 포함됨을 유의할 것


--------------------------------------------------------------------------------
SELECT *
FROM TBL_EMP;

--○ TBL_EMP 테이블에서 급여가 가장 많은 사원의 사원번호, 사원명, 직종명, 급여 항목을 조회한다.

-- 방법 1
SELECT T.EMPNO, ENAME, JOB, SAL
FROM
(
    SELECT EMPNO, ENAME, JOB, SAL, RANK() OVER(ORDER BY SAL DESC) "랭크"
    FROM TBL_EMP
)T
WHERE T.랭크 =1;
--==>> 7839	KING	PRESIDENT	5000

-- 방법 2
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL IN(SELECT MAX(SAL) FROM TBL_EMP);
--==>> 7839	KING	PRESIDENT	5000


--○ 『=ANY』

--○ 『=ALL』
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (급여를 가장 많이 받는 사원의 급여);


SELECT SAL
FROM TBL_EMP;


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL =ANY (800, 1600, 1250, 2975, 2850, 2450, 3000, 5000, 1500,1100, 950, 1300, 2000, 1700, 2500, 1000);


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >=ALL (800, 1600, 1250, 2975, 2850, 2450, 3000, 5000, 1500,1100, 950, 1300, 2000, 1700, 2500, 1000);

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >=ALL (SELECT SAL FROM TBL_EMP);



--○ TBL_EMP 테이블에서 20번 부서에 근무하는 사람 중 급여가 가장 많은 사원의 사원번호, 사원명, 직종명, 급여 항목을 조회한다.

-- 첫번째 방법
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE DEPTNO = 20                                               -- DEPTNO가 20인 사람이면서
AND SAL >=ALL (SELECT SAL FROM TBL_EMP WHERE DEPTNO = 20);      -- DEPTNO가 20인 사람들의 급여들보다 높은 급여를 가진..


-- 두번째 방법
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE DEPTNO = 20
AND SAL = (SELECT MAX(SAL) FROM TBL_EMP WHERE DEPTNO = 20);



