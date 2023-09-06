/*==========================================
  ■■■ 자바 기본 프로그래밍 ■■■ 
  - 변수와 자료형
  - 자바의 기본 입출력 : System.out.printf()
===========================================*/

public class Test016
{
	public static void main(String[] args)
	{
		System.out.print("AAA");
		System.out.print("BBB");
		System.out.print("CCC\n");				//-- 『\n』 개행
		//--==>> AAABBBCCC

		System.out.println();						//-- 개행
		//System.out.print();
		//--==>> 에러 발생(컴파일 에러)

		System.out.printf("1234567890");
		System.out.printf("1234567890\n");		//-- 『\n』 개행

		System.out.printf("1234567890%n");		//-- 『%n』 개행

		//System.out.printf();
		//--==>> 에러 발생(컴파일 에러)

		System.out.printf("%d + %d = %d%n", 10, 20, 30);
		//--==>> 10 + 20 = 30

		System.out.printf("%d\n", 123);
		System.out.printf("%10d\n", 123);	//-- 123을 10칸 확보하여 우측정렬(숫자)됨
		System.out.printf("%8d\n", 1234);
		System.out.printf("%010d\n", 123);	//-- 123을 10칸 확보 후 남은 칸에 0이 채워짐
		//--==>>
		/*
		123
			   123
			1234
		0000000123
		*/
		

		System.out.printf("%+d\n", 365);
		//--==>> +365
		System.out.printf("+%d\n", 365);
		//--==>> +365
		System.out.printf("%d\n", +365);
		//--==>> 365
		

		//System.out.printf("%-d\n", 365);
		//--==>> 에러 발생(런타임 에러)
		System.out.printf("-%d\n", 365);
		//--==>> -365
		System.out.printf("%d\n", -365);
		//--==>> -365

		
		//System.out.printf("%d\n", 'A');
		//--==>> 에러 발생(런타임 에러)

		System.out.printf("%c\n", 'A');
		//--==>> A

		//System.out.printf("%c\n", "ABCD");
		//--==>> 에러 발생(런타임 에러)

		System.out.printf("%s\n", "ABCD");
		//--==>> ABCD

		System.out.printf("%h\n", 365);			// 16진수
		//--==>> 16d

		System.out.printf("%o\n", 24);			// 8진수
		//--==>> 30

		System.out.printf("%b\n", true);		// boolean형
		System.out.printf("%b\n", false);
		//--==>> true
		//		 false

		System.out.printf("%f\n", 123.23);		// 실수형 float 소숫점 이하 6자리, double 12자리
		//--==>> 123.230000
		System.out.printf("%.2f\n", 123.23);	// 소숫점 이하 두 번째 자리까지 표현해라
		//--==>> 123.23

		System.out.printf("%.2f\n", 123.231);
		//--==>> 123.23
		//-- 소수점 이하 두 번째 자리까지 표현
		//   (소수점 이하 세 번째 자리 절삭)

		System.out.printf("%.2f\n", 123.235);
		//--==>> 123.24
		//-- 소수점 이하 두 번째 자리까지 표현
		//   (소수점 이하 세 번째 자리 올림)
		
		System.out.printf("%8.2f\n", 123.236);	// 소수점 이하 자리까지 포함하여 자리 확보
		//--==>>  123.24
		System.out.printf("%2.2f\n", 123.236);	// 자리 확보가 오버되면 무시됨
		//--==>> 123.24


	}
}

// 실행 결과
/*
AAABBBCCC

12345678901234567890
1234567890
10 + 20 = 30
123
       123
    1234
0000000123
+365
+365
365
-365
-365
A
ABCD
16d
30
true
false
123.230000
123.23
123.23
123.24
  123.24
123.24
계속하려면 아무 키나 누르십시오 . . .
*/