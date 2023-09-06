/*=====================================
 ■■■ 클래스와 인스턴스 ■■■
======================================*/

// 사용자로부터 임의의 두 정수와 연산자를 입력받아
// 해당 연산을 수행하는 프로그램을 구현한다.
// 단, 클래스와 인스턴스의 개념을 활용하여 작성할 수 있도록 한다.
// (Calculate 클래스 설계)

// 실행 예)
// 임의의 두 정수 입력(공백 구분) : 100 51
// 임의의 연산자(+ - * /)		  : +

// >> 100 + 51 = 151
// 계속하려면 아무 키나 누르세요...

import java.util.Scanner;
import java.io.IOException;


class Calculate
{
	// 주요 변수 선언
	int su1, su2;			//-- 사용자로부터 입력받은 두 정수를 담아낼 변수
	char op;				//-- 사용자로부터 입력받은 연산자를 담아낼 변수

	// 입력 메소드
	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("임의의 두 정수 입력(공백 구분) : ");
		su1 = sc.nextInt();
		su2 = sc.nextInt();

		System.out.print("임의의 연산자(+ - * /)		  : ");
		op = (char)System.in.read();
	}
	
	// 연산 메소드 -> 나눗셈 연산도 정수 기반으로 처리
	int cal()
	{
		int result = -1;							// 초기화 or default 추가 해주기

		switch (op)
		{
		case '+': result = su1 + su2; break;
		case '-': result = su1 - su2; break;
		case '*': result = su1 * su2; break;
		case '/': result = su1 / su2; break;
		}
		return result;
	
	}

	// 출력 메소드
	void print(int s)
	{
		System.out.printf("\n>> %d %c %d = %d\n", su1, op, su2, s);
	}
	

}







public class Test073
{
	public static void main(String[] args) throws IOException
	{
		Calculate ob = new Calculate();

		ob.input();
		int r = ob.cal();
		ob.print(r);

		
	}
}

// 실행 결과
/*

임의의 두 정수 입력(공백 구분) : 40 20
임의의 연산자(+ - * /)            : +

>> 40 + 20 = 60
계속하려면 아무 키나 누르십시오 . . .

임의의 두 정수 입력(공백 구분) : 49 3
임의의 연산자(+ - * /)            : -

>> 49 - 3 = 46
계속하려면 아무 키나 누르십시오 . . .
*/