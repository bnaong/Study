SELECT USER
FROM DUAL;
--==>> SCOTT


--○ TBL_출고 테이블에서 출고수량을 수정(변경)하는 프로시저를 작성한다. -- UPDATE
--   프로시저명 : PRC_출고_UPDATE()
/*
실행 예)
EXEC PRC_출고_UPDATE(출고번호, 변경할수량);
*/

CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( -- ① 매개변수 구성
  V_출고번호    IN TBL_출고.출고번호%TYPE
, V_출고수량    IN TBL_출고.출고수량%TYPE

)
IS
    -- ③ 필요한 변수 선언
    V_상품코드      TBL_상품.상품코드%TYPE;
    V_이전출고수량  TBL_출고.출고수량%TYPE;
    V_재고수량      TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    -- ④ 선언한 변수에 값 담아내기
    -- ⑥
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_이전출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- ⑧ 출고 정상수행여부 판단 필요
    --    변경 이전의 출고수량 및 현재의 재고수량 확인
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- ⑨ 파악한 재고수량에 따라 데이터 변경 실시 여부 판단
    --    (『재고수량+이전출고수량 < 현재출고수량』인 상황이라면... 사용자정의예외 발생)
    IF (V_재고수량 + V_이전출고수량 < V_출고수량)
        -- THEN 사용자정의 예외 발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    -- ② 수행될 쿼리문 체크(UPDATE -> TBL_출고 / UPDATE -> TBL_상품)
    UPDATE TBL_출고
    SET 출고수량 = V_출고수량
    WHERE 출고번호 = V_출고번호;
    
    -- ⑤
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_이전출고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    -- ⑩ 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고부족');
                ROLLBACK;
            
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- ⑦ 커밋
    COMMIT;
END;

-- 논리적인 흐름상 COMMIT이 되어버릴 수 있으므로 COMMIT 위에 예외관련 구문을 작성하는 것이
-- 바람직하겠다.

-----------------------------------------------------------------------------------------

/*
1. PRC_입고_UPDATE(입고번호, 입고수량)
2. PRC_입고_DELETE(입고번호)
3. RPC_출고_DELETE(출고번호)
*/

--1. PRC_입고_UPDATE(입고번호, 입고수량)

CREATE OR REPLACE PROCEDURE PRC_입고_UPDATE
( -- ① 매개변수 구성
  V_입고번호    IN TBL_입고.입고번호%TYPE
, V_입고수량    IN TBL_입고.입고수량%TYPE
)
IS
    -- ③ 필요한 변수 선언
    V_상품코드      TBL_상품.상품코드%TYPE;
    V_재고수량      TBL_상품.재고수량%TYPE;
    V_이전입고수량  TBL_입고.입고수량%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    -- ④ 선언한 변수에 값 담아내기
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_이전입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;


    -- ⑤ 예외상황 생각하기
    -- 재고수량 = 재고수량 - 이전입고수량 + 입고수량 < 0 안됨
    -- 변경될 재고수량 - 출고수량 < 0 안됨
    IF (V_재고수량 - V_이전입고수량 + V_입고수량 < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    

    -- ② 수행될 쿼리문 체크(UPDATE -> TBL_입고 / UPDATE -> TBL_상품)
    UPDATE TBL_입고
    SET 입고수량 = V_입고수량
    WHERE 입고번호 = V_입고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_이전입고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;

    -- ⑦ 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'재고부족');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
        
    
    -- ⑥ 커밋
    COMMIT;
    
END;
-- 현재 재고수량 = 입고(수정할 애) + 원래있던재고(0) - 출고


---------------------------------------------------------------------------------

--2. PRC_입고_DELETE(입고번호)
CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
(
  V_입고번호    IN TBL_입고.입고번호%TYPE
)
IS

    V_삭제할입고수량   TBL_입고.입고수량%TYPE;
    V_재고수량         TBL_상품.재고수량%TYPE;
    V_상품코드         TBL_상품.상품코드%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    
    SELECT 입고수량, 상품코드 INTO V_삭제할입고수량, V_상품코드
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;

    IF (V_재고수량 - V_삭제할입고수량 < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    DELETE
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_삭제할입고수량
    WHERE 상품코드 = V_상품코드;
    
 
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'재고부족');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
 
    COMMIT;
END;
-- 입고수량이 재고수량보다 크면 삭제할 수 없다.
-- 입고수량 빼면 재고수량에서 삭제

---------------------------------------------------------------------------------



--3. RPC_출고_DELETE(출고번호)
CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
( V_출고번호    IN TBL_출고.출고번호%TYPE
)
IS
    V_삭제할출고수량   TBL_출고.출고수량%TYPE;
    V_상품코드         TBL_상품.상품코드%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    
    SELECT 출고수량, 상품코드 INTO V_삭제할출고수량, V_상품코드
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    DELETE
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_삭제할출고수량
    WHERE 상품코드 = V_상품코드;

  
    COMMIT;
END;    
-- 출고수량 빼면 재고수량을 더해줌




----------------------------------------------------------------------------------

--■■■ CURSOR(커서) ■■■--

-- 1. 오라클에서는 하나의 레코드가 아닌 여러 레코드로 구성된
--    작업 영역에서 SQL 문을 실행하고 그 과정에서 발생한 정보를
--    저장하기위해 커서(CURSOR)를 사용하며
--    커서에는 암시적인 커서와 명시적인 커서가 있다.

-- 2. 암시적 커서는 모든 SQL 구문에 존재하며
--    SQL 문 실행 후 오직 하나의 행(ROW)만을 출력하게 된다.
--    그러나 SQL 문을 실행한 결과물(RESULT SET)이
--    여러 행(ROW)으로 구성된 경우
--    커서(CURSOR)를 명시적으로 선언해야 여러 행(ROW)을 다룰 수 있다.

-- 깜짝상자~ 꾹눌러담아놓은 것들이 와아아악 하고 쏟아져나온다.

--○ 커서 이용 전 상황(단일 행 접근 시)
SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.(0.047초)

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || '--' || V_TEL);
END;
--==>>
/*
홍길동--011-2356-4528


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 커서 이용 전 상황(다중 행 접근 시 - 반복문 활용)

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || '--' || V_TEL);
END;
--==>> 에러 발생 (ORA-01422: exact fetch returns more than requested number of rows)


DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE :=1000;
BEGIN
    LOOP
        V_NUM := V_NUM +1;
        
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM = V_NUM;
        
        DBMS_OUTPUT.PUT_LINE(V_NAME || '--' || V_TEL);
        EXIT WHEN V_NUM>=1061;
    END LOOP;
END;
--==>>
/*
홍길동--011-2356-4528
이순신--010-4758-6532
이순애--010-4231-1236
김정훈--019-5236-4221
한석봉--018-5211-3542
이기자--010-3214-5357
장인철--011-2345-2525
김영년--016-2222-4444
나윤균--019-1111-2222
김종서--011-3214-5555
유관순--010-8888-4422
정한국--018-2222-4242
조미숙--019-6666-4444
황진이--010-3214-5467
이현숙--016-2548-3365
이상헌--010-4526-1234
엄용수--010-3254-2542
이성길--018-1333-3333
박문수--017-4747-4848
유영희--011-9595-8585
홍길남--011-9999-7575
이영숙--017-5214-5282
김인수--
김말자--011-5248-7789
우재옥--010-4563-2587
김숙남--010-2112-5225
김영길--019-8523-1478
이남신--016-1818-4848
김말숙--016-3535-3636
정정해--019-6564-6752
지재환--019-5552-7511
심심해--016-8888-7474
김미나--011-2444-4444
이정석--011-3697-7412
정영희--
이재영--011-9999-9999
최석규--011-7777-7777
손인수--010-6542-7412
고순정--010-2587-7895
박세열--016-4444-7777
문길수--016-4444-5555
채정희--011-5125-5511
양미옥--016-8548-6547
지수환--011-5555-7548
홍원신--011-7777-7777
허경운--017-3333-3333
산마루--018-0505-0505
이기상--
이미성--010-6654-8854
이미인--011-8585-5252
권영미--011-5555-7548
권옥경--010-3644-5577
김싱식--011-7585-7474
정상호--016-1919-4242
정한나--016-2424-4242
전용재--010-7549-8654
이미경--016-6542-7546
김신제--010-2415-5444
임수봉--011-4151-4154
김신애--011-4151-4444
최혜인--010-2509-1783


PL/SQL 프로시저가 성공적으로 완료되었습니다.


*/



/*
일반변수 -> 선언
예외변수 -> 선언

변수명  자료형
V_NUM   NUMBER;
U_ERR   EXCEPTION;
커서명  CURSOR;    --(X)

*/


--◆ 우리끼리의 약속~!!!
/*
커서 -> 정의

TABLE 테이블명
INDEX 인덱스명
USER 유저명

CURSOR 커서명      --(O)
*/


--○ 커서 이용 후 상황
DECLARE
    -- 주요 변수 선언
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서 정의  CHECK~!!!
    CURSOR CUR_INSA_SELECT         -- 타입(커서 = 상자) 이름(눌러담은 것들에 대한 이름);
    IS
    SELECT NAME, TEL               -- 눌러담은 것들
    FROM TBL_INSA;
    
BEGIN
    -- 오픈 커서
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 (와~!!!)쏟아져나오는 데이터들을 처리(반복문을 활용하여 처리)
    LOOP
        -- 한 행 한 행 받아다가 처리하는 행위 -> 가져오다(데려오다) -> 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- 언제까지? (EXIT WHEN)
        -- -> 커서에서 더 이상 데이터가 쏟아져 나오지 않는 상태 -> 『NOTFOUND』
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || '--' || V_TEL);
    END LOOP;
    
        -- 클로즈 커서
        CLOSE CUR_INSA_SELECT;
END;


--※ 오라클이 제공하는 커서는 자체로 닫아주기 때문에 클로즈 구문때문에 에러가 나는 경우가 있음을 주의


-----------------------------------------------------------------------------------

--■■■ TRIGGER(트리거) ■■■--

-- 사전적인 의미 : 방아쇠, 촉발시키다, 야기하다, 유발하다.
-- 부비트랩 : 내가 뭔가 설치해놓고 그 자리를 비우더라도 내가 원하는 일이 발생하도록 하는 것

-- 1. TRIGGER(트리거)란 DML 작업 즉, INSERT, UPDATE, DELETE 작업이 일어날 때
--    자동적으로 실행되는(유발되는) 객체로
--    이와 같은 특징을 강조하여 DML TRIGGER 라고 부르기도 한다.
--    TRIGGER는 무결성 뿐 아니라 다음과 같은 작업에도 널리 사용된다.

-- 자동으로 파생된 열 값 생성 : 내가 자리를 비웠을 때 누가 떠들면 반장이 이름적는것 처럼 노트를 열어두고 떠드는 사람이 있으면 자동으로 이름적게 하는 것
-- 잘못된 트랜잭션 방지 : 입고가 되었는데 재고가 늘지 않는 것을 방지한다는 의미
-- 복잡한 보안 권한 강제 수행 : 우리 회사에서는 업무시간에 주식사이트에 들아가지 않도록 만들어놓았어
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행 : 한 테이블스페이스 안에 테이블1 테이블2이 있어서 서로 상호간에 참조관계를 형성시킬 수 있는데
-- 10 20 30 만 잇으면 40을 입력하지 못하도록 하는게 참조무결성인데.. 제약조건으로 막는데 한 서로 다른 테이블 스페이스안에 들어있으면 이러한 일들이 (지금은 가능하지만)
-- 안되므로.. 제약조건을 활용하지 못할 때 트리거를 활용할 수 있다는 것
-- 복잡한 업무 규칙 강제 적용 : 우리 회사에서는 업무시간에 주식사이트에 들아가지 않도록 만들어놓았어
-- 투명한 이벤트 로깅 제공 : 누가 INSERT, UPDATE(이벤트)를 했을 때 로그(기록)을 투명하게 기록을 남길 수 있는 트리거가 기능을 제공한다.
-- 복잡한 감사 제공 : 자동으로 파생된 열 값 생성,  투명한 이벤트 로깅 제공과 같은 의미의 기능
-- 동기 테이블 복제 유지관리 : 
-- 테이블 액세스 통계 수집 : 하나하나 로깅해야 통계를 수집할 수 있음

-- 로그 : 중세시대때 강을 건널때 쓰는 성문(다리를 통과하는 사람을 명부작성했었음)
-- 로깅 : 로그(기록)을 남기는 행위

-- 2. TRIGGER(트리거) 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다.
-- 사용자가 프로시저를 호출하는 것처럼 사용하는게 아니라 트리거가 있는지도 모르는 상태로 사용하게 된다.

-- 3. 특징 및 종류
-- 트리거가 동작해야하는 시점을 기준으로 트리거 분류
-- 앞에서 동작해야하는 트리거 (BEFORE 트리거 - 맞기전에 막아야할 때)
--   - BEFORE STATEMENT : 하나(단일)의 케이스에 의해 동작해야할 때(떠든사람 이름 적을 때)
--   - BEFORE ROW       : 테이블의 각각의 행들을 다 훑어봐야할 때(테이블에서 입고, 재고가 바뀔 때)
-- 사후에 동작해야하는 트리거 (AFTER 트리거 - 떠든다음에 떠든사람의 이름을 적어야함)
--   - AFTER STATEMENT
--   - AFTER ROW

-- 4. 형식 및 구조
/*
CREATE [OR REPLACE] TRIGGER 트리거명
    [BEFORE | AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명
    [FOR EACH ROW [WHEN TRIGGER 조건]]
[DECLARE]
    -- 선언 구문;
BEGIN
    -- 실행 구문;
END;
*/
-- FOR EACH ROW : ROW 트리거(행트리거)에만 써야하는 옵션
-- 안써두됨 : STATEMENT 트리거에서는 생략해도된다.
-- INSERT가 일어났을 때만 동작하게 하는 트리거 -> INSERTING
-- DELETE가 일어났을 때만 동작하게 하는 트리거 -> DELETING
-- UPDATE가 일어났을 때만 동작하게 하는 트리거 -> UPDATING
-- INSERT, DELETE, UPDATE 등 여러 상황일 때 동작하게 하려면 전부 적어주면 된다.


--■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■--
--※ DML 작업에 대한 이벤트 기록
-- 떠든 사람 이름 적자~ (AFTER--떠든후에적어, STATEMENT--테이블확인안해도돼)

--○ AFTER STATEMENT TRIGGE(트리거) 생성

CREATE OR REPLACE TRIGGER TRG_EVENTLOG
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_TEST1     -- ON 뒤에 올 테이블명은 TRIGGER에 대한 로그가 기록될 테이블이 아닌, TRIGGER를 붙여놓은 테이블
BEGIN
    -- 이벤트 종류 구분(조건문을 통한 분기)
    IF (INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('INSERT 쿼리가 실행되었습니다.');
    ELSIF (UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('UPDATE 쿼리가 실행되었습니다.');
    ELSIF (DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('DELETE 쿼리가 실행되었습니다.');
    END IF;
    
    -- ※ TRIGGER 내에서는 COMMIT / ROLLBACK 구문 사용 불가~!!!
END;


-----------------------------------------------------------------------------------------


--■■■ BEFORE STATEMENT TRIGGER 상황 실습 ■■■--
--※ DML 작업을 수행하기 전에 작업에 대한 가능여부 확인


--○ TRIGGER(트리거) 생성 -> TRG_TEST1_DML
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 9 OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        --THEN 예외를 발생시키도록 하겠다.
        THEN RAISE_APPLICATION_ERROR(-20003, '작업 시간은 09:00 - 18:00 까지만 가능합니다.');
    
    END IF;
END;
--==>> Trigger TRG_TEST1_DML이(가) 컴파일되었습니다.


-- 트리거 내에서는 변수선언을 가급적 하지 않는다..(사용자의 의지와 상관없이 실행되기 때문에..)




-----------------------------------------------------------------------------------------


--■■■ BEFORE ROW TRIGGER 상황 실습 ■■■--
--※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델


--○ TRIGGER(트리거) 생성 -> TRG_TEST2_DELETE

CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
    BEFORE
    DELETE ON TBL_TEST2
    FOR EACH ROW
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
    
END;
--==>> Trigger TRG_TEST2_DELETE이(가) 컴파일되었습니다.

-- 과거 -> 『:OLD』 ,  미래 -> 『:NEW』

-- UPDATE <== DELETE + INSERT )


-- UPDATE 10번돌아감, INSERT 10번 돌아감 -> UPDATE구문이 더비효율적

--※ 『:OLD』
--   참조 전 열의 값을 의미
--   (INSERT 에서는 입력하기 이전 자료 즉, 입력할 자료이고
--      DELETE 에서는 삭제하기 이전 자료 즉, 삭제할 자료이다.)


-- ※ UPDATE
--    내부적으로 DELETE + INSERT 로 결합된 형태.
--   오라클 내부에서 UPDATE를 수행할 수 있는 모듈이 없고, DELETE와 INSERT를 수행할 수 있는 모듈이 있고, 그들이 합쳐져서 수행
--   UPDATE 하기 이전의 데이터는 『:OLD』
--   UPDATE 수행한 이후의 데이터는 『:NEW』



--■■■ AFTER ROW TRIGGER 상황 실습 ■■■--
--※ 참조 테이블 관련 트랜잭션 처리































