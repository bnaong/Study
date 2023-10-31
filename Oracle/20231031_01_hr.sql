SELECT USER
FROM DUAL;
--==>> HR

--���� CHECK(CK:C) ����--

-- 1. �÷����� ��� ������ �������� ������ ����(������ Ÿ��, ����..)�� �����ϱ� ���� ��������
--    �÷��� �ԷµǴ� �����͸� �˻��Ͽ� ����(������ Ÿ��, ���̺��� �� �������ϰ� �����ϰ� ���� ��)�� �´� �����͸� �Էµ� �� �ֵ��� �Ѵ�.
--    ����, �÷����� ����Ǵ� �����͸� �˻��Ͽ� ���ǿ� �´� �����ͷ� �����Ǵ� �͸�
--    ����ϴ� ����� �����ϰ� �ȴ�.


-- 2. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] CHECK(�÷�����)

-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT�� CHECK(�÷� ����)


--�� CK ���� �ǽ�(�� �÷� ������ ����)

CREATE TABLE TBL_TEST8
( COL1 NUMBER(5)     PRIMARY KEY
, COL2 VARCHAR2(30)
, COL3 NUMBER(3)     CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST8��(��) �����Ǿ����ϴ�.

--�� ������ �Է�

INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(1, '�ڹ���', 100);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(1, '�����', 100);
--==>> ���� �߻� (ORA-00001: unique constraint (HR.SYS_C007072) violated)
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(2, '�����', 101);
--==>> ���� �߻� (ORA-02290: check constraint (HR.SYS_C007071) violated)
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(2, '�����', -1);
--==>> ���� �߻� (ORA-02290: check constraint (HR.SYS_C007071) violated)
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(2, '�����', 80);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_TEST8;
--==>>
/*
1	�ڹ���	100
2	�����	80
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST8';
--==>>
/*
HR	SYS_C007071	TBL_TEST8	C	COL3	COL3 BETWEEN 0 AND 100	
HR	SYS_C007072	TBL_TEST8	P	COL1		
*/
-- �˻� ���� �÷� Ȯ��~!!!


--�� CK ���� �ǽ�(�� ���̺� ������ ����)

-- ���̺� ����
CREATE TABLE TBL_TEST9
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, COL3 NUMBER(3)
, CONSTRAINT TEST9_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST9_COL3_CK CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST9��(��) �����Ǿ����ϴ�.


--�� ������ �Է�

INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(1, '�ڹ���', 100);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(1, '�����', 100);
--==>> ���� �߻� (ORA-00001: unique constraint (HR.SYS_C007072) violated)
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(2, '�����', 101);
--==>> ���� �߻� (ORA-02290: check constraint (HR.SYS_C007071) violated)
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(2, '�����', -1);
--==>> ���� �߻� (ORA-02290: check constraint (HR.SYS_C007071) violated)
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(2, '�����', 80);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT *
FROM TBL_TEST9;
--==>>
/*
SELECT *
FROM TBL_TEST8;
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST9';
--==>>
/*
HR	TEST9_COL3_CK	TBL_TEST9	C	COL3	COL3 BETWEEN 0 AND 100	
HR	TEST9_COL1_PK	TBL_TEST9	P	COL1		
*/



--�� CK ���� �ǽ�(�� ���̺���� ���� �������� �߰�)

-- ���̺� ����
CREATE TABLE TBL_TEST10
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, COL3 NUMBER(3)
);
--==>> Table TBL_TEST10��(��) �����Ǿ����ϴ�.


-- ���� ���� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>> ��ȸ��� ����


ALTER TABLE TBL_TEST10
ADD( CONSTRAINT TEST10_COL1_PK PRIMARY KEY(COL1)
    ,CONSTRAINT TEST10_COL3_CK CHECK(COL3 BETWEEN 0 AND 100));
--==>> Table TBL_TEST10��(��) ����Ǿ����ϴ�.


SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_TEST10';
--==>>
/*
HR	TEST10_COL1_PK	TBL_TEST10	P	COL1		
HR	TEST10_COL3_CK	TBL_TEST10	C	COL3	COL3 BETWEEN 0 AND 100	
*/



--�� ���̺� ����
CREATE TABLE TBL_TESTMEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, SSN   CHAR(14)            -- �Է� ���� -> 'YYMMDD-NNNNNNN'
, TEL   VARCHAR2(40)
);
--==>> Table TBL_TESTMEMBER��(��) �����Ǿ����ϴ�.


--�� TBL_TESTMEMBER ���̺��� SSN �÷�(�ֹε�Ϲ�ȣ �÷�)����
--   ������ �Է��̳� ���� ��, ������ ��ȿ�� �����͸� �Էµ� �� �ֵ���
--   üũ ���������� �߰��� �� �ֵ��� �Ѵ�.
--   (-> �ֹι�ȣ Ư�� �ڸ��� �Է� ������ �����͸� 1, 2, 3, 4 �� �����ϵ��� ó��)
--   ����, SID �÷����� PRIMARY KEY ���� ������ ������ �� �ֵ��� �Ѵ�.


ALTER TABLE TBL_TESTMEMBER
ADD( CONSTRAINT TM_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT TM_SSN_CK CHECK(SUBSTR(SSN,8,1) IN ('1','2','3','4')));
--==>> Table TBL_TESTMEMBER��(��) ����Ǿ����ϴ�.


SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMBER';
--==>>
/*
HR	TM_SID_PK	TBL_TESTMEMBER	P	SID		
HR	TM_SSN_CK	TBL_TESTMEMBER	C	SSN	SUBSTR(SSN,8,1) IN ('1','2','3','4')
*/



-- ������ �Է��׽�Ʈ
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(1, '������', '950106-1234567','010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(2, '�ڳ���', '990208-2234567','010-2222-2222');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(3, '������', '070811-4234567','010-3333-3333');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(4, '������', '090211-3234567','010-4444-4444');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(5, '������', '000220-5234567','010-5555-5555');
--==>> ���� �߻� (ORA-02290: check constraint (HR.TM_SSN_CK) violated)
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(5, '������', '000220-6234567','010-5555-5555');
--==>> ���� �߻� (ORA-02290: check constraint (HR.TM_SSN_CK) violated)

SELECT *
FROM TBL_TESTMEMBER;
--==>>
/*
1	������	950106-1234567	010-1111-1111
2	�ڳ���	990208-2234567	010-2222-2222
3	������	070811-4234567	010-3333-3333
4	������	090211-3234567	010-4444-4444
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--���� FOREIGN KEY(FK:F:R) ����--

-- 1. ���� ���� �÷��� �ƴ�, �ٸ� ���̺� �ִ� �÷��� �����ϰ� �ϴ� ��
--    (���� ���� �÷��� ���� ��ȿ���� �ƴ����� ���� �Ǵ��ϴ� ���� �ƴ϶� �ٸ� ���̺��� �÷��� �� Ȯ���� �����Ѵ�!)
--    ���� Ű(R) �Ǵ� �ܷ� Ű(FK:F)�� �� ���̺��� ������ �� ������ �����ϰ�
--    ���� �����Ű�µ� ���Ǵ� ���̴�.
--    �� ���̺��� �⺻ Ű ���� �ִ� ����
--    �ٸ� ���̺� �߰��ϸ� ���̺� �� ������ ������ �� �ִ�.
--    �� ��, �� ��° ���̺� �߰��Ǵ� ���� �ܷ�Ű�� �ȴ�.


-- 2. �θ� ���̺�(�����޴� �÷��� ���Ե� ���̺�)�� ���� ������ ��
--    �ڽ� ���̺�(�����ϴ� �÷��� ���Ե� ���̺�)�� �����Ǿ�� �Ѵ�.
--    �� ��, �ڽ� ���̺� FOREIGN KEY ���������� �����ȴ�.

-- 3. ���� �� ����

-- �� �÷� ������ ����
-- �÷� ������ Ÿ�� [CONSTRAINT CONSTRAINT��]
--                  REFERENCES �������̺��(�����÷���)
--                  [ON DELETE CASCADE | ON DELETE SET NULL] -> �߰� �ɼ�


-- �� ���̺� ������ ����
-- �÷��� ������ Ÿ��,
-- �÷��� ������ Ÿ��,
-- CONSTRAINT CONSTRAINT�� FOREIGN KEY(�÷���)
--            REFERENCES �������̺��(�����÷���)
--            [ON DELETE CASCADE | ON DELETE SET NULL] -> �߰� �ɼ�



--�� FROREIGN KEY ���������� �����ϴ� �ǽ��� �����ϱ� ���ؼ���
--   �θ� ���̺��� �����۾��� ���� �����ؾ� �Ѵ�.
--   �׸��� �� ��, �θ� ���̺��� �ݵ�� PK �Ǵ� UK ����������
--   ������ �÷��� �����ؾ� �Ѵ�.

-- �θ� ���̺� ����
CREATE TABLE TBL_JOBS
( JIKWI_ID    NUMBER
, JIKWI_NAME  VARCHAR2(30)
, CONSTRAINT JOBS_ID_PK PRIMARY KEY(JIKWI_ID)
);
--==>> Table TBL_JOBS��(��) �����Ǿ����ϴ�.


-- �θ� ���̺� ������ �Է�
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(1, '���');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(2, '�븮');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(3, '����');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(4, '����');

-- Ȯ��
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
4	����
*/


-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� FK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_EMP1
( SID        NUMBER       PRIMARY KEY
, NAME       VARCHAR2(30)
, JIKWI_ID   NUMBER       REFERENCES TBL_JOBS(JIKWI_ID)  -- �� ��, JIKWI_ID �� TBL_JOBS.JIKWI_ID�̴�.
);
--==>> Table TBL_EMP1��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>>
/*
HR	SYS_C007080	TBL_EMP1	P	SID		
HR	SYS_C007081	TBL_EMP1	R	JIKWI_ID		NO ACTION     --> ����!
*/

-- ������ �Է�
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(1, '������', 1);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(2, '�ڰ���', 2);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(3, 'ä�ټ�', 3);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(4, '���ȯ', 4);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5, '��ٽ�', 5);
--==>> ���� �߻� (ORA-02291: integrity constraint (HR.SYS_C007081) violated - parent key not found)
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5, '��ٽ�', 1);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME) VALUES(6, '������');  -- JIKWI_ID�� NULL�� ���·� �Է�
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ڰ���	2
3	ä�ټ�	3
4	���ȯ	4
5	��ٽ�	1
6	������	
*/


COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� FK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_EMP2
( SID        NUMBER
, NAME       VARCHAR2(30)
, JIKWI_ID   NUMBER
, CONSTRAINT EMP2_SID_PK PRIMARY KEY(SID)
, CONSTRAINT EMP2_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)             --> TBL_EMP2.JIKWI_ID
             REFERENCES TBL_JOBS(JIKWI_ID)                      --> JOBS.JIKWI_ID
);
--==>> Table TBL_EMP2��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_EMP2';
--==>>
/*
HR	EMP2_SID_PK	TBL_EMP2	P	SID		
HR	EMP2_JIKWI_ID_FK	TBL_EMP2	R	JIKWI_ID		NO ACTION
*/



--�� FK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_EMP3
( SID       NUMBER
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER
);
--==>> Table TBL_EMP3��(��) �����Ǿ����ϴ�.


-- �������� �߰�
ALTER TABLE TBL_EMP3
ADD ( CONSTRAINT EMP3_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                 REFERENCES TBL_JOBS(JIKWI_ID));
--==>> Table TBL_EMP3��(��) ����Ǿ����ϴ�.


-- �������� ����(����Ŭ�� �������� �̸��� ������ ��� ��ȸ�� �� ���Ű���)
ALTER TABLE TBL_EMP3
DROP CONSTRAINT EMP3_JIKWI_ID_FK;
--==>> Table TBL_EMP3��(��) ����Ǿ����ϴ�.

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> HR	EMP3_SID_PK	TBL_EMP3	P	SID		


-- �ٽ� �������� �߰�
ALTER TABLE TBL_EMP3
ADD (CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                 REFERENCES TBL_JOBS(JIKWI_ID));
--==>> Table TBL_EMP3��(��) ����Ǿ����ϴ�.


-- 4. FOREIGN KEY ���� �� ���ǻ���
--    �����ϰ��� �ϴ� �θ� ���̺��� ���� �����ؾ� �Ѵ�.
--    �����ϰ��� �ϴ� �÷��� PRIMARY KEY �Ǵ� UNIQUE ���������� �����Ǿ� �־�� �Ѵ�.
--    ���̺� ���̿� PRIMARY KEY�� FOREIGN KEY �� ���ǵǾ� ������
--    PRIMARY KEY ���������� ������ ������ ���� ��
--    FOREIGN KEY �÷��� �� ���� �ԷµǾ� �ִ� ��� �������� �ʴ´�.
--    (��, �ڽ� ���̺� �����ϴ� ���ڵ尡 ������ ��� �θ� ���̺��� �����޴� �ش� ���ڵ��
--     ������ �� ���ٴ� ���̴�.)
--    ��, FK ���� �������� ��ON DELETE CASCADE�� �� ��ON DELETE SET NULL�� �ɼ���
--    ����Ͽ� ������ ��쿡�� ������ �����ϴ�.
--    ����, �θ� ���̺��� �����ϱ� ���ؼ��� �ڽ� ���̺��� ���� �����ؾ� �Ѵ�.


-- �θ� ���̺�
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
4	����
*/


SELECT *
FROM TBL_EMP1;
--==>> 
/*
1	������	1
2	�ڰ���	2
3	ä�ټ�	3
4	���ȯ	4
5	��ٽ�	1
6	������	(null)
*/

-- �θ� ���̺� ���� �õ�
DROP TABLE TBL_JOBS;
--==>> ���� �߻� (ORA-02449: unique/primary keys in table referenced by foreign keys 02449)
--> ������� �ߵ�(���Ἲ�� ���߸��� �ʱ� ���� ���)
  
-- �θ� ���̺��� ���� ���� ������ ���� �õ�
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID = 4;
--==>> ���� �߻� (ORA-02292: integrity constraint (HR.SYS_C007081) violated - child record found)
--> ������� �ߵ�(���Ἲ�� ���߸��� �ʱ� ���� ���)


UPDATE TBL_EMP1
SET JIKWI_ID = 1
WHERE SID = 4;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


-- Ȯ��
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ڰ���	2
3	ä�ټ�	3
4	���ȯ	1
5	��ٽ�	1
6	������	
*/



-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �θ� ���̺�(TBL_JOBS)�� ���� �����͸� �����ϰ� �ִ�
-- �ڽ� ���̺�(TBL_EMP1)�� �����Ͱ� �������� �ʴ� ��Ȳ����
-- �θ� ���̺��� ���� ���� ������ ���� �õ�


DELETE
FROM TBL_JOBS
WHERE JIKWI_ID = 4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
*/

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �θ� ���̺��� �����͸� �����Ӱ�(?) �����ϱ� ���ؼ���
--   ON DELETE CASCADE �ɼ� ������ �ʿ��ϴ�.

-- TBL_EMP1 ���̺�(�ڽ� ���̺�)���� FK ���������� ������ ��
-- CASCADE �ɼ��� �����Ͽ� �ٽ� FK ���������� �����Ѵ�.

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_EMP1';
--==>>
/*
HR	SYS_C007080	TBL_EMP1	P	SID		
HR	SYS_C007081	TBL_EMP1	R	JIKWI_ID		NO ACTION
*/

-- �������� ����
ALTER TABLE TBL_EMP1
DROP CONSTRAINT SYS_C007081;
--==>> Table TBL_EMP1��(��) ����Ǿ����ϴ�.



-- �������� ���� �� CASCADE �ɼ� �����Ͽ� �ٽ� FK �������� ����

ALTER TABLE TBL_EMP1
ADD CONSTRAINT EMP1_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                REFERENCES TBL_JOBS(JIKWI_ID)
                ON DELETE CASCADE;
--==>> Table TBL_EMP1��(��) ����Ǿ����ϴ�.



SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_EMP1';
--==>>
/*
HR	SYS_C007080	TBL_EMP1	P	SID		
HR	EMP1_JIKWI_ID_FK	TBL_EMP1	R	JIKWI_ID		CASCADE  --> NO ACTION���� CASCADE �� ����
*/
-- CASCADE �ɼ��� ������ �Ŀ��� �����ް� �ִ� �θ� ���̺��� �����͸� �������� �����Ӱ� �����ϴ� ���� ����������.
-- ��, �θ� ���̺��� �����Ͱ� ������ ��� �̸� �����ϴ� ��� �ڽ� ���̺���� �����͵鵵 ��� �Բ� �����ȴ�(�θ����̺� �����Ͱ� �����Ǳ� ����)
-- ����, �θ����̺��� �����͸� ������ �� ���� �����ϰ� �����ؾ� ��!!!


-- �θ� ���̺�
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3   ����
*/


SELECT *
FROM TBL_EMP1;
--==>> 
/*
1	������	1
2	�ڰ���	2
3	ä�ټ�	3
4	���ȯ	1
5	��ٽ�	1
6	������	(null)
*/



-- �θ� ���̺�(TBL_JOBS)���� ���� ������ ����
SELECT *
FROM TBL_JOBS
WHERE JIKWI_ID=3;

DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.



SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
*/

SELECT *
FROM TBL_EMP1;
--==>> 
/*
1	������	1
2	�ڰ���	2
4	���ȯ	1
5	��ٽ�	1
6	������	(null)
*/
--> �����̾��� ������� �����Ͱ� ��� ������


-- �θ� ���̺�(TBL_JOBS)���� ��� ������ ����
SELECT *
FROM TBL_JOBS
WHERE JIKWI_ID=1;

DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


SELECT *
FROM TBL_JOBS;
--==>> 2	�븮

SELECT *
FROM TBL_EMP1;
--==>>
/*
2	�ڰ���	2
6	������	(null)
*/
--> ����̾��� ������� �����Ͱ� ��� ������


-- ���̺� ����
DROP TABLE TBL_EMP2;
--==>> Table TBL_EMP2��(��) �����Ǿ����ϴ�.

DROP TABLE TBL_EMP3;
--==>> Table TBL_EMP3��(��) �����Ǿ����ϴ�.

DROP TABLE TBL_JOBS;
--==>> ���� �߻� (ORA-02449: unique/primary keys in table referenced by foreign keys)

DROP TABLE TBL_EMP1;
--==>> Table TBL_EMP1��(��) �����Ǿ����ϴ�.

DROP TABLE TBL_JOBS;
--==>> Table TBL_JOBS��(��) �����Ǿ����ϴ�.


--> �����͸� ������ ���� �������ڵ尡 �ִ��� �������� �߿�������,
--  �θ� ���̺��� ������ ���� �ڽ� ���̺��� ������ �߿���!!
--  �����Ͱ� �ƹ��͵� �������� �ʴ��� ���������� �����ֱ� ������
--  �ڽ� ���̺��� �����ϴ� �̻� �θ� ���̺��� ������ ���� ����



--���� NOT NULL(NN:CK:C) ����--

-- 1. ���̺��� ������ �÷��� �����Ͱ� NULL �� ���¸� ���� ���ϵ��� �ϴ� ��������.

-- 2. ���� �� ����
-- �� �÷� ������ ���� (NOT NULL ���� ������ ������ �� �ٶ����� ���)
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] NOT NULL

-- �� ���̺��� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT�� CHECK(�÷��� IS NOT NULL)

-- 3. ������ �����Ǿ� �ִ� ���̺� NOT NULL ���������� �߰��� ���
-- ADD ���� MODIFY ���� �� ���� ���ȴ�.
-- ALTER TABLE ���̺��
-- MODIFY �÷��� ������Ÿ�� NOT NULL;

-- 4. ���� ���̺� �����Ͱ� �̹� ������� ���� �÷�(->NULL�� ����)��
-- NOT NULL ���� ������ ������ �����ϴ� ��쿡�� ���� �߻��Ѵ�.


--�� NOT NULLL ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST11
( COL1 NUMBER(5)        PRIMARY KEY
, COL2 VARCHAR2(30)     NOT NULL
);
--==>> Table TBL_TEST11��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(1, 'TEST');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(2, 'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(3, NULL);
--==>> ���� �߻� (ORA-01400: cannot insert NULL into ("HR"."TBL_TEST11"."COL2"))
INSERT INTO TBL_TEST11(COL1) VALUES(4);
--==>> ���� �߻� (ORA-01400: cannot insert NULL into ("HR"."TBL_TEST11"."COL2"))

-- Ȯ��
SELECT *
FROM TBL_TEST11;
--==>>
/*
1	TEST
2	ABCD
*/

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_TEST11';
--==>>
/*
HR	SYS_C007088	TBL_TEST11	C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007089	TBL_TEST11	P	COL1		
*/


--�� NOT NULLL ���� �ǽ�(�� ���̺� ������ ����)

-- ���̺� ����
CREATE TABLE TBL_TEST12
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST12_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST12_COL2_NN CHECK(COL2 IS NOT NULL)
);
--==>> Table TBL_TEST12��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_TEST12';
--==>>
/*
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1		
*/


--�� NOT NULL ���� �ǽ�(�� ���̺� ���� ���� �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_TEST13
( COL1   NUMBER(5)
, COL2   VARCHAR2(30)
);
--==>> Table TBL_TEST13��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST13';
--==>> ��ȸ��� ����


-- �������� �߰�
ALTER TABLE TBL_TEST13
ADD (CONSTRAINT TEST13_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST13_COL2_NN CHECK(COL2 IS NOT NULL));
--==>> Table TBL_TEST13��(��) ����Ǿ����ϴ�.


-- �������� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST13';
--==>>
/*
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	-- ���̺� ���·� �߰����� ���� ���� ����
*/


--�� NOT NULL ���� ���Ǹ� TBL_TEST13 ���̺� COL2 �� �߰��ϴ� ���
--   ������ ���� ����� ����ϴ� �͵� �����ϴ�.
ALTER TABLE TBL_TEST13
MODIFY COL2 NOT NULL;
--==>> Table TBL_TEST13��(��) ����Ǿ����ϴ�.


-- �÷� �������� NOT NULL ���������� ������ ���̺�(TBL_TEST11)
DESC TBL_TEST11;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/

-- ���̺� �������� NOT NULL ���������� ������ ���̺�(TBL_TEST12)
DESC TBL_TEST12;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2          VARCHAR2(30) 
*/


-- ���̺� ���� ���� ADD�� ���� NOT NULL ���������� �߰��Ͽ�����
-- ���⿡ ���Ͽ�, MODIFY ���� ���� NOT NULL ���������� �߰��� ���̺�(TBL_TEST13)
DESC TBL_TEST13;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME IN ('TBL_TEST11','TBL_TEST12','TBL_TEST13');
--==>>
/*
HR	SYS_C007088	    TBL_TEST11	    C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007089	    TBL_TEST11	    P	COL1		

HR	TEST12_COL2_NN	TBL_TEST12	    C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	    P	COL1		

HR	TEST13_COL1_PK	TBL_TEST13	    P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	    C	COL2	COL2 IS NOT NULL	
HR	SYS_C007094	    TBL_TEST13	    C	COL2	"COL2" IS NOT NULL	
*/
-- NOT NULL �������� ������ �� �̸��ο� + �÷������� ��� ����ϴ°� �ٶ����ϰڴ�.




--���� DEFAULT ǥ���� ����--

-- �������� ���ֿ� ���� ����

-- 1. INSERT �� UPDATE ������
--    Ư�� ���� �ƴ� �⺻ ���� �Է��ϵ��� ó���� �� �ִ�.

-- 2. ���� �� ����
-- �÷��� ������Ÿ�� DEFAULT �⺻��

-- 3. INSERT ��� �� �ش� �÷��� �Էµ� ���� �Ҵ����� �ʰų�
--    DEFAULT Ű���带 Ȱ���Ͽ� �⺻���� ������ ���� �Է��ϵ��� �� �� �ִ�.

-- 4. DEFAULT Ű����� �ٸ� ����(NOT NULL ��) ǥ�Ⱑ �Բ� ���Ǿ�� �ϴ� ���
--    DEFAULT Ű���带 ���� ǥ��(�ۼ�)�� ���� �����Ѵ�.


--�� DEFAULT ǥ���� ���� �ǽ����� ���� ���̺� ����(�ٶ������� �ʴ� ���̺� ������)
-- ���̺� ����
CREATE TABLE TBL_BBS                              -- �Խ��� ���̺� ����
( SID       NUMBER             PRIMARY KEY        -- �Խù� ��ȣ -> �ĺ��� -> �ڵ�����
, NAME      VARCHAR2(20)                          -- �Խù� �ۼ���
, CONTENTS  VARCHAR2(200)                         -- �Խù� ����
, WRITEDAY  DATE               DEFAULT SYSDATE    -- �Խù� �ۼ���
, COUNTS    NUMBER             DEFAULT 0          -- �Խù� ��ȸ��
, COMMENTS  NUMBER             DEFAULT 0          -- �Խù� ��� ����
);
--==>> Table TLB_BBS��(��) �����Ǿ����ϴ�.
-- ��


--�� SID �� �ڵ� ���� ������ ��Ϸ��� ������ ��ü�� �ʿ��ϴ�.
--   �ڵ����� �ԷµǴ� �÷��� ������� �Է� �׸񿡼� ���ܽ�ų �� �ִ�.

-- ������ ����
CREATE SEQUENCE SEQ_BBS
NOCACHE;
--==>> Sequence SEQ_BBS��(��) �����Ǿ����ϴ�.

-- ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

-- �Խù� �ۼ�
INSERT INTO TBL_BBS(SID, NAME, CONTENTS, WRITEDAY, COUNTS, COMMENTS)
VALUES(SEQ_BBS.NEXTVAL, '��ٽ�', '����Ŭ DEFAULT ǥ������ �ǽ����Դϴ�.',TO_DATE('2023-10-31 14:39:10','YYYY-MM-DD HH24:MI:SS'),0 ,0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BBS(SID, NAME, CONTENTS, WRITEDAY, COUNTS, COMMENTS)
VALUES(SEQ_BBS.NEXTVAL, '��ٽ�', '����Ŭ DEFAULT ǥ������ �ǽ����Դϴ�.',SYSDATE,0 ,0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BBS(SID, NAME, CONTENTS, WRITEDAY, COUNTS, COMMENTS)
VALUES(SEQ_BBS.NEXTVAL, '������', '��� �ǽ����Դϴ�.',DEFAULT,0 ,0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BBS(SID, NAME, CONTENTS, WRITEDAY, COUNTS, COMMENTS)
VALUES(SEQ_BBS.NEXTVAL, '����ȯ', '������ �ǽ����Դϴ�.',DEFAULT,DEFAULT,DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BBS(SID, NAME, CONTENTS)
VALUES(SEQ_BBS.NEXTVAL, '������', '������ �ǽ����Դϴ�.');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


-- Ȯ��
SELECT *
FROM TBL_BBS;
--==>>
/*
1	��ٽ�	����Ŭ DEFAULT ǥ������ �ǽ����Դϴ�.	2023-10-31 14:39:10	0	0
2	��ٽ�	����Ŭ DEFAULT ǥ������ �ǽ����Դϴ�.	2023-10-31 14:46:18	0	0
3	������	��� �ǽ����Դϴ�.	                2023-10-31 14:46:51	0	0
4	����ȯ	������ �ǽ����Դϴ�.	                2023-10-31 14:47:14	0	0
5	������	������ �ǽ����Դϴ�.	                2023-10-31 14:48:04	0	0
*/


--�� DEFAULT ǥ���� ��ȸ(Ȯ��)
SELECT *
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'TBL_BBS';
-- DATA_DAFAULT Ȯ���� �� ����~!!!



--�� ���̺� ���� ���� DEFAULT ǥ���� �߰� / ���� (NOT NULLó�� MODIFY ���)
--ALTER TABLE ���̺��
--MODIFY �÷��� [�ڷ���] DEFAULT �⺻��;

--�� ������ DEFAULT ǥ���� ���� (DROP Ű���� ���Ұ�)
--ALTER TABLE ���̺��
--MODIFY �÷��� [�ڷ���] DEFAULT NULL;


-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.











