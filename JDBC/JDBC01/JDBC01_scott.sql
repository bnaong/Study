SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;

DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ���� ������ �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1, 'ȫ�浿', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_MEMBER;
--==>> 1	ȫ�浿	010-1111-1111

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �ڹٿ��� Test003.java ���� �� �ٽ� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	ȫ�浿	010-1111-1111
2	��浿	010-2222-2222
*/

--�� �ڹٿ��� Test004.java ���� �� �ٽ� Ȯ��
SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>>
/*
1	ȫ�浿	010-1111-1111
2	��浿	010-2222-2222
3	�ڳ���	010-3333-3333
4	������	010-4444-4444
5	�����	010-5555-5555
*/


--�� �ڹ� Test005.java ���� ������ ��ȸ ������ �غ�
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	ȫ�浿	010-1111-1111
2	��浿	010-2222-2222
3	�ڳ���	010-3333-3333
4	������	010-4444-4444
5	�����	010-5555-5555
*/


SELECT EMPNO, ENAME, JOB, SAL FROM EMP
;
--==>>
/*
7369	SMITH	CLERK	    800
7499	ALLEN	SALESMAN	1600
7521	WARD	SALESMAN	1250
7566	JONES	MANAGER	    2975
7654	MARTIN	SALESMAN	1250
7698	BLAKE	MANAGER	    2850
7782	CLARK	MANAGER	    2450
7788	SCOTT	ANALYST	    3000
7839	KING	PRESIDENT	5000
7844	TURNER	SALESMAN	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	    950
7902	FORD	ANALYST	    3000
7934	MILLER	CLERK	    1300
*/













