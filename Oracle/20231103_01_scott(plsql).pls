SELECT USER
FROM DUAL;
--==>> SCOTT


--���� FUNCTION(�Լ�) ����--

-- 1. �Լ��� �ϳ� �̻��� PL/SQL ������ ������ �����ƾ����
--    �ڵ带 �ٽ� ����� �� �ֵ��� ĸ��ȭ �ϴµ� ���ȴ�.
--    ����Ŭ������ ����Ŭ�� ���ǵ� �⺻ ���� �Լ��� ����ϰų�
--    ���� ������ �Լ��� ���� �� �ִ�. (-> ����� ���� �Լ�)
--    �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�
--    ���� ���ν���ó�� EXECUTE ���� ���� ������ �� �ִ�.

-- �ڵ带 ����ȭ ��ų �� �ְ�, ���� ������ ����� �� �����Ƿ�
-- �ʿ��� ������ ����ų� ���ļ� ����Ѵ�.(��ó��)

-- 

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] FUNCTION �Լ���    -- �Լ��� �����ϴ� �κ�
[( �Ű�������1 �ڷ���
 , �Ű�������2 �ڷ���
)]
RETURN ������Ÿ��                     -- �ڹٿ���ó�� ���ο� �ִ� ��ȯ�� RETURN ���� ���� ������Ÿ����
IS                           ��          �ܺο����� �� �� ���� ������ �ٱ��� ǥ��(�Լ��� ������ ������ Ư¡)
    -- �ֿ� ���� ����     
BEGIN
    -- ���๮;                ��ü�κ�
    ...
    RETURN (��);
    
    [EXCEPTION]
        -- ���� ó�� ����;    ��
END;
*/


--�� ����� ���� �Լ�(������ �Լ�)�� IN �Ķ����(�Է� �Ű�����)�� ����� �� ������
--   �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN ���� �����ؾ� �ϰ�,
--   FUNCTION �� �ݵ�� ���� ��(�����ڷ����� �ϳ����� �ϹǷ�..)�� ��ȯ�Ѵ�.


-- �Է� �Ű����� : � �Լ��� ȣ���ϸ鼭 � �Ű������� �ָ� �װ� �޾Ƽ� ���ϰ� ��
-- ��� �Ű����� : �Լ����� ���� �����ϸ� �Լ��� ���� �� ���� ��Ƽ� ������ ��������
-- ����� �Ű����� : �ſ� �� ��Ƽ� ���״� �װ� �ް� �����ؼ� ����� �ſ� ��Ƽ� ������ ��


--�� TBL_INSA ���̺� ���� ���� Ȯ�� �Լ� ����(����)
--   -------------------
--   �Ű����� ����(����) �� '771212-1022432' -> 'YYMMDD-NNNNNNN'

-- �Լ��� : FN_GENDER()
--                   �� �ֹε�Ϲ�ȣ �� '771212-1022432'


CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)    -- �Ű�����     : �ڸ���(����) ���� ����
RETURN VARCHAR2                                         -- ��ȯ�ڷ���   : �ڸ���(����) ���� ����
IS
    -- �����  -> �ֿ� ���� ����(�� �ʱ�ȭ)
    V_RESULT    VARCHAR2(20);
BEGIN
    -- �����  -> ���� �� ó��(�׸��� ����� ��ȯ)
    IF ( SUBSTR(V_SSN,8,1) IN ('1','3') )
        THEN V_RESULT := '����';
    ELSIF( SUBSTR(V_SSN,8,1) IN ('2','4') )
        THEN V_RESULT := '����';
    ELSE
        V_RESULT := '����Ȯ�κҰ�';
    END IF;
    
    -- ����� ��ȯ
    RETURN V_RESULT;
END;

--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.



--�� ������ ���� �� ���� �Ű�����(�Է� �Ķ����)�� �Ѱܹ޾� -> (A, B)
--   A�� B ���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.
--   ��, ������ ����Ŭ ���� �Լ��� �̿����� �ʰ�, �ݺ����� Ȱ���Ͽ� �ۼ��Ѵ�.
-- �Լ��� : FN_POW()
/*
��� ��)
SELECT FN_POW(10,3)
FROM DUAL;
1 * 10 * 10 * 10 = 1000w
--==>> 1000
*/


CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    -- �����
    V_RESULT NUMBER := 1;       --> ��ȯ ������� ���� ������ 1�� �ʱ�ȭ
    V_NUM    NUMBER;            --> ���� ������ Ȱ��

BEGIN
    -- �ݺ��� ����
    FOR V_NUM IN 1.. B LOOP
        V_RESULT := V_RESULT * A;     -- V_RESULT *= A;
    END LOOP;
    
    -- ���� ����� ��ȭ
    RETURN V_RESULT;
END;



--�� TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.
--   �޿��� ��(�⺻��*12+����)�� ������� ������ �����Ѵ�.
--   �Լ��� : FN_PAY(�⺻��, ����)

CREATE OR REPLACE FUNCTION FN_PAY(V_BASICPAY NUMBER, V_SUDANG NUMBER)
RETURN NUMBER
IS
    -- �ֿ� ���� ����
    V_RESULT NUMBER;
BEGIN
    -- ���� �� ó��
    V_RESULT := (NVL(V_BASICPAY,0) * 12) + NVL(V_SUDANG,0);
    
    -- ���� ����� ��ȯ
    RETURN V_RESULT;
END;


--�� TBL_INSA ���̺���
--   �Ի����� �������� ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
--   ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
--   �Լ��� : FN_WORKYEAR(�Ի���)

CREATE OR REPLACE FUNCTION FN_WORKYEAR(V_IBSADATE DATE)
RETURN NUMBER
IS
    -- ���� ����
    V_YEAR  NUMBER;
    
BEGIN
    -- ���� �� ó��
    V_YEAR := TRUNC(MONTHS_BETWEEN(SYSDATE,V_IBSADATE) /12 ,1);
    
    -- ���� ����� ��ȯ
    RETURN V_YEAR;
END;

---------------------------------------------------------------------------

--�� ��� ��� ���·� ��µǴ� �Լ��� �ٲٱ�~!!
CREATE OR REPLACE FUNCTION FN_WORKYEAR(V_IBSADATE DATE)
RETURN VARCHAR2
IS
    -- ���� ����
    V_RESULT  VARCHAR2(100);
    
BEGIN
    -- ���� �� ó��
    V_RESULT := TRUNC(MONTHS_BETWEEN(SYSDATE,V_IBSADATE) /12) || '��' || TRUNC(MOD(MONTHS_BETWEEN(SYSDATE,V_IBSADATE),12)) || '����';
    
    -- ���� ����� ��ȯ
    RETURN V_RESULT;
END;



--------------------------------------------------------------------------------------------------------------------

--�� �������� ���� �з�

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)

-- �����ϰ� ���� COMMIT �̳� ROLLBACK�� �����ؾ� �ϴ� ����

-- 2. CREATE, DROP, ALTER, (TRUNCATE)   -- TRUNCATE : ���̺��� ���ڵ带 �߶󳻴� ����
--==>> DDL(Data Definition Language)

-- �����ϰ� ���� �ڵ� COMMIT �Ǵ� ����

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- �����ϸ� �ڵ����� COMMIT ��

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)


-- ���� pl/sql�� -> DML��, TCL���� ��� �����ϴ�.
-- ���� pl/sql�� -> DML��, DDL��, DCL��, TCL�� ��� �����ϴ�.

--------------------------------------------------------------------------------------------------------------------



--���� PROCEDURE(���ν���) ����--


-- 1. PL/SQL ���� ���� ��ǥ���� ������ ������ ���ν�����
--    �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--    �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ��ٰ�
--    �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó���� �ִ� �����̴�.



-- �Լ��� ���� ������ �����ϴ� ���� �ƴϰ�,
-- ���ν����� ������ �ڹٷ� ġ�� �����ڷ����� VOID�� �޼ҵ�� ����ϴٰ� �����ϱ�
-- ���ν����� ���� �����ϴ� ������ �ƴ�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[( �Ű����� IN ������Ÿ��
 , �Ű����� OUT ������Ÿ��
 , �Ű����� INOUT ������Ÿ��)]
IS
    [-- �ֿ� ���� ����]
BEGIN
    -- ���� ����;
    ...
    
    [EXCEPTION
        -- ����ó�� ����;]
END;
*/

-- ���� ���� ������ ������ �ƴ�. �� �ȿ��� ��������Ρ� �� ������ -> �̰� ��� �����ϰ� �ϴ� ��
-- UPDATE, INSERT ���� ������� �����ϰ� �ϴ� ��

-- FUNCTION �� ������ �� ��RETURN ��ȯ�ڷ����� �κ��� �������� ������,
-- ��RETURN���� ��ü�� �������� �ʰ�,
--  ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--  IN(�Է�), OUT(���), INOUT(�����) ���� ���еȴ�.


-- 3. ����(ȣ��)
/*
EXE[CUTE] ���ν�����[(�μ�1, �μ�2, ...)];       -- CUTE ����������
*/


--�� ���ν��� �ǽ��� ���� ���̺� ������..
--   ��20231103_02_scott.sql�� ���� ����~!!!
-- ���̺� ������ �����ϰ� ¥�� ���ν����� �����ϱ� ������..
-- �ִ��� �ܼ��ϰ� ���������� ���̺��� �����ϱ����� �ٶ������� ���� �������� ���̺��� �����.


--�� ���ν��� ����

--EXEC ���ν�����('���̵�', '�н�����','�̸�','��ȭ��ȣ','�ּ�');

CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( ���̵�
, �н�����
, �̸�
, ��ȭ
, �ּ�
)
IS
BEGIN
END;



CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDPW ���̺� ������ �Է� -> INSERT
    INSERT INTO TBL_IDPW(ID,PW)
    VALUES(V_ID,V_PW);
    
    -- TBL_STUDENTS ���̺� ������ �Է� -> INSERT
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_INSERT��(��) �����ϵǾ����ϴ�.


--�� ���ν��� �ǽ��� ���� ���̺� ������...
--    ��20231103_02_scott�� ������ ����

--�� ������ �Է� �� Ư�� �׸��� �����͸� �Է��ϸ�
--   ���������� �ٸ� �߰��׸� ���� ó���� �Բ� �̷���� �� �ֵ��� �ϴ�
--   ���ν����� �ۼ��Ѵ�.(�����Ѵ�.)
--   ���ν����� : PRC_SUNGJUK_INSERT()
/*
���� �ν�)
���� TBL_SUNGJUK ���̺���
HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE
(�й�, �̸�, ��������, ��������, ��������, ����, ���, ���)
�÷����� �����Ǿ� �ִ�.
�� ���̺��� ������� Ư�� �׸�(�й�, �̸�, ��������, ��������, ��������)�� �Է��ϸ�
�߰� �׸�(����, ���, ���)�� �˾Ƽ� ó���� �� �ֵ��� ���ν����� �����϶�� ���̴�.
A B C D F

���� ��)
EXEC PRC_SUNGJUK_INSERT(1, '��ٽ�', 90, 80, 70);
-> �̿� ���� ���ν��� ȣ��� ó���� ���

�й� �̸� �������� �������� �������� ���� ��� ���
1  ��ٽ�   90       80        70    240   80   B
*/




CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
 ,V_NAME    IN TBL_SUNGJUK.NAME%TYPE
 ,V_KOR     IN TBL_SUNGJUK.KOR%TYPE
 ,V_ENG     IN TBL_SUNGJUK.ENG%TYPE
 ,V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT     TBL_SUNGJUK.TOT%TYPE;
    V_AVG     TBL_SUNGJUK.AVG%TYPE;
    V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- ���̺� ������ �Է�
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT /3;
    IF (V_AVG >=90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >=60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.



--�� TBL_SUNGJUK ���̺��� Ư�� �л��� ����
--   (�й�, ��������, ��������, ��������) ������ ���� ��
--   ����, ���, ��ޱ��� �Բ� �����Ǵ� ���ν����� �����Ѵ�.
--   ���ν����� : PRC_SUNGJUK_UPDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(2, 50, 50, 50);

-> ���ν��� ȣ�� ���
�й� �̸� �������� �������� �������� ���� ��� ���
1  ��ٽ�   90       80        70    240   80   B
2  ������   50       50        50    150   50   F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
 ,V_KOR     IN TBL_SUNGJUK.KOR%TYPE
 ,V_ENG     IN TBL_SUNGJUK.ENG%TYPE
 ,V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT     TBL_SUNGJUK.TOT%TYPE;
    V_AVG     TBL_SUNGJUK.AVG%TYPE;
    V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT /3;
    IF (V_AVG >=90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >=60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    UPDATE TBL_SUNGJUK
    SET KOR=V_KOR, ENG=V_ENG, MAT=V_MAT, TOT=V_TOT, AVG=V_AVG, GRADE=V_GRADE
    WHERE HAKBUN = V_HAKBUN;
END;



--�� TBL_STUDENTS ���̺��� ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�)
--   ���ν����� �ۼ��Ѵ�.
--   ��, ID ��  PW �� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� ó���Ѵ�.
--   ���ν����� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENT_UPDATE('moon','java000$','010-9999-9999','������ Ⱦ��');
--> ������ ���� X

EXEC PRC_STUDENT_UPDATE('moon','java006$','010-9999-9999','������ Ⱦ��');
--> ������ ���� O
*/


CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID    IN TBL_IDPW.ID%TYPE
 ,V_PW    IN TBL_IDPW.PW%TYPE
 ,V_TEL   IN TBL_STUDENTS.TEL%TYPE
 ,V_ADDR  IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE ID = V_ID AND V_PW = (SELECT PW FROM TBL_IDPW WHERE ID=V_ID);
END;





















