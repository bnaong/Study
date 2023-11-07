SELECT USER
FROM DUAL;
--==>> SCOTT

/* (231103_01_scott(pqlsql)
    6-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- ���1
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
    V_PW2   TBL_IDPW.PW%TYPE;       -- ����ڰ� �Է��� PW�� ���� ����
    V_FLAG  NUMBER := 0;            -- �н�������ġ:1 / �н��������ġ:2
BEGIN
    -- �ۼ�����1) FROM TBL_IDPW�� ���� ID Ȯ��;
    
    -- �ۼ�����2) 'moon'�� ���̴ٰ� �����ϰ�
    --              ����ڰ� �Է��� PW�� ���� �� �ֵ��� �ۼ�    
    SELECT PW INTO V_PW2
    FROM TBL_IDPW
    WHERE ID = 'moon';
    
    -- ���ǿ� ���� �б�(����� �Է�PW, ���̺��� ���� ���� PW - ��ġ/ ����ġ)
    IF (V_PW = V_PW2)       -- �н����� ��ġ
        THEN V_FLAG := 1;
    ELSE                    -- �н����� ����ġ
        V_FLAG := 2;
    END IF;
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID
--      AND �н����� ��ġ;
      AND V_FLAG = 1;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE��(��) �����ϵǾ����ϴ�.


-- ���2
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
BEGIN
    
    -- �ΰ��� ���̺��� JOIN �ؼ� ������Ʈ
    UPDATE (SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR    -- ��ȣ ���� ���������� ��Ƽ� ��ȸ�غ���
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2   
            ON T1.ID = T2.ID) T
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE T.ID = V_ID
      AND T.PW = V_PW;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE��(��) �����ϵǾ����ϴ�.

/* 1-���� & ���� Ǭ ���� ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.  
--  NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG ���� ������ �÷� ��  
--  NUM(�����ȣ) �� ������ �׸��� ������ �Է� ��   
--  �ش� �׸��� ���� ���� �ο��� ��� ��ȣ�� ������ ��ȣ �� ���� ��ȣ��  
--  �ڵ����� �Է� ó���� �� �ִ� ���ν����� �����Ѵ�.  
--  ���ν����� : PRC_INSA_INSERT()
/*
���� ��)
EXEC PRC_INSA_INSERT('������', '970812-2234567', SYSDATE, '����', '010-2509-1783', '���ߺ�', '�븮', 2000000, 2000000) -- �̹鸸, �̹鸸
-> ���� ���� ���ν��� ȣ�� �� ����

1061 ������ 970812-2234567 2023-11-06 ���� 010-2509-1783 ���ߺ� �븮 2000000 2000000
*/

DESC TBL_INSA;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)
*/
SELECT *
FROM TBL_INSA;

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME      IN TBL_INSA.NAME%TYPE
, V_SSN       IN TBL_INSA.SSN%TYPE
, V_IBSADATE  IN TBL_INSA.IBSADATE%TYPE
, V_CITY      IN TBL_INSA.CITY%TYPE
, V_TEL       IN TBL_INSA.TEL%TYPE
, V_BUSEO     IN TBL_INSA.BUSEO%TYPE
, V_JIKWI     IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY  IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG    IN TBL_INSA.SUDANG%TYPE
)
IS
  V_NUM   TBL_INSA.NUM%TYPE;
BEGIN
    -- ���� �ο��� �����ȣ�� ������ ��ȣ
    SELECT NVL(MAX(NUM),0) INTO V_NUM
    FROM TBL_INSA;
            
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG) 
            VALUES ((V_NUM+1), V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
    
    /*
    SELECT MAX(NVL(NUM,0)) + 1 INTO V_NUM
    FROM TBL_INSA;
            
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG) 
            VALUES (V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
    */
    
END;



--V_NUM := (SELECT NUM FROM TBL_INSA)
-- PLSQL ������ �������� ���� ��ȸ�� ���� �޸𸮱���(�޸𸮿���)�� �ٸ���. �Ұ����� ����

--SELECT MAX(NVL(NUM,0)) INTO V_NUM
--FROM TBL_INSA;
-- �� ������ �� ���� ������ ���� �̷����


------------------------------------------------------------------------------------------------------


--�� 20231106_02_scott.sql ������ Ȱ���Ͽ�
--   TBL_��ǰ, TBL_�԰� ���̺��� �������
--   TBL_�԰� ���̺� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �ش� ��ǰ�� ���� �������� �Բ� ������ �� �ִ� ����� ����
--   ���ν����� �ۼ��Ѵ�.
--   �� �� �������� �԰��ȣ�� �ڵ� ���� ó���Ѵ�. (������ ��� ����)
--   TBL_�԰� ���̺� ���� �÷���
--   �԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ��̸�
--   ���ν��� ȣ���� ���� ������ �Ķ���ʹ� ��ǰ�ڵ�, �԰����, �԰�ܰ��̴�.
--   ���ν����� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰����, �԰�ܰ�)


CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�    IN TBL_�԰�.��ǰ�ڵ�%TYPE
, V_�԰����    IN TBL_�԰�.�԰����%TYPE
, V_�԰�ܰ�    IN TBL_�԰�.�԰�ܰ�%TYPE
)
IS
    -- �����
    V_�԰��ȣ TBL_�԰�.�԰��ȣ%TYPE;
BEGIN
    -- �����
    -- SELECT ������ ����
    SELECT NVL(MAX(�԰��ȣ),0) INTO V_�԰��ȣ
    FROM TBL_�԰�;

    -- INSERT ������ ����    
    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�)
    VALUES ((V_�԰��ȣ+1),V_��ǰ�ڵ�, V_�԰����, V_�԰�ܰ�);

    -- UPDATE ������ ����    
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- �԰�� �Ǿ��µ� �������� �ȵǴ� ���� ���� �Ͼ�� ���Ἲ�� Ʈ������� ��������.
    -- ���� ó��
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
        -- OTHERS(=���� ���μ������� ��� ��� ��Ȳ)�� �ƴ϶�� �ѹ��ض�(�⺻��Ȳ)
    
    -- Ŀ��
    COMMIT;
END;


/*
����					        ����
����					        ����
1,200,000 -> 200,000			0 -> 1,000,000


UPDATE ������				    UPDATE ������
SET �ܾ� = 200,000			    SET �ܾ� = 1,000,000		
WHERE �������ڵ� = ����			WHERE �������ڵ� = ����	


�� �߿� �ϳ��� ������� ������ ROLLBACK ��
�� �� ó���Ǹ� COMMIT ��
--> Ʈ����� ó��
*/




--------------------------------------------------------------------------------

--���� ���ν��� �������� ���� ó�� ����--

--�� TBL_MEMBER ���̺� �����͸� �Է��ϴ� ���ν����� �ۼ�
--   ��, �� ���ν����� ���� �����͸� �Է��� ���
--   CITY(����) �׸� '����', '���', '����'�� �Է��� �����ϵ��� �����Ѵ�.
--   �� ���� ���� �ٸ� ������ ���ν��� ȣ���� ���� �Է��Ϸ��� ���
--   (��, ��ȿ���� ���� ������ �Է��� �õ��Ϸ��� ���)
--   ���ܿ� ���� ó���� �Ϸ��� �Ѵ�.
--   ���ν����� : PRC_MEMBER_INSERT()
/*
���� ��)
EXEC PRC_MEMBER_INSERT('�ڹ���','010-1111-1111','����');
--> ������ �Է� ��

EXEC PRC_MEMBER_INSERT('�����','010-2222-2222','�λ�');
--> ������ �Է� X

*/


CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- ���� ������ ������ ������ ���� �ʿ��� ���� ����
    V_NUM   TBL_MEMBER.NUM%TYPE;
    
    -- ����� ���� ���ܿ� ���� ���� ����
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN

    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ���������� �ƴ����� ���θ�
    -- ���� ���� Ȯ���� �� �ֵ��� �ڵ� ����
    IF (V_CITY NOT IN ('����','���','����'))
    -- ���� �߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(NUM),0) INTO V_NUM
    FROM TBL_MEMBER;
    
    -- ������ ���� -> INSERT
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES ((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    -- ���� ó�� ����
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'����,���,������ �Է��� �����մϴ�.');
                 ROLLBACK;
            -- ����Ŭ �����Լ�(������ȣ) : 20000�������� ����Ŭ ���ο� ������ �ڵ�ȭ �Ǿ�����.
            --                            EXCEPTION ���̺��� ���� Ȯ�� �� �ڵ带 ����ؼ� ���
            -- �߻��� ���ܰ� 20001�� �̶��~ �̶�� ������� �б� ���� �� ����
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;


--�� TBL_��� ���̺� ������ �Է� ��(��, ��� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �������� �����Ǵ� ���ν����� �ۼ��Ѵ�.
--   ��, ����ȣ�� �԰��ȣ�� ���������� �ڵ� ����,
--   ����, �������� ���������� ���� ���...
--   ��� �׼��� ����� �� �ֵ��� ó���Ѵ�.
--   ���ν����� : PRC_���_INSERT()
-- �ش� ��ǰ ���̺��� �������� Ȯ�θ��� �� �� ����ó���ϱ�

/*
���� ��)
EXEC PRC_���_INSERT('H001', 10, 600);

--> �ٹ��(H001) ������ Ȯ�� ��

EXEC PRC_���_INSERT('H001', 80, 600)
*/


CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�    IN TBL_���.��ǰ�ڵ�%TYPE
, V_������    IN TBL_���.������%TYPE
, V_���ܰ�    IN TBL_���.���ܰ�%TYPE
)
IS
    V_����ȣ TBL_���.����ȣ%TYPE;
    V_������ TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- ��� ���� �ľ� -> ���� ��� Ȯ���ϴ� ������ ����Ǿ�� �Ѵ�.
    -- �׷��� ���ν��� ȣ�� �� �Ѱܹ޴� �������� �񱳰� �����ϱ� ����
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    IF (V_������ > V_������)
    -- ���� �߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    SELECT NVL(MAX(����ȣ),0) INTO V_����ȣ
    FROM TBL_���;

    -- ������ ���� -> INSERT(TBL_���)
    INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, ������, ���ܰ�)
    VALUES ((V_����ȣ+1), V_��ǰ�ڵ�, V_������, V_���ܰ�);
    
    -- ������ ���� -> UPDATE(TBL_��ǰ)   
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
 
    -- ���� ó�� ����
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'�Է��� �������� �������� �ʰ��߽��ϴ�.');
                 ROLLBACK;   
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��
    COMMIT;
    
END;


-----------------------------------------------------------------------------------




--�� TBL_��� ���̺��� �������� ����(����)�ϴ� ���ν����� �ۼ��Ѵ�. -- UPDATE
--   ���ν����� : PRC_���_UPDATE()
/*
���� ��)
EXEC PRC_���_UPDATE(����ȣ, �����Ҽ���);
*/


CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( V_����ȣ    IN TBL_���.����ȣ%TYPE
, V_�����Ҽ���  NUMBER
)
IS
    V_��ǰ�ڵ� TBL_���.��ǰ�ڵ�%TYPE;
    V_������ TBL_��ǰ.������%TYPE;
    V_������ TBL_���.������%TYPE;
    
    -- ���� ó�� ���� ����
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT ��ǰ�ڵ� INTO V_��ǰ�ڵ�
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;

    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    SELECT ������ INTO V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;   
        
    IF ((V_������ - (V_�����Ҽ��� - V_������)) < 0)
--    IF (V_������ + V_������) < V_�����Ҽ���
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    

    UPDATE TBL_���
    SET ������ = V_�����Ҽ���
    WHERE ����ȣ = V_����ȣ;
    
    UPDATE TBL_��ǰ
    SET ������ = V_������ - (V_�����Ҽ��� - V_������)
--    SET ������ = (V_������ + V_������) - V_�����Ҽ���
    WHERE ��ǰ�ڵ� = (SELECT ��ǰ�ڵ� FROM TBL_��� WHERE ����ȣ = V_����ȣ);
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'������');
            ROLLBACK;   
        WHEN OTHERS
            THEN ROLLBACK;
            
    COMMIT;
END;

SELECT *
FROM TBL_��ǰ;

SELECT *
FROM TBL_���;
















