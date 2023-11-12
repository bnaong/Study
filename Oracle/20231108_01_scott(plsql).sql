SELECT USER
FROM DUAL;
--==>> SCOTT

--○ TBL_출고 테이블의 데이터 입력, 수정, 삭제 시
--   TBL_상품 테이블의 해당 상품에 대한 재고수량 변동 트리거 작성
--   트리거명 : TRG_CHULGO
--   제출 파일명 : 오라클_트리거_홍길동.sql
--   재고 부족 관련 예외 처리
--   (변수 선언 필요)


CREATE OR REPLACE TRIGGER TRG_CHULGO
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_출고
    FOR EACH ROW
    
DECLARE
    V_재고수량        TBL_상품.재고수량%TYPE;         
BEGIN

    IF (INSERTING)
        THEN
        SELECT 재고수량 INTO V_재고수량
        FROM TBL_상품
        WHERE 상품코드 = :NEW.상품코드;
        
        IF(V_재고수량 - :NEW.출고수량 < 0)
            THEN RAISE_APPLICATION_ERROR(-20004, '재고부족');
        END IF;        
        
        UPDATE TBL_상품
        SET 재고수량 = 재고수량 - :NEW.출고수량
        WHERE 상품코드 = :NEW.상품코드;      
        
    ELSIF (UPDATING)
        THEN
        SELECT 재고수량 INTO V_재고수량
        FROM TBL_상품
        WHERE 상품코드 = :NEW.상품코드;
        
        IF(V_재고수량 + :OLD.출고수량 - :NEW.출고수량 < 0)
            THEN RAISE_APPLICATION_ERROR(-20004, '재고부족');      
        END IF;
        
        UPDATE TBL_상품
        SET 재고수량 = 재고수량 + :OLD.출고수량 - :NEW.출고수량
        WHERE 상품코드 = :OLD.상품코드;
        
    ELSIF (DELETING)
        THEN UPDATE TBL_상품
        SET 재고수량 = 재고수량 + :OLD.출고수량
        WHERE 상품코드 = :OLD.상품코드;
        
    END IF;
END;


--■■■ PACKAGE(패키지) ■■■--

-- 1. PL/SQL 의 패키는 관계되는 타입, 프로그램 객체,
--    서브 프로그램(PROCEDURE, FUNCTION 등)을
--    논리적으로 묶어놓은 것이다.(실제 존재하는 어떤 폴더나 테이블스페이스나 디스크나 파티션이 중요한 게 아니다. 편의성을 위해 만들어놓은 것)
--    오라클에서 제공하는 패키지 중 하나가 바로 『DBMS_OUTPUT』이다.
--    PUT_LINE() 도  DBMS_OUTPUT 패키지 안에 들어있는 함수 중 하나

-- 2. 패키지는 서로 유사한 업무에 사용되는 여러 개의 프로시저와 함수를
--    하나의 패키지로 만들어 관리함으로써 향후 유지보수가 편리하고
--    전체 프로그램을 모듈화 할 수 있다는 장점이 있다.

-- 3. 패키지는 명세부(PACKAGE SPECIFICATION)와
--    몸체부(PACKAGE BODY)로 구성되어 있으며
--    명세 부분에는 TYPE, CONSTRAINT, VARIABLE, EXCEPTION, CURSOR, SUBPROGRAM 이 선언되고
--    몸체 부분에는 이들의 실제 내용이 존재한다.
--    그리고, 호출할 때에는 패키지명.프로시저명 과 같은 형식의 참조를 이용해야 한다.

-- 4. 형식 및 구조(명세부)  -- 상자 바깥에 뭐 들어있는지 라벨링 해놓은 것
/*
CREATE [OR REPLACE] PACKAGE 패키지명    --> 명세부의 패키지명과 몸체부의 패키지명은 일치해야함
IS
    전역변수 선언;
    커서 선언;
    예외 선언;
    함수 선언;
    프로시저 선언;
        :
END 패키지명;
*/



-- 5. 형식 및 구조(몸체부)  -- 상자
/*
CREATE [OR REPLACE] PACKAGE BODY 패키지명
IS
    FUNCTION 함수명[(인수, ...)]
    RETURN 자료형
    IS
        변수선언;
    BEGIN
        함수 몸체 구성 코드;
        RETURN 값;
    END;
    
    PROCEDURE 프로시저명[(인수, ...)]
    IS
        변수 선언;
    BEGIN
        프로시저 몸체 구성 코드;
    END;
END 패키지명;
*/


--○ 패키지 등록 실습

-- ① 명세부 작성
CREATE OR REPLACE PACKAGE INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2;
    
--    FUNCTION FN_GENDER(V_SSN VARCHAR2)
--    RETURN VARCHAR2;
--    
--    FUNCTION FN_GENDER(V_SSN VARCHAR2)
--    RETURN VARCHAR2;
--    
--    PROCEDURE 프로시저명(매개변수);
END INSA_PACK;
--==>> Package INSA_PACK이(가) 컴파일되었습니다.


-- ② 몸체부 작성
CREATE OR REPLACE PACKAGE BODY INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2
    IS
        V_RESULT VARCHAR2(20);
    BEGIN
        IF (SUBSTR(V_SSN,8,1) IN ('1','3'))
            THEN V_RESULT := '남자';
        ELSIF (SUBSTR(V_SSN,8,1) IN ('2','4'))
            THEN V_RESULT := '여자';
        ELSE
            V_RESULT := '확인불가';
        END IF;
        
        RETURN V_RESULT;
    END;
    
END INSA_PACK;
--==>> Package Body INSA_PACK이(가) 컴파일되었습니다.


















