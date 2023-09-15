/*=============================================
 ■■■ 자바의 주요(중요) 클래스 ■■■
 - 자바에서 기본적으로 제공하는 주요 클래스들
 - BigDecimal 클래스
 ============================================*/

import java.math.BigDecimal;

public class Test133
{
	public static void main(String[] args)
	{
		BigDecimal a = new BigDecimal("123456789.123456789");

		//movePointLeft()
		BigDecimal b = a.movePointLeft(3);						// 소수점을 매개변수만큼 왼쪽으로 이동시키는 기능
		System.out.println("처리 결과 : " + b);
		//--==>> 처리 결과 : 123456.789123456789
		
		// 나눗셈 연산
		BigDecimal c = a.divide(b);
		System.out.println("처리 결과 : " + c);
		//--==>> 처리 결과 : 처리 결과 : 1E+3

		BigDecimal d = a.divide(b, BigDecimal.ROUND_DOWN);		// 반올림을 하지 않는다. -> 절삭
		System.out.println("처리 결과 : " + d);
		//--==>> 처리 결과 : 1000.000000000

		// BigInteger 객체로 변환
		System.out.println("처리 결과 : " + a.toBigInteger());
		//--==>> 처리 결과 : 123456789

		
	}
}

// 실행 결과

/*
처리 결과 : 123456.789123456789
처리 결과 : 1E+3
처리 결과 : 1000.000000000
처리 결과 : 123456789
계속하려면 아무 키나 누르십시오 . . .
*/