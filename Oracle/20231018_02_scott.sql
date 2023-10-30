--�� ���ӵ� ����� ���� ��ȸ
SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���̺� ����(DEPT)
DROP TABLE DEPT;
CREATE TABLE DEPT
( DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY
, DNAME VARCHAR2(14)
, LOC VARCHAR2(13) 
) ;
--==>> Table DEPT��(��) �����Ǿ����ϴ�.


--�� ���̺� ����(EMP)
CREATE TABLE EMP
( EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
--==>> Table EMP��(��) �����Ǿ����ϴ�.


INSERT INTO DEPT VALUES	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES	(40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 18


--�� ���̺� ����(BONUS)
CREATE TABLE BONUS
( ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, SAL NUMBER
, COMM NUMBER
) ;
--==>> Table BONUS��(��) �����Ǿ����ϴ�.


--�� ���̺� ����(SALGRADE)
CREATE TABLE SALGRADE
( GRADE NUMBER
, LOSAL NUMBER
, HISAL NUMBER 
);
--==>> Table SALGRADE��(��) �����Ǿ����ϴ�.


INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� SCOTT ������ �����ִ� ���̺� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
BONUS	    TABLE	
DEPT	    TABLE	
EMP	        TABLE	
SALGRADE	TABLE	
*/

SELECT *
FROM USER_TABLES;
--==>>
/*
DEPT	    USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
EMP	        USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
BONUS	    USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
SALGRADE	USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
*/


--�� ������ ��ȸ�� ������ ���̺����
--   � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	    USERS
EMP	        USERS
BONUS	    USERS
SALGRADE	USERS
*/

--�� ���̺� ����(TBL_EXAMPLE1)
CREATE TABLE TBL_EXAMPLE1
( NO NUMBER(4)
, NAME VARCHAR2(20)
, ADDR VARCHAR2(20)
);
--==>> Table TBL_EXAMPLE1��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(TBL_EXAMPLE2)
CREATE TABLE TBL_EXAMPLE2
( NO NUMBER(4)
, NAME VARCHAR2(20)
, ADDR VARCHAR2(20)
) TABLESPACE TBS_EDUA;
--==>> Table TBL_EXAMPLE2��(��) �����Ǿ����ϴ�.

--�� TBL_EXAMPLE1 �� TBL_EXAMPLE2 ���̺���
--   ���� � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT        	USERS
EMP         	USERS
BONUS       	USERS
SALGRADE	    USERS
TBL_EXAMPLE1	USERS           --> �������� ������ DEFAULT TABLESPACE �� ���������.
TBL_EXAMPLE2	TBS_EDUA        --> �����ϸ� �ش�Ǵ� TABLESPACE �� ���������.
*/

--------------------------------------------------------------------------------

--���� ������ �����ͺ��̽�(RDBMS) ����--

-- ������ �����͸� ���̺��� ���·� ������� �����س��� ����
-- �׸��� �̵� ������ ���̺�� ���� ���踦 �����Ͽ� ������� ���� ����

/*================================== �ܿ�~!!!!!!!!!!!
�� SELECT ���� ó��(PARSING) ����      + -> �������� �������� �ִ� �ɼǸ�

    SELECT �÷���  -- �릤
    FROM ���̺��  -- �禥
    WHERE ������   -- �� +              ���ǿ� �´� �ֵ鸸 �޸𸮿� �÷� 
    GROUP BY ��    -- �� +              �׿� �ش��ϴ� �ֵ��� �׷����� ����
    HAVING ������  -- �� +
    ORDER BY ��    -- �� +              ���Ŀ� �����ϴ� ��
    
==================================*/

--�� SCOTT ������ ���̺� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
BONUS	        TABLE	-- ���ʽ�(BONUS) ������ ���̺�
DEPT	        TABLE	-- �μ�(DEPARTMENT) ������ ���̺�
EMP         	TABLE	-- ���(EMPLOYEES) ������ ���̺�
SALGRADE    	TABLE   -- �޿�(SAL) ������ ���̺�

TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
*/

SELECT *
FROM BONUS;
--==>> ��ȸ ��� ����(��ȸ�� �����Ͱ� �������� ����)

SELECT *
FROM DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/



SELECT *
FROM EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	800		        20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500 	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		    30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	    7788	1987-07-13	1100		    20
7900	JAMES	CLERK	    7698	1981-12-03	950		30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
*/

SELECT *
FROM SALGRADE;
--==>>
/*
1	700	    1200
2	1201	1400
3	1401	2000
4	2001	3000
5	3001	9999
*/

--�� DEPT ���̺� �����ϴ� �÷��� ���� Ȯ��
DESCRIBE DEPT;
--=>>
/*
�̸�     ��?       ����          -> ��? : ���λ��¸� �����ϴ� �÷��̴�?      
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13)
*/

-- DEPTNO   DNAME   LOC
-- �μ���ȣ �μ���  �μ���ġ
--------------------------------
-- 10       �λ��  ����          -> ������ �Է� ����
-- 20               ����          -> ������ �Է� ����
--          ���ߺ�  ���          -> ������ �Է� �Ұ���

--------------------------------------------------------------------------------

--���� ����Ŭ�� �ֿ� �ڷ���(DATA TYPE) ����--
/*
cf) MSSQL ������ ���� ǥ�� Ÿ��
    tinyint     0  ~ 255            1Byte
    smalint     -32,768 ~ 32,767    2Byte
    int         -21�� ~ 21��        4Byte
    bigint      ��û ŭ             8Byte
    
    MSSQL ������ �Ǽ� ǥ�� Ÿ��
    float, real
    
    MSSQL ������ ���� ǥ�� Ÿ��
    decimal, numeric
    
    MSSQL ������ ���� ǥ�� Ÿ��
    char, varchar Nvarchar
    
�� ORACLE �� ���� ǥ�� Ÿ���� �� ������ ���ϵǾ� �ִ�.

1. ������ NUMBER           -> -10�� 38��-1 ~ 10�� 38��
          NUMBER(3)        -> -999 ~ 999
          NUMBER(4)        -> -9999 ~ 9999
          NUMBER(4, 1)     -> -999.9 ~ 999.9 (����, �Ҽ������� ���° �ڸ����� ǥ������)
--==> ���̸� ����ؾ� ���ҽ� �Ҹ� ����!

�� ORACLE �� ���� ǥ�� Ÿ��

2. ������ CHAR             -> ������ ũ��
                              (������ ������ ũ�� �Ҹ�)
          CHAR(10)         <- '������' : ���� �����ʹ� 6byte, �����ϴ� ���� 10byte�̴�.(10byte�� �Ҹ���)
          CHAR(10)         <- '���赿��' : ���� �����ʹ� 10byte, �����ϴ� �͵� 10byte�̴�.(10byte�� �Ҹ���)
          CHAR(10)         <- '������赿��' : 10byte�� �ʰ��ϹǷ� �ԷºҰ�
          �ڷᱸ���� ȿ������ ������ CHAR �� �� ȿ������ ����. 
          -----------------------------------------------------------------------------------------------------------------------
          VARCHAR2         -> ������ ũ��
                              (��Ȳ�� ���� ũ�Ⱑ ����)
                              
          VARCHAR2(10)     <- '������' : ���� �����ʹ� 6byte, �����ϴ� ���� 6byte�̴�.(6byte�� �Ҹ���)
          VARCHAR2(10)     <- '���赿��' : ���� �����ʹ� 10byte, �����ϴ� �͵� 10byte�̴�.(10byte�� �Ҹ���)
          VARCHAR2(10)     <- '������赿��' : 10byte�� �ʰ��ϹǷ� �ԷºҰ� ==> �������̳� �������̳Ŀ� ��������� �� �� ����
          -----------------------------------------------------------------------------------------------------------------------
          NCHAR             -> ������ ũ��(�����ڵ���. ��, byte�� �ƴ� ���ڼ��� Ȯ��)
          NCHAR(10)         <- �ѱ�,����,���� ��� 10���� ����
          NVARCHAR2         -> ������ ũ��(�����ڵ���. ��, byte�� �ƴ� ���ڼ��� Ȯ��)
          NVARCHAR2(10)     <- �ѱ�,����,���� ��� 10���� ����
          -----------------------------------------------------------------------------------------------------------------------
3. ��¥�� DATE
*/

SELECT HIREDATE
FROM EMP;

-- �� ��¥ ���Ŀ� ���� ���� ���� ����
--ALTER SESSION SET NLS_DATE_FORMAT='MM/DD'
--SESSION �̶�..? -> ����Ŭ�� �����Ͽ� �����ϴ� ������ �̷��� �����Ұž�~
--SQU DEVELOPER�� ���� �����س��� ���̹Ƿ� �ڹٸ� ���� ����Ŭ���� DATE�� �ҷ����� �� �ٸ� �������� �����͸� ������ �� �ִ�.

--�� EMP ���̺� �����ϴ� �÷��� ���� Ȯ��
DESC EMP;
--==>> 
/*
�̸�       ��?       ����           
-------- -------- ------------  
            :
HIREDATE          DATE         
            :
*/


SELECT SYSDATE
FROM DUAL;
--==>> 2023-10-18


-- �� ��¥ ���Ŀ� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE
FROM DUAL;
--==>> 2023-10/18 12:05:31

-- �� ��¥ ���Ŀ� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE
FROM DUAL;
--==>> 2023-10/18 12:06:02


--�� EMP ���̺��� �����ȣ, �����, �޿�, Ŀ�̼� �����͸� ��ȸ�Ѵ�.
SELECT EMPNO, ENAME, SAL, COMM
FROM EMP;
--==>>
/*
7369	SMITH	800	
7499	ALLEN	1600	300
7521	WARD	1250	500
7566	JONES	2975	
7654	MARTIN	1250	1400
7698	BLAKE	2850	
7782	CLARK	2450	
7788	SCOTT	3000	
7839	KING	5000	
7844	TURNER	1500	0
7876	ADAMS	1100	
7900	JAMES	950	
7902	FORD	3000	
7934	MILLER	1300	
*/

--�� EMP ���̺��� �μ���ȣ�� 20���� �������� �����͵� ��
--   �����ȣ, �����, ����, �޿�, �μ���ȣ ��ȸ

SELECT �����ȣ, �����, ����, �޿�, �μ���ȣ ��ȸ
FROM EMP
WHERE �μ���ȣ�� 20;

--SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
--FROM EMP
--WHERE DEPTNO == 20;
--=>> ���� �߻�

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;
--=>>
/*
7369	SMITH	CLERK	800	    20
7566	JONES	MANAGER	2975	20
7788	SCOTT	ANALYST	3000	20
7876	ADAMS	CLERK	1100	20
7902	FORD	ANALYST	3000	20
*/

SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB ������, SAL "��   ��", DEPTNO "�μ� ��ȣ"
FROM EMP;

--�� ���̺��� ��ȸ�ϴ� ��������
--   �� �÷��� �̸����� ��Ī(ALIAS)�� �ο��� �� �ִ�.
--   �⺻ ������ ������ ���÷��� AS "��Ī�̸�"���� ���·� �ۼ��Ǹ�
--   �� ��, ��AS���� ������ �����ϴ�.
--   ����, ��Ī �̸��� ���δ� ��""���� ������ ����������, ��Ī ������ ���� ����� �Ұ����ϰ� �ȴ�.
--   ������ ������ �ش� �÷��� ǥ���� ���� ������ �ǹ��ϹǷ�
--   ��Ī(ALIAS)�� �̸� ���ο� ������ ����ؾ� �� ���
--   ��""���� ����Ͽ� ��Ī�� �ο��� �� �ֵ��� �Ѵ�.

--�� EMP ���̺���                                               -> FROM EMP
--   �μ���ȣ�� 20���� 30�� �������� �����͵� ��                  -> ����
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.    -> SELECT �÷���
--   ��, ��Ī(ALIAS)�� ����Ѵ�.

SELECT *
FROM EMP;

SELECT EMPNO �����ȣ, ENAME �����, JOB ������, SAL �޿�, DEPTNO �μ���ȣ
FROM EMP
WHERE DEPTNO = 20 || DEPTNO = 30;
--==>> ���� �߻�


SELECT EMPNO �����ȣ, ENAME �����, JOB ������, SAL �޿�, DEPTNO �μ���ȣ
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST 	3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST	    3000	20
*/

--�� ���� ������ IN �����ڸ� Ȱ���Ͽ�
--   ������ ���� ó���� �� ������
--   �� ������ ó������� ���� ����� ��ȯ�Ѵ�.

SELECT EMPNO �����ȣ, ENAME �����, JOB ������, SAL �޿�, DEPTNO �μ���ȣ
FROM EMP
WHERE DEPTNO IN(20,30);
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST 	3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST	    3000	20
*/

--�� EMP ���̺��� ������ CLERK �� ������� �����͸� ��� ��ȸ�Ѵ�.
SELECT *
FROM EMP
WHERE JOB = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		    20
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	950		    30
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10
*/

SELECT *
FROM EMP
WHERE JOB IN('CLERK');

SELECT *
FROM EMP
WHERE JOB = 'clerk';
--==>> ������ ��ȸ �ȵ�

SELECT *
FROM EMP
WHERE JOB = 'Clerk';
--==>> ������ ��ȸ �ȵ�

--�� ����Ŭ���� �Էµ� �������� �� ��ŭ�� �ݵ�� ��ҹ��� ������ �Ѵ�.

--�� EMP ���̺��� ������ CLERK �� ����� ��
--   20�� �μ��� �ٹ��ϴ� �������
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
--   ALIAS ���~!!!


SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	800	    20
7876	ADAMS	CLERK	1100	20
*/

--�� EMP ���̺��� ������ �����͸� Ȯ���ؼ�
--   �̿� �Ȱ��� �����Ͱ� ����ִ� ���̺��� ������ �����Ѵ�.
--   (������... EMP1, EMP2, EMP3, EMP4)

DESC EMP;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)
*/

--2. ��� ���̺��� ������ ���� ���ο� ���̺� ����
CREATE TABLE EMP4
( EMPNO NUMBER(4)
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2)
);

INSERT INTO EMP4 VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP4 VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP4 VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);

SELECT *
FROM EMP4;

COMMIT;

--1. ������ ��� ���̺� ���� Ȯ��
DESC EMP;


--2. ��� ���̺��� ������ ���� ���ο� ���̺� ����
CREATE TABLE EMP5
( EMPNO     NUMBER(4)
, ENAME     VARCHAR2(10)
, JOB       VARCHAR2(9)
, MGR       NUMBER(4)
, HIREDATE  DATE
, SAL       NUMBER(7,2)
, COMM      NUMBER(7,2)
, DEPTNO    NUMBER(2)
);
--==>> Table EMP5��(��) �����Ǿ����ϴ�.

SELECT *
FROM EMP5;

-- 3. ��� ���̺��� ������ ��ȸ
SELECT *
FROM EMP;
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20
7499	ALLEN	SALESMAN	7698	1981-02-20 00:00:00	1600	300	30
7521	WARD	SALESMAN	7698	1981-02-22 00:00:00	1250	500	30
7566	JONES	MANAGER	7839	1981-04-02 00:00:00	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28 00:00:00	1250	1400	30
7698	BLAKE	MANAGER	7839	1981-05-01 00:00:00	2850		30
7782	CLARK	MANAGER	7839	1981-06-09 00:00:00	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13 00:00:00	3000		20
7839	KING	PRESIDENT		1981-11-17 00:00:00	5000		10
7844	TURNER	SALESMAN	7698	1981-09-08 00:00:00	1500	0	30
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	950		30
7902	FORD	ANALYST	7566	1981-12-03 00:00:00	3000		20
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10
*/

-- 4. ��� ���̺��� �����͸� ������ ���̺� �Է�
INSERT INTO EMP5 VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP5 VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP5 VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP5 VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP5 VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP5 VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP5 VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP5 VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP5 VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP5 VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP5 VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP5 VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP5 VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP5 VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

--5. Ȯ��
SELECT *
FROM EMP5;

--6. Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��� ���̺��� ���뿡 ���� ���̺� ����(TBL_EMP)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� ��ȸ
SELECT *
FROM TBL_EMP;

--�� DEPT ���̺��� �����Ͽ� ���� ���� TBL_DEPT ���̺��� �����Ѵ�.
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ���̺��� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
DEPT	        TABLE	
EMP	            TABLE	
BONUS	        TABLE	
SALGRADE	    TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
EMP4	        TABLE	
EMP5	        TABLE	
TBL_EMP	        TABLE	
TBL_DEPT	    TABLE	
*/

--�� ���̺� ������ Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '��� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� �� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT	    TABLE	
TBL_EMP     	TABLE	��� ����
EMP5	        TABLE	
EMP4	        TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/


--�� TBL_DEPT ���̺��� ������� ���̺� ������ Ŀ��Ʈ ������ �Է� -> �μ�����
COMMENT ON TABLE TBL_DEPT IS '�μ� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.

SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT	        TABLE	    �μ� ����
TBL_EMP    	        TABLE	    ��� ����
EMP5	            TABLE	
EMP4	            TABLE	
TBL_EXAMPLE2    	TABLE	
TBL_EXAMPLE1	    TABLE	
SALGRADE        	TABLE	
BONUS	            TABLE	
EMP             	TABLE	
DEPT            	TABLE	
*/


--�� �÷�(COLUMN) ������ Ŀ��Ʈ ������ Ȯ��
SELECT *
FROM USER_COL_COMMENTS;
--==>>
/*
EMP5	        JOB	
DEPT	        LOC	
BONUS	        COMM	
TBL_EMP	        JOB	
SALGRADE	    LOSAL	
TBL_DEPT	    DNAME	
TBL_EMP 	    EMPNO	
EMP4	        EMPNO	
EMP4	        ENAME	
EMP5	        MGR	
EMP5	        EMPNO	
EMP4	        DEPTNO	
EMP	            DEPTNO	
SALGRADE	    HISAL	
EMP	            EMPNO	
TBL_EMP	        ENAME	
DEPT	        DEPTNO	
DEPT	        DNAME	
TBL_EMP	        COMM	
EMP5	        SAL	
TBL_EXAMPLE2	NO	
EMP5	        ENAME	
BONUS	        JOB	
TBL_EXAMPLE1	NO	
EMP4	        HIREDATE	
EMP	            ENAME	
EMP5	        COMM	
EMP4	        MGR	
EMP	            JOB	
TBL_EXAMPLE2	NAME	
BONUS	        SAL	
EMP	            SAL	
TBL_EMP	        MGR	
TBL_EMP	        HIREDATE	
EMP4	        SAL	
TBL_EMP	        SAL	
TBL_EMP	        DEPTNO	
EMP5	        HIREDATE	
TBL_EXAMPLE1	NAME	
TBL_DEPT	    DEPTNO	
EMP	            COMM	
SALGRADE	    GRADE	
TBL_EXAMPLE1	ADDR	
TBL_EXAMPLE2	ADDR	
EMP5	        DEPTNO	
EMP	            HIREDATE	
EMP	            MGR	
EMP4	        JOB	
TBL_DEPT	    LOC	
EMP4	        COMM	
BONUS	        ENAME	
*/


SELECT *
FROM TAB;

DROP TABLE TBL_EXAMPLE1;
--==>> Table TBL_EXAMPLE1��(��) �����Ǿ����ϴ�.


--�������� ���� ����
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

--�� �÷�(COLUMN) ������ Ŀ��Ʈ ������ Ȯ��(TBL_DEPT ���̺� �Ҽӵ� �÷��鸸 ��ȸ)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

--COMMENT ON TABLE ���̺�� IS 'Ŀ��Ʈ';

--�� ���̺� �Ҽӵ� �÷��� ���� Ŀ��Ʈ ������ �Է�
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '�μ� ��ȣ';
--==>> Comment��(��) �����Ǿ����ϴ�.

COMMENT ON COLUMN TBL_DEPT.DNAME IS '�μ� �̸�';
--==>> Comment��(��) �����Ǿ����ϴ�.

COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ� ��ġ';
--==>> Comment��(��) �����Ǿ����ϴ�.

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	�μ� ��ȣ
TBL_DEPT	DNAME	�μ� �̸�
TBL_DEPT	LOC	    �μ� ��ġ
*/

--�� TBL_EMP ���̺��� �������
--   ���̺� �Ҽӵ�(���Ե�) �÷��� ���� Ŀ��Ʈ ������ �Է�(����)
DESC TBL_EMP;
-- ��� ��ȣ, ��� �̸�, ���� �̸�, ������ �����ȣ, �Ի���, �޿�, ����, �μ� ��ȣ

COMMENT ON COLUMN TBL_EMP.EMPNO IS '��� ��ȣ';
COMMENT ON COLUMN TBL_EMP.ENAME IS '��� �̸�';
COMMENT ON COLUMN TBL_EMP.JOB IS '���� �̸�';
COMMENT ON COLUMN TBL_EMP.MGR IS '������ �����ȣ';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN TBL_EMP.SAL IS '�޿�';
COMMENT ON COLUMN TBL_EMP.COMM IS '����';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '�μ� ��ȣ';


SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP'; 
--==>>
/*
TBL_EMP	EMPNO	    ��� ��ȣ
TBL_EMP	ENAME	    ��� �̸�
TBL_EMP	JOB	        ���� �̸�
TBL_EMP	MGR	        ������ �����ȣ
TBL_EMP	HIREDATE	�Ի���
TBL_EMP	SAL     	�޿�
TBL_EMP	COMM	    ����
TBL_EMP	DEPTNO	    �μ� ��ȣ
*/

--���� �÷� ������ �߰� �� ���� ����--

SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺� �ֹε�Ϲ�ȣ �����͸� ���� �� �ִ� �÷� �߰�

SELECT '01026091830'
FROM DUAL;
--==>> 01026091830

SELECT 01026091830
FROM DUAL;
--==>> 1026091830

ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

--�� TBL_EMP ���̺��� ���� Ȯ��
DESC TBL_EMP;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
SSN         CHAR(13)   
*/
--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� ����(�߰�)�� ������ Ȯ��

-- �� ���̺� ������ �÷��� ������ ���������� �ǹ� ����. ���������� ��� ��ȸ�ϰ� �� �� �ֱ� ������ ���x

SELECT *
FROM TBL_EMP;

SELECT EMPNO, ENAME, SSN
FROM TBL_EMP;

--�� TBL_EMP ���̺� �߰��� SNN(�ֹε�Ϲ�ȣ) �÷� ����
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

DESC TBL_EMP;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2) 
*/

SELECT *
FROM TBL_EMP;
--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� ����(����)�Ǿ����� Ȯ��.

DELETE TBL_EMP;
--==>> 14�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--> ���̺��� ����(����, Ʋ)�� �״�� �����ִ� ���¿���
--  �����͸� ��� �ҽ�(����)�� ��Ȳ���� Ȯ��.


DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--==>> ���� �߻�
--     (ORA-00942: table or view does not exist)

--> ���̺� ��ü�� ���������� ���ŵ� ��Ȳ.



--�� ���̺� �ٽ� ����(����)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--�� NULL �� ó��

SELECT 10, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 10	12	8	20	5
-- ()�� ������ �켱������ ���̴� �뵵�� ����Ѵ�.

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>> (null) (null) (null) (null) (null)

--�� ������ ���
--   NULL �� ������ ���� �ǹ��ϸ�... ���� �������� �ʴ� ���̱� ������
--   �� NULL �� ���꿡 ���� �� ��� ����� ������ NULL �̴�.

-- TBL_EMP ���̺��� Ŀ�̼�(COMM, ����)�� NULL �� ������
-- �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.

SELECT ENAME �����, JOB ������, SAL �޿�, COMM Ŀ�̼�
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> ���� �߻�
--     (ORA-01722: invalid number)

DESC TBL_EMP;

SELECT ENAME �����, JOB ������, SAL �޿�, COMM Ŀ�̼�
FROM TBL_EMP
WHERE COMM IS NULL;
--==>>
/*
SMITH	CLERK	    800	
JONES	MANAGER	    2975	
BLAKE	MANAGER	    2850	
CLARK	MANAGER	    2450	
SCOTT	ANALYST	    3000	
KING	PRESIDENT	5000	
ADAMS	CLERK	    1100	
JAMES	CLERK	    950	
FORD	ANALYST	    3000	
MILLER	CLERK	    1300		
*/

--�� NULL �� ���� �����ϴ� ���� �ƴϱ� ������
--   �Ϲ����� �����ڸ� Ȱ���Ͽ� ���� �� ����.
--   NULL �� ������� ����� �� ���� �����ڵ�...
--   >=, <=, =, >, <, !=(�����ʴ�), <>(�����ʴ�), ^=(�����ʴ�) 3���� ������ ��Ȳ���� ��� ���밡���ϴ�.

--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ����� �ʴ� ��������
--   �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�.

SELECT ENAME �����, JOB ������, DEPTNO �μ���ȣ
FROM TBL_EMP
WHERE DEPTNO != 20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/


















