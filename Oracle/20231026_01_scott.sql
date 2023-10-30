SELECT USER
FROM DUAL;
--==>> SCOTT

--○ SELF JOIN (자기조인)

-- EMP 테이블의 데이터를 다음과 같이 조회할 수 있도록 쿼리문을 구성한다.

/*
------------------------------------------------------------------------
사원번호   사원명  직종명  관리자번호  관리자명   관리자직종명
------------------------------------------------------------------------
SMITH      SMITH  CLERK   7902        FORD       ANALYST
*/

-- JOIN 사용법

--SELECT *
--FROM TBL_EMP E, TBL_DEPT D
--WHERE E.DEPTNO = D.DEPTNO;

--SELECT *
--FROM TBL_EMP E (LEFT, RIGHT, FULL)JOIN TBL_DEPT D
--ON E.DEPTNO = D.DEPTNO;

SELECT P.EMPNO 사원번호, P.ENAME 사원명, P.JOB 직종명, P.MGR 관리자번호, E.ENAME 관리자명, E.JOB 관리자직종명
FROM EMP P LEFT JOIN EMP E
ON E.EMPNO = P.MGR;












