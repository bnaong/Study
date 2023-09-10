/*==================================
 ■■■ 클래스와 인스턴스 ■■■
====================================*/

// ※ Test071.java 파일과 한 세트~!!!

// 원의 넓이와 둘레 구하기
// 원의 넓이와 둘레를 구할 수 있는 클래스를 설계한다.
// (클래스명 : CircleTest)
// 입력은 BufferedReader 의 readLine()

// ※ 원의 넓이 = 반지름 * 반지름 * 3.141592
//	  원의 둘레 = 반지름 * 2 * 3.141592

// 실행 예)
// 반지름 입력 : xxx

// >> 반지름이 xxx인 원의
// >> 넓이 : xxx.xx
// >> 둘레 : xxx.xx
// 계속하려면 아무 키나 누르세요...

/*
class 원
{
	// 속성(상태, 데이터)	-> 변수	(순서 의미 없음)
	반지름

	// 기능(동작, 행위)		-> 메소드 (순서 의미 없음)
	반지름 입력()
	{
	}
	넓이 계산()
	{
	}
	둘레 계산()
	{
	}
	결과 출력()
	{
	}
}
*/

// 컴파일은 정상적으로 되어야 함. main 메소드가 없기 때문에 실행은 X
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class CircleTest
{

	// 주요 속성(상태, 데이터)		-> 멤버 변수
	int r;											//-- 반지름
	final double PI = 3.141592;						//-- 원주율(변수의 상수화)	

	// 주요 기능(동작, 행위)		-> 멤버 메소드
	
	// 반지름 입력 기능
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("반지름 입력 : ");
		r = Integer.parseInt(br.readLine());
	}
	
	// 둘레 계산 기능
	double calLength()
	{
		// 원의 둘레 = 반지름 * 2 * 3.141592
		return r * 2 * PI;
	}
	

	// 넓이 계산 기능
	double calArea()
	{
		// 원의 넓이 = 반지름 * 반지름 * 3.141592
		//return r * r * PI;

		double result;
		result = r * r * PI;
		return result;
	}
	
	// 출력 기능
	void print(double a, double b)
	{
		System.out.printf("\n>> 반지름이 %d 인 원의\n",r);
		System.out.println(">> 넓이 : " + a);
		System.out.println(">> 둘레 : " + b);
	}


	
}
