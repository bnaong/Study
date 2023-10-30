SELECT USER
FROM DUAL;
--==>> HR

--○ 세 개 이상의 테이블 조인(JOIN, 결합)

-- 형식 1. (SQL 1992 CODE)

SELECT 테이블명1.컬럼명, 테이블명2.컬렴명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3,....
WHERE 테이블명1.컬럼명1 = 테이블명2.컬럼명1
AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;



-- 형식 2. (SQL 1999 CODE)

SELECT 테이블명1.컬럼명, 테이블명2.컬렴명, 테이블명3.컬럼명
FROM 테이블명1 JOIN 테이블명2
ON 테이블명1.컬럼명1 = 테이블명2.컬럼명1
        JOIN 테이블명3
        ON 테이블명2.컬럼명2 = 테이블명3.컬럼명2;



--○ HR 계정 소유의 테이블 또는 뷰 목록 조회
SELECT *
FROM TAB;
--==>>
/*
COUNTRIES	        TABLE	
DEPARTMENTS	        TABLE	
EMPLOYEES	        TABLE	
EMP_DETAILS_VIEW	VIEW	
JOBS	            TABLE	
JOB_HISTORY	        TABLE	
LOCATIONS	        TABLE	
REGIONS	            TABLE	
*/


--○ HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENTS 테이블을 대상으로
--   직원들의 데이터를 
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME 항목으로 조회한다.

SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

-- 직종 테이블과 직원 테이블에 JOB_ID 컬럼이 겹침
-- 직원 테이블과 부서 테이블에 DEPARTMENT_ID 컬럼이 겹침

-- 92 CODE 방법
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM JOBS "J", EMPLOYEES "E", DEPARTMENTS "D"
WHERE J.JOB_ID = E.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);




-- 99 CODE 방법
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM JOBS "J"JOIN EMPLOYEES "E"
ON J.JOB_ID = E.JOB_ID
    LEFT JOIN DEPARTMENTS "D"
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

SELECT *
FROM LOCATIONS;

SELECT *
FROM COUNTRIES;

SELECT *
FROM REGIONS;

-- 직종 테이블J과 직원 테이블E은 JOB_ID 중복

-- 직원 테이블E과 부서 테이블D은 DEPARTMENT_ID 중복

-- 부서 테이블D과 위치 테이블L은 LOCATION_ID 중복

-- 위치 테이블L과 도시 테이블C은 COUNTRY_ID 중복

-- 도시 테이블C과 지역 테이블R은 REGION_ID 중복

-- EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES, REGIONS
-- 직원들의 데이터를 다음과 같이 조회한다.
-- FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGRION_NAME


-- 92 CODE 방법

SELECT FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
FROM EMPLOYEES "E", DEPARTMENTS "D", JOBS "J", LOCATIONS "L", COUNTRIES "C", REGIONS "R"
WHERE E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+)
AND L.COUNTRY_ID = C.COUNTRY_ID(+)
AND C.REGION_ID = R.REGION_ID(+)
ORDER BY 1;


-- 99 CODE 방법
SELECT FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
FROM EMPLOYEES "E" LEFT JOIN DEPARTMENTS "D"
                        ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                  LEFT JOIN JOBS "J" 
                        ON E.JOB_ID = J.JOB_ID
                  LEFT JOIN LOCATIONS "L"
                        ON D.LOCATION_ID = L.LOCATION_ID
                  LEFT JOIN COUNTRIES "C"
                        ON L.COUNTRY_ID = C.COUNTRY_ID
                  LEFT JOIN REGIONS "R"
                        ON C.REGION_ID = R.REGION_ID
ORDER BY 1;





