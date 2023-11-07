SELECT USER
FROM DUAL;
--==>> SCOTT

/* (231103_01_scott(pqlsql)
    6-문제 & 같이 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
-- 방법1
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
    V_PW2   TBL_IDPW.PW%TYPE;       -- 사용자가 입력한 PW를 담을 변수
    V_FLAG  NUMBER := 0;            -- 패스워드일치:1 / 패스워드불일치:2
BEGIN
    -- 작성개념1) FROM TBL_IDPW를 통해 ID 확인;
    
    -- 작성개념2) 'moon'일 것이다고 가정하고
    --              사용자가 입력한 PW를 받을 수 있도록 작성    
    SELECT PW INTO V_PW2
    FROM TBL_IDPW
    WHERE ID = 'moon';
    
    -- 조건에 따라 분기(사용자 입력PW, 테이블을 통해 얻은 PW - 일치/ 불일치)
    IF (V_PW = V_PW2)       -- 패스워드 일치
        THEN V_FLAG := 1;
    ELSE                    -- 패스워드 불일치
        V_FLAG := 2;
    END IF;
    
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID=V_ID
--      AND 패스워드 일치;
      AND V_FLAG = 1;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE이(가) 컴파일되었습니다.


-- 방법2
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( 
  V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE  
)
IS
BEGIN
    
    -- 두개의 테이블을 JOIN 해서 업데이트
    UPDATE (SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR    -- 괄호 안의 서브쿼리만 잡아서 조회해보기
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2   
            ON T1.ID = T2.ID) T
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE T.ID = V_ID
      AND T.PW = V_PW;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE이(가) 컴파일되었습니다.

/* 1-문제 & 같이 푼 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.  
--  NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG 으로 구성된 컬럼 중  
--  NUM(사원번호) 을 제외한 항목의 데이터 입력 시   
--  해당 항목의 값은 기존 부여된 사원 번호의 마지막 번호 그 다음 번호를  
--  자동으로 입력 처리할 수 있는 프로시저를 구성한다.  
--  프로시저명 : PRC_INSA_INSERT()
/*
실행 예)
EXEC PRC_INSA_INSERT('최혜인', '970812-2234567', SYSDATE, '서울', '010-2509-1783', '개발부', '대리', 2000000, 2000000) -- 이백만, 이백만
-> 위와 같이 프로시저 호출 및 실행

1061 최혜인 970812-2234567 2023-11-06 서울 010-2509-1783 개발부 대리 2000000 2000000
*/

DESC TBL_INSA;
--==>>
/*
이름       널?       유형           
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
    -- 기존 부여된 사원번호의 마지막 번호
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
-- PLSQL 구문과 쿼리문을 통해 조회할 때의 메모리구조(메모리영역)가 다르다. 불가능한 구문

--SELECT MAX(NVL(NUM,0)) INTO V_NUM
--FROM TBL_INSA;
-- 이 구조는 두 번의 과정을 거쳐 이루어짐


------------------------------------------------------------------------------------------------------


--※ 20231106_02_scott.sql 파일을 활용하여
--   TBL_상품, TBL_입고 테이블을 대상으로
--   TBL_입고 테이블에 데이터 입력 시(즉, 입고 이벤트 발생 시)
--   TBL_상품 테이블의 해당 상품에 대한 재고수량이 함께 변동될 수 있는 기능을 가진
--   프로시저를 작성한다.
--   단 이 과정에서 입고번호는 자동 증가 처리한다. (시퀀스 사용 안함)
--   TBL_입고 테이블 구성 컬럼은
--   입고번호, 상품코드, 입고일자, 입고수량, 입고단가이며
--   프로시저 호출을 통해 전달할 파라미터는 상품코드, 입고수량, 입고단가이다.
--   프로시저명 : PRC_입고_INSERT(상품코드, 입고수량, 입고단가)


CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드    IN TBL_입고.상품코드%TYPE
, V_입고수량    IN TBL_입고.입고수량%TYPE
, V_입고단가    IN TBL_입고.입고단가%TYPE
)
IS
    -- 선언부
    V_입고번호 TBL_입고.입고번호%TYPE;
BEGIN
    -- 실행부
    -- SELECT 쿼리문 수행
    SELECT NVL(MAX(입고번호),0) INTO V_입고번호
    FROM TBL_입고;

    -- INSERT 쿼리문 수행    
    INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가)
    VALUES ((V_입고번호+1),V_상품코드, V_입고수량, V_입고단가);

    -- UPDATE 쿼리문 수행    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 입고는 되었는데 재고수량이 안되는 등의 일이 일어나면 무결성과 트랜잭션이 깨져버림.
    -- 예외 처리
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
        -- OTHERS(=기존 프로세스에서 벗어난 모든 상황)이 아니라면 롤백해라(기본상황)
    
    -- 커밋
    COMMIT;
END;


/*
혜성					        윤수
농협					        신한
1,200,000 -> 200,000			0 -> 1,000,000


UPDATE 고객계좌				    UPDATE 고객계좌
SET 잔액 = 200,000			    SET 잔액 = 1,000,000		
WHERE 예금주코드 = 혜성			WHERE 예금주코드 = 윤수	


둘 중에 하나가 수행되지 않으면 ROLLBACK 됨
둘 다 처리되면 COMMIT 됨
--> 트랜잭션 처리
*/




--------------------------------------------------------------------------------

--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ TBL_MEMBER 테이블에 데이터를 입력하는 프로시저를 작성
--   단, 이 프로시저를 통해 데이터를 입력할 경우
--   CITY(지역) 항목에 '서울', '경기', '대전'만 입력이 가능하도록 구성한다.
--   이 지역 외의 다른 지역을 프로시저 호출을 통해 입력하려는 경우
--   (즉, 유효하지 않은 데이터 입력을 시도하려는 경우)
--   예외에 대한 처리를 하려고 한다.
--   프로시저명 : PRC_MEMBER_INSERT()
/*
실행 예)
EXEC PRC_MEMBER_INSERT('박범구','010-1111-1111','서울');
--> 데이터 입력 ○

EXEC PRC_MEMBER_INSERT('김경태','010-2222-2222','부산');
--> 데이터 입력 X

*/


CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 선언
    V_NUM   TBL_MEMBER.NUM%TYPE;
    
    -- 사용자 정의 예외에 대한 변수 선언
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN

    -- 프로시저를 통해 입력 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
    -- 가장 먼저 확인할 수 있도록 코드 구성
    IF (V_CITY NOT IN ('서울','경기','대전'))
    -- 예외 발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(NUM),0) INTO V_NUM
    FROM TBL_MEMBER;
    
    -- 쿼리문 구성 -> INSERT
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES ((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    -- 예외 처리 구문
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'서울,경기,대전만 입력이 가능합니다.');
                 ROLLBACK;
            -- 오라클 내장함수(에러번호) : 20000번까지는 오라클 내부에 에러가 코드화 되어있음.
            --                            EXCEPTION 테이블을 통해 확인 후 코드를 약속해서 사용
            -- 발생한 예외가 20001번 이라면~ 이라는 방식으로 분기 나눌 수 있음
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- 커밋
    COMMIT;
END;


--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가,
--   또한, 출고수량이 재고수량보다 많은 경우...
--   출고 액션을 취소할 수 있도록 처리한다.
--   프로시저명 : PRC_출고_INSERT()
-- 해당 상품 테이블의 재고수량을 확인먼저 한 후 예외처리하기

/*
실행 예)
EXEC PRC_출고_INSERT('H001', 10, 600);

--> 바밤바(H001) 재고수량 확인 후

EXEC PRC_출고_INSERT('H001', 80, 600)
*/


CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드    IN TBL_출고.상품코드%TYPE
, V_출고수량    IN TBL_출고.출고수량%TYPE
, V_출고단가    IN TBL_출고.출고단가%TYPE
)
IS
    V_출고번호 TBL_출고.출고번호%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 재고 수량 파악 -> 기존 재고를 확인하는 과정이 선행되어야 한다.
    -- 그래야 프로시저 호출 시 넘겨받는 출고수량과 비교가 가능하기 때문
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    IF (V_출고수량 > V_재고수량)
    -- 예외 발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    SELECT NVL(MAX(출고번호),0) INTO V_출고번호
    FROM TBL_출고;

    -- 쿼리문 구성 -> INSERT(TBL_출고)
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES ((V_출고번호+1), V_상품코드, V_출고수량, V_출고단가);
    
    -- 쿼리문 구성 -> UPDATE(TBL_상품)   
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
 
    -- 예외 처리 구문
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'입력한 출고수량이 재고수량을 초과했습니다.');
                 ROLLBACK;   
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋
    COMMIT;
    
END;


-----------------------------------------------------------------------------------




--○ TBL_출고 테이블에서 출고수량을 수정(변경)하는 프로시저를 작성한다. -- UPDATE
--   프로시저명 : PRC_출고_UPDATE()
/*
실행 예)
EXEC PRC_출고_UPDATE(출고번호, 변경할수량);
*/


CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( V_출고번호    IN TBL_출고.출고번호%TYPE
, V_변경할수량  NUMBER
)
IS
    V_상품코드 TBL_출고.상품코드%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
    V_출고수량 TBL_출고.출고수량%TYPE;
    
    -- 예외 처리 변수 선언
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT 상품코드 INTO V_상품코드
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;

    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    SELECT 출고수량 INTO V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;   
        
    IF ((V_재고수량 - (V_변경할수량 - V_출고수량)) < 0)
--    IF (V_재고수량 + V_출고수량) < V_변경할수량
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    

    UPDATE TBL_출고
    SET 출고수량 = V_변경할수량
    WHERE 출고번호 = V_출고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = V_재고수량 - (V_변경할수량 - V_출고수량)
--    SET 재고수량 = (V_재고수량 + V_출고수량) - V_변경할수량
    WHERE 상품코드 = (SELECT 상품코드 FROM TBL_출고 WHERE 출고번호 = V_출고번호);
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'재고부족');
            ROLLBACK;   
        WHEN OTHERS
            THEN ROLLBACK;
            
    COMMIT;
END;

SELECT *
FROM TBL_상품;

SELECT *
FROM TBL_출고;
















