SELECT USER
FROM DUAL;
--==>> SCOTT


--�� TBL_EMP ���̺��� ����(Ŀ�̼�, COMM)�� ���� ���� �����
--   �����ȣ, �����, �μ���ȣ, ������, Ŀ�̼� �׸��� ��ȸ�Ѵ�.


SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM�� ���� ���� ���;

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM >=ALL(SELECT COMM FROM TBL_EMP);
--==>> ��ȸ ��� ����
-- NULL ���� ���� ���� ���� �� �� ����

-- ������Ǯ��
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM >=ALL(SELECT COMM FROM TBL_EMP WHERE COMM IS NOT NULL);


-- ù��° ���
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM >=ALL(SELECT NVL(COMM,0) FROM TBL_EMP);

-- �ι�° ���
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM = (SELECT MAX(NVL(COMM,0)) FROM TBL_EMP);
--==>> 7654	MARTIN	30	SALESMAN	1400

--�� DISTINCT() �ߺ� ��(���ڵ�)�� �����ϴ� �Լ�

SELECT DISTINCT(JOB)
FROM TBL_EMP;

SELECT DISTINCT(DEPTNO)
FROM TBL_EMP;



-- TBL_EMP ���̺��� �����ڷ� ��ϵ� �����
-- �����ȣ, �����, �������� ��ȸ�Ѵ�.

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE �����ڷ� ��ϵ� ���;

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE �����ȣ = MGR �� ��ϵ� ���;


SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE �����ȣ = (7902, 7698, 7839, 7566, NULL, 7788, 7566, 7782);

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN (7902, 7698, 7839, 7566, NULL, 7788, 7566, 7782);

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN (SELECT DISTINCT(MGR) FROM TBL_EMP); 
--==>>
/*
7902	FORD	ANALYST
7698	BLAKE	MANAGER
7839	KING	PRESIDENT
7566	JONES	MANAGER
7788	SCOTT	ANALYST
7782	CLARK	MANAGER
*/

--------------------------------------------------------------------------------

SELECT *
FROM TBL_SAWONBACKUP;


--�� TBL_SAWON ���̺� ���(������ ����--> ���̺��� ���質 ���������� ������� �̰��ϴ� ��)


CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP��(��) �����Ǿ����ϴ�.
-- ��, �ٸ� �̸��� ���̺�� ������ �� ��Ȳ



--�� ������ ����
UPDATE TBL_SAWON
SET SANAME ='�ʶ���';
--==>> 15�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.



SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	�ʶ���	9710171234567	2005-01-03	3000
1002	�ʶ���	9511182234567	1999-11-23	4000
1003	�ʶ���	9902082234567	2006-08-10	4000
1004	�ʶ���	9708112234567	2010-05-06	5000
1005	�ʶ���	0502034234567	2015-10-19	1000
1006	�ʶ���	0609304234567	2012-06-17	1000
1007	�ʶ���	6510102234567	1999-08-22	2000
1008	�ʶ���	6909101234567	1998-01-10	2000
1009	�ʶ���	0505053234567	2011-05-06	1500
1010	�ʶ���	6611112234567	2000-01-16	1300
1011	�ʶ���	9501061234567	2009-09-19	4000
1012	�ʶ���	0606064234567	2011-11-11	2000
1013	�ʶ���	6511111234567	1999-11-11	2000
1014	�ʶ���	9904171234567	2009-11-11	2000
1015	�ʶ���	0202023234567	2010-10-10	2300
*/


--UPDATE TBL_SAWON
--SET SANAME = 
--WHERE ()


UPDATE TBL_SAWON TS
SET
SANAME =
(
    SELECT TB.SANAME
    FROM TBL_SAWONBACKUP TB
    WHERE TS.SANO = TB.SANO 
)
WHERE SANAME = '�ʶ���';



--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.






