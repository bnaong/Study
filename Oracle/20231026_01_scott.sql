SELECT USER
FROM DUAL;
--==>> SCOTT

--�� SELF JOIN (�ڱ�����)

-- EMP ���̺��� �����͸� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

/*
------------------------------------------------------------------------
�����ȣ   �����  ������  �����ڹ�ȣ  �����ڸ�   ������������
------------------------------------------------------------------------
SMITH      SMITH  CLERK   7902        FORD       ANALYST
*/

-- JOIN ����

--SELECT *
--FROM TBL_EMP E, TBL_DEPT D
--WHERE E.DEPTNO = D.DEPTNO;

--SELECT *
--FROM TBL_EMP E (LEFT, RIGHT, FULL)JOIN TBL_DEPT D
--ON E.DEPTNO = D.DEPTNO;

SELECT P.EMPNO �����ȣ, P.ENAME �����, P.JOB ������, P.MGR �����ڹ�ȣ, E.ENAME �����ڸ�, E.JOB ������������
FROM EMP P LEFT JOIN EMP E
ON E.EMPNO = P.MGR;

SELECT *
FROM TBL_BOARD;


SELECT *
FROM TBL_BOARD
WHERE CONTENTS LIKE('[0-11]%');













