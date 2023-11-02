SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ PL/SQL ■■■--

-- 1. PL/SQL(Procedural Language extension to SQL) 은
--    프로그래밍 언어의 특성을 가지는 SQL의 확장이며
--    데이터 조작과 질의 문장은 PL/SQL의 절차적 코드 안에 포함된다.
--    또한, PL/SQL 을 사용하면 SQL 로 할 수 없는 절차적 작업이 가능하다.
--    여기에서 『절차적』 이라는 단어가 가지는 의미는
--    어떤 것이 어떤 과정을 거쳐 어떻게 완료되는지
--    그 방법을 정확하게 코드에 기술한다는 것을 의미한다.

/*
- PL/SQL?
이제 곧 배울 프로시저나 트리거나 펑션들은 PL/SQL영역에 속한다.
크게 SQL문법과 PL/SQL문법 둘로 나누어져있다고 볼 수 있다.
PL/SQL은 SQL문법의 확장판이라고 볼 수 있다. PL은 절차적인(P) 언어(L)라는 의미를 품고있다.
지금까지는 자바랑 다른 구조로 오라클을 들여다보았지만,
PL/SQL은 프로그램적 특성을 가져 자바와 비슷한 부분이 많다고 느낄 것이다
(변수선언, 조건에 따른분기, 반복문, TRUE FALSE로 실행흐름을 컨트롤하는 등)
따라서, PL/SQL은 변수를 선언하고 어떤 것이 어떤 과정을 거쳐 완료되는지
코드에 기술하므로 절차적이라는 단어로 표현할 수 있을 것이다.
*/

-- 2. PL/SQL 은 절차적으로 표현하기 위해
--    변수를 선언할 수 있는 기능,
--    참과 거짓을 구별할 수 있는 기능,
--    실행흐름을 컨트롤할 수 있는 기능 등을 제공한다.

-- 3. PL/SQL 은 블럭 구조로 되어 있으며,
--    블럭은 선언 부분, 실행 부분, 예외 처리 부분의
--    세 부분으로 구성되어 있다.
--    또한, 반드시 실행 부분은 존재해야 하며, 구조는 다음과 같다.

/*
- 블럭구조?
자바에서 『{}』로 영역구분을 하듯 PL/SQL은 『구문 END 구문;』과 같이 블럭단위로 구조화하며,
영역을 나누기 때문에 구분을 잘 해서 사용해야 한다.
PL/SQL 구문은 독립적인 워크시트를 가져야하는 것은 아니지만
PL/SQL 구문은 실행할 부분을 꼭 블럭잡아서 실행하지 않으면 F5 누른것처럼
워크시트가 전부 실행되어 버린다.(오라클이 아닌 SQL DEVELOPER가 그렇게 설정해놓음)
실습할 때 SQL구문들과 구분하여 사용하기 헷갈리므로
짤막한 PL/SQL 구문이더라도 독립적으로 워크시트를 나누어서 작성하겠다.
*/

-- 4. 형식 및 구조
/*
[DECLARE]
    -- 선언문(DECLARATIONS)
BEGIN
    -- 실행문(STATEMENTS)
    
    [EXCEPTION]
        -- 예외 처리문(EXCEPTION HANDLERS)
END;
*/
--> 처음에는 DECLARE BEGIN END; 뼈대를 먼저 작성하기!

-- 5. 변수 선언
/*
DECLARE
    -- 변수 선언부
    변수명 자료형;
    변수명 자료형 :=초기값;
BEGIN
END;
*/
--> 자바는 자료형 변수형; 의 형태로 변수를 선언하지만
--  PL/SQL은 변수명 자료형; 의 형태로 변수를 선언한다.
--  이는 테이블을 생성할 때 컬럼명 자료형 의 형태로 테이블을 구성하는 것과 같은 형식


--※ DBMS_OUTPUT.PUT_LINE() 을 통해
--   화면에 결과를 출력하기 위한 환경변수 설정
SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.(스크립트 출력 아래에 나옴)
--  SERVEROUTPUT이라는 리소스를 이용하는데, 이걸 사용하지 않는데 켜져있으면
--  다른 곳에서도 리소스를 소모하는데 리소스 소모가 크기 때문에
--  필요할 때만 켜서 쓰라는 의도가 담겨있음


--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
DECLARE
    -- 선언부(변수 선언과 초기화)
    V1 NUMBER :=10;                 --> 자바의 대입연산자는 '='이지만 PL/SQL에서는 ':='를 사용
    V2 VARCHAR2(30) :='HELLO';
    V3 VARCHAR2(30) :='Oracle';
BEGIN
    -- 실행부(연산 및 처리)
    -- System.out.prinln(V1);
    DBMS_OUTPUT.PUT_LINE(V1);       --> 출력구문
    DBMS_OUTPUT.PUT_LINE(V2);       -- DBMS_OUTPUT = System.out / .PUT_LINE(); = .println();
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>>
/*
10
HELLO
Oracle


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
DECLARE
    -- 선언부
    V1 NUMBER := 10;
    V2 VARCHAR2(30) := 'HELLO';
    V3 VARCHAR2(30) := 'ORACLE';
BEGIN
    -- 실행부
    -- (연산 및 처리)
    V1 := V1 + 20;          -- NUM1 = NUM1 + 20 -> NUM1 += 20; 자바의 복합대입연산자 오라클에는 없다.
    V2 := V2 || '정한울';
    V3 := V3 || 'World~!!!';
    
    -- (결과출력)
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>>
/*
30
HELLO정한울
ORACLEWorld~!!!


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/



--○ IF 문(조건문)

-- IF ~ THEN ~ ELSE ~ END IF;                   --> CASE에서 쓰이는 THEN, ELSE와 같은 의미

-- 1. PL/SQL 의 IF 문장은 다른 언어의 IF 조건문과 거의 유사하다.
--    일치하는 조건에 따라 선택적으로 작업을 수행할 수 있도록 한다.
--    TRUE 이면 THEN 과 ELSE 사이의 문장을 수행하고
--    FALSE 나 NULL 이면 ELSE 와 END IF; 사이의 문장을 수행하게 된다.


-- 2. 형식 및 구조
/*
IF 조건
    THEN 처리문;
END IF;
*/

/*
IF 조건
    THEN 처리문;
ELSE
    처리문;
END IF;
*/
-- ELSE에는 처리문앞에 THEN 이 안붙는 것을 주의하자!!

/*
IF 조건
    THEN 처리문;
ELSIF
    THEN 처리문;
ELSIF
    THEN 처리문;
ELSE
    처리문;
END IF;
*/
-- 오라클도 IF문 중첩이 가능하다! 하지만 자바처럼 ELSE IF 형태가 되어버리면
-- 각각의 ELSE IF마다 END IF; 가 필요해지므로 ELSIF로 표현하도록 정해놓음



--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
/*
GRADE NUMBER;	-- NUMBER의 최대값(38)을 가짐
GRACE CHAR;	    -- CHAR의 최소값을 가짐
*/


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
FAIL


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/



DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
BEST


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'C'
        THEN DBMS_OUTPUT.PUT_LINE('GOOD');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
BEST


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('GOOD');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
BEST


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
--> 한번 조건에 맞는 IF가 실행되면 그 뒤에 있는 IF문들은 살펴보지 않는다.



--○ CASE 문(조건문)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;


-- 1. 형식 및 구조
/*
CASE 변수
    WHEN 값1 THEN 실행문;
    WHEN 값2 THEN 실행문;
    ELSE 실행문;
END CASE;
*/
--> 자바와 비교했을 때 SWITCH문과 비슷하다.

-- ACCEPT 구문 : PL/SQL 기본구문에서 사용가능한 구문으로 .. 자바처럼 외부에서 안으로 값을
-- 받아들여옴. 받아들여온 값을 NUM 변수에 담겠다.
--실제로는
-- 당분간 테스트를 해봐야하기 때문에 SQL DEVELOPER에서 임시로 사용하는 구문이다~

ACCEPT NUM PROMPT '남자 1 여자 2 입력하세요';

DECLARE
    -- 선언부
    -- (주요 변수 선언)
    SEL NUMBER := &NUM;
    RESULT VARCHAR2(20) := '확인불가';
BEGIN
    -- 실행부
    -- (테스트)
    --DBMS_OUTPUT.PUT_LINE('SEL : ' || SEL);
    -- System.out.println("sel : " + sel);
    --DBMS_OUTPUT.PUT_LINE('RESULT : ' || RESULT);
    
    -- (연산 및 처리)
    /*
    CASE SEL
        WHEN 1
        THEN DBMS_OUTPUT.PUT_LINE('남자입니다');
        WHEN 2
        THEN DBMS_OUTPUT.PUT_LINE('여자입니다');
        ELSE
            DBMS_OUTPUT.PUT_LINE('확인불가');
    END CASE;
    */
    CASE SEL
        WHEN 1 THEN RESULT := '남자';
        WHEN 2 THEN RESULT := '여자';
        ELSE RESULT := '확인불가';
    END CASE;
    
    -- (결과 출력)
    DBMS_OUTPUT.PUT_LINE('처리 결과는 ' || RESULT || '입니다.');
END;
--==>>
/*
여자입니다


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--==>>
/*
처리 결과는 여자입니다.


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--※ 외부 입력 처리
-- ACCEPT 구문
-- ACCEPT 변수명 PROMPT '메세지';
--> 외부 변수로부터 입력받은 데이터를 내부 변수에 전달할 때
--  『&외부변수명』 형태로 접근하게 된다.


--○ 임의의 정수 2개를 외부로부터(사용자로부터) 입력받아
--   이들의 덧셈 결과를 출력하는 PL/SQL 구문을 작성한다.
-- 실행 예)
-- 첫 번째 정수를 입력하세요 -> 10
-- 두 번째 정수를 입력하세요 -> 20
--==>> 10 + 20 = 30

ACCEPT NUM1 PROMPT '첫 번째 정수를 입력하세요 -> ';
ACCEPT NUM2 PROMPT '두 번째 정수를 입력하세요 -> ';

DECLARE
    -- 변수 선언
    JUNGSU1 NUMBER := &NUM1;
    JUNGSU2 NUMBER := &NUM2;
    RESULT NUMBER := JUNGSU1 + JUNGSU2;
BEGIN
    -- 테스트
    --DBMS_OUTPUT.PUT_LINE(JUNGSU1);
    --DBMS_OUTPUT.PUT_LINE(JUNGSU2);
    --DBMS_OUTPUT.PUT_LINE(RESULT);
    
    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE(JUNGSU1 || ' + ' || JUNGSU2 || ' = ' || RESULT );
    --DBMS_OUTPUT.PUT_LINE(JUNGSU1 || ' + ' || JUNGSU2 || ' = ' || (JUNGSU1+JUNGSU2));
END;
--==>>
/*
10 + 20 = 30


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 사용자로부터 입력받은 금액을 화폐단위로 구분하여 출력하는 프로그램을 작성한다.
--   단, 입력에 대한 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.
/*
실행 예)
바인딩 변수 입력 대화창 -> 금액입력 : 990

입력받은 금액 총액 : 990원
화폐단위 : 오백원 1, 백원 4, 오십원 1, 십원 4
*/



-- 내 풀이
ACCEPT IP PROMPT '금액 입력 : ';

DECLARE
    TOTAL NUMBER := &IP;
    FH NUMBER := TRUNC(&IP / 500);
    H NUMBER := TRUNC((&IP-(500*FH)) / 100);
    FT NUMBER := TRUNC((&IP-(500*FH)-(100*H)) / 50);
    T NUMBER := TRUNC((&IP-(500*FH)-(100*H)-(50*FT)) / 10);
BEGIN
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : ' || TOTAL || '원');
    

    DBMS_OUTPUT.PUT_LINE('화폐단위 : ' || '오백원 ' || FH || ', ' || '백원 ' || H || ', ' || '오십원 ' || FT ||', ' || '십원 ' || T);
END;
--> DECLARE 과 BEGIN 사이에서는 변수 선언 및 초기화만 하는 것이 바람직하다!


-- 선생님 풀이
ACCEPT INPUT PROMPT '급액 입력'
DECLARE
    --○ 주요 변수 선언
    MONEY  NUMBER := &INPUT;        -- 연산을 위해 입력값을 담아둘 변수
    MONEY2 NUMBER := &INPUT;        -- 결과 출력을 위해 입력값을 담아둘 변수
                                    -- (MONEY 변수가 연산을 처리하는 과정에서 값이 변하기 때문에..)
                                    
    M500   NUMBER;                  -- 500원 짜리 갯수를 담아둘 변수
    M100   NUMBER;                  -- 100원 짜리 갯수를 담아둘 변수
    M50    NUMBER;                  --  50원 짜리 갯수를 담아둘 변수
    M10    NUMBER;                  --  10원 짜리 갯수를 담아둘 변수
BEGIN
    --○ 연산 및 처리
    -- MONEY 를 500으로 나눠서 몫을 취하고 나머지는 버린다.    -> 500원의 갯수
    M500 := TRUNC(MONEY / 500);
    
    -- MONEY 를 500으로 나눠서 몫은 버리고 나머지를 취한다.    -> 500원의 갯수 확인 후 남은 금액
    -- 이 금액으로 MONEY를 갱신
    MONEY := MOD(MONEY,500);
    
    -- MONEY 를 100으로 나눠서 몫을 취하고 나머지는 버린다.    -> 100원의 갯수
    M100 := TRUNC(MONEY/100);
    
    -- MONEY 를 100으로 나눠서 몫은 버리고 나머지를 취한다.    -> 100원의 갯수 확인 후 남은 금액
    -- 이 금액으로 MONEY를 갱신
    MONEY := MOD(MONEY,100);
    
    -- MONEY 를 50으로 나눠서 몫을 취하고 나머지는 버린다.     -> 50원의 갯수
    M50 := TRUNC(MONEY/50);
    
    -- MONEY 를 50으로 나눠서 몫은 버리고 나머지를 취한다.     -> 50원의 갯수 확인 후 남은 금액
    -- 이 금액으로 MONEY를 갱신
    MONEY := MOD(MONEY,50);
    
    -- MONEY 를 10으로 나눠서 몫을 취하고 나머지는 버린다.     -> 10원의 갯수
    M10 := TRUNC(MONEY/10);
    
    --○ 결과 출력
    -- 취합된 결과(화폐 단위별 갯수)를 형식에 맞게 최종 출력한다.
    --DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : ' || MONEY || '원');
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : ' || MONEY2 || '원');
    DBMS_OUTPUT.PUT_LINE('화폐단위 : ' || '오백원 ' || M500 || ', ' || '백원 ' || M100 || ', ' || '오십원 ' || M50 ||', ' || '십원 ' || M10);
    
END;
-- 오라클에서도 자바에서처럼 변수이름 앞에 숫자를 붙일 수 없지만 뒤에는 붙일 수 있다.
--==>>
/*
입력받은 금액 총액 : 780원
화폐단위 : 오백원 1, 백원 2, 오십원 1, 십원 3


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/



--○ 기본 반복문(조건없음) + 빠져나가는 구문 이용
-- LOOP ~ END LOOP;

-- 1. 조건과 상관없이 무조건 반복하는 구문

-- 2. 형식 및 구조
/*
LOOP
    -- 실행문
    
    EXIT WHEN 조건;       -- 조건이 참인 경우 반복문을 빠져나간다.
    
END LOOP
*/


-- 1 부터 10까지의 수 출력(LOOP문 활용)
DECLARE
    N NUMBER;
BEGIN
    N:= 1;
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        
        EXIT WHEN N>=10;
        
        N := N + 1;                 -- N++;  OR   N+=1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ WHILE 반복문
-- WHILE LOOP ~ END LOOP;

-- 1. 제어 조건이 TRUE 인 동안 일련의 문장을 반복하기 위해
--    WHILE LOOP 구문을 사용한다.
--    조건은 반복이 시작되는 시점에 체크하게 되어
--    LOOP 내의 문장이 한 번도 수행되지 않을 경우도 있다.
--    LOOP 를 시작할 때 조건이 FALSE 이면, 반복 문장을 탈출하게 된다.

-- 2. 형식 및 구조
/*
WHILE 조건 LOOP       -- 조건이 참인 경우 반복 수행
    -- 실행문;
END LOOP;
*/

-- 1 부터 10 까지 수 출력(WHILE LOOP 문 활용)

DECLARE
    N NUMBER := 1;
BEGIN
    WHILE N <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N+1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/



--○ FOR 반복문
-- FOR LOOP ~ END LOOP;
-- 자바에서의 향상된 FOR문(FOR EACH 구문)과 비슷하다.

-- 1. 『시작수』에서 1씩 증가하여
--    『끝냄수』가 될 때 까지 반복 수행한다.

-- 2. 형식 및 구조
/*
FOR 카운터(변수) IN [REVERSE] 시작수 .. 끝냄수 LOOP
    -- 실행문;
END LOOP;
*/

-- 1 부터 10 까지의 수 출력(FOR LOOP 문 활용)
DECLARE
    N NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 사용자로부터 임의의 단(구구단)을 입력받아
-- 해당 단수의 구구단을 출력하는 PL/SQL 구문을 작성한다.
/*
실행 예)
바인딩 변수 입력 대화창 -> 단을 입력하세요 : 2

2 * 1 = 2
2 * 2 = 4
    :
2 * 9 = 18
*/

-- 1. LOOP 문의 경우
ACCEPT INPUT PROMPT '단을 입력하세요 : ';

DECLARE
    DAN NUMBER :=&INPUT;        -- 입력한 단을 담을 변수
    N NUMBER;                   -- 1에서 9까지 증가할 변수
    RESULT NUMBER;              -- 결과값을 담을 변수
BEGIN
    N := 1;
    LOOP
        -- 실행문
        RESULT := DAN * N;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || RESULT);
        N := N+1;
        EXIT WHEN N>=10;
    END LOOP;
END;


-- 2. WHILE LOOP 문의 경우
ACCEPT INPUT PROMPT '단을 입력하세요 : ';

DECLARE
    DAN NUMBER :=&INPUT;        -- 입력한 단을 담을 변수
    N NUMBER;                   -- 1에서 9까지 증가할 변수
    RESULT NUMBER;              -- 결과값을 담을 변수
BEGIN
    N := 1;
    WHILE N<10 LOOP
        -- 실행문
        RESULT := DAN * N;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || RESULT);
        N := N+1;
    END LOOP;
END;


-- 3. FOR LOOP 문의 경우
ACCEPT INPUT PROMPT '단을 입력하세요 : ';

DECLARE
    DAN NUMBER :=&INPUT;        -- 입력한 단을 담을 변수
    N NUMBER;                   -- 1에서 9까지 증가할 변수
    RESULT NUMBER;              -- 결과값을 담을 변수
BEGIN
    FOR N IN 1 .. 9 LOOP
        -- 실행문
        RESULT := DAN * N;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || RESULT);
    END LOOP;
END;


--○ 구구단 전체(2단~9단)를 출력하는 PL/SQL 구문을 작성한다.
--   단, 이중 반복문(반복문의 중첩)구문을 활용한다.
/*
실행 예)

==[2단]==
2 * 1 = 2
2 * 2 = 4

==[3단]==
3 * 1 = 3
3 * 2 = 6
    :
==[9단]==
9 * 1 = 9
9 * 2 = 18
*/



-- 1. LOOP 문의 경우
DECLARE
    DAN NUMBER; -- 단을 담을 변수 선언(2, 3, ..9)
    N NUMBER; -- 증가할 변수 선언(1, 2, ..9)
    RESULT NUMBER; -- 결과를 담을 변수 선언
BEGIN
    DAN := 2;
    
    LOOP
        N := 1;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('==[' || DAN || '단]==');
        LOOP
            RESULT := DAN*N;
            DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || RESULT);
            N := N+1;
            EXIT WHEN N>=10;
        END LOOP;
        DAN := DAN+1;
        EXIT WHEN DAN>=10;
    END LOOP;
END;


-- 2. WHILE LOOP문의 경우
DECLARE
    DAN NUMBER; -- 단을 담을 변수 선언(2, 3, ..9)
    N NUMBER; -- 증가할 변수 선언(1, 2, ..9)
    RESULT NUMBER; -- 결과를 담을 변수 선언
BEGIN
    DAN := 2;
    WHILE DAN<10 LOOP
        N := 1;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('==[' || DAN || '단]==');
        WHILE N<10 LOOP
        RESULT := DAN*N;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || RESULT);
        N := N + 1;
        END LOOP;
        DAN := DAN + 1;
    END LOOP;
END;


-- 3. FOR LOOP문의 경우

DECLARE
    DAN NUMBER; -- 단을 담을 변수 선언(2, 3, ..9)
    N NUMBER; -- 증가할 변수 선언(1, 2, ..9)
    RESULT NUMBER; -- 결과를 담을 변수 선언
BEGIN

    FOR DAN IN 2 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('==[' || DAN || '단]==');
        
        FOR N IN 1 .. 9 LOOP
            RESULT := DAN*N;
            DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || RESULT);
        END LOOP;
        
    END LOOP;
END;
--==>>
/*

==[2단]==
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18

==[3단]==
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27

==[4단]==
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36

==[5단]==
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45

==[6단]==
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54

==[7단]==
7 * 1 = 7
7 * 2 = 14
7 * 3 = 21
7 * 4 = 28
7 * 5 = 35
7 * 6 = 42
7 * 7 = 49
7 * 8 = 56
7 * 9 = 63

==[8단]==
8 * 1 = 8
8 * 2 = 16
8 * 3 = 24
8 * 4 = 32
8 * 5 = 40
8 * 6 = 48
8 * 7 = 56
8 * 8 = 64
8 * 9 = 72

==[9단]==
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/











