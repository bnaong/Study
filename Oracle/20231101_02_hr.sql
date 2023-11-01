SELECT USER
FROM DUAL;
--==>> HR


--�� EMPLOYEES ���̺��� ������ SALARY �� 10 % �λ��Ѵ�.
--   ��, �μ����� 'IT' �� �����鸸 �����Ѵ�.
--   (����, �������� ���� ���� ��� Ȯ�� �� ROLLBACK �� �����Ѵ�~!!!)

-- EMPLOYEES ���̺��� �μ����� IT�� �������� Ȯ��
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT');


-- DEPARTMENTS ���̺��� �μ��̸����� �μ����̵� ����.
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';

-- EMPLOYEES ���̺��� �μ����̵� ��ġ�ϴ� �μ���� ������ ������Ʈ��
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');
                       
ROLLBACK;





--�� EMPLOYEES ���̺��� JOB_TITLE �� 'Sales Manager' �� �������
--   SALARY �� �ش� ����(����)�� �ְ�޿�(MAX_SALARY)�� �����Ѵ�.
--   ��, �Ի����� 2006�� ����(�ش� �⵵ ����) �Ի��ڿ� ���� ����� �� �ֵ��� ó���Ѵ�.
--   (����, ���濡 ���� ��� Ȯ�� �� ROLLBACK �����Ѵ�~!!!)


SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;


-- ù ��° ���

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
AND EXTRACT(YEAR FROM HIRE_DATE) < 2006;

--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
/*
145	John	Russell	    JRUSSEL	    011.44.1344.429268	2004-10-01	SA_MAN	20080	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	20080	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	20080	0.3	100	80
*/


-- ������ �� JOB_ID
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';

-- ������ �޿�
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';

-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.




--�� EMPLOYEES ���̺��� SALARY �� �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
--   Finance -> 10%
--   Executive -> 15%
--   Accounting -> 20%
--   (��� Ȯ�� �� �ѹ�~!!!)

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
        , DECODE(DEPARTMENT_NAME,'Finance', SALARY*1.1,'Executive', SALARY*1.15, 'Accounting', SALARY*1.2, SALARY) "�λ�޿�"
        FROM EMPLOYEES E JOIN DEPARTMENTS D
        ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        WHERE D.DEPARTMENT_NAME IN ('Finance','Executive','Accounting')
        )
SET SALARY = "�λ�޿�";



-- ������ Ǯ�̹��---------------------------------------------------------------------------
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
--> �������� �ִ� WHERE���� �־, ��� ���� ���, ���� ����� ���������
--  WHERE���� ������ 107�� ���� ������Ʈ �Ǹ�, WHERE���� ������ 11�� ���� ������Ʈ �ȴ�.
--  ����, ����ó��, WHERE���� ����ϴ� ���� �ٶ����ϰڴ�. 


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

-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.



--���� DELETE ����--

-- 1. ���̺��� ������ ��(���ڵ�)�� �����ϴµ� ����ϴ� ����

-- 2. ���� �� ����
-- DELETE [FROM] ���̺��
-- [WHERE ������];

-- ���ǻ��� 2����
-- �� FROM�� �� �ٿ��� �Ǽ��� ���� �� �ִ�.
-- �� SELECT * FROM ���̺�� WHERE ������;
--    �� ���� ��ȸ�Ͽ� ������ ������ �� Ȯ���غ� �� ��SELECT *�� �� ��DELETE�� �� �����ϸ� �Ǽ��� ���� �� �ִ�.



-- DELETE ������ UPDATE���� ���� ���������� ����� �� �ִ�,


--�� EMPLOYEES ���̺��� �������� �����͸� �����Ѵ�.
--   ��, �μ����� 'IT'�� ���� �����Ѵ�.

--�� �����δ� EMPLOYEES ���̺��� �����Ͱ�(-> �����ϰ��� �ϴ� ��� ������)
--   �ٸ� ���ڵ忡 ���� �������ϰ� �ִ� ���
--   �������� ���� �� �ִٴ� ����� ������ �� �־�� �ϸ�...
--   �׿� ���� ������ �˾ƾ� �Ѵ�.


SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'IT');

DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'IT');









