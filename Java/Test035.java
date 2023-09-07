/*======================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
- if 문
- if ~ else 문 실습
======================================*/

// 1. 프로그램을 작성할 때 주어진 조건에 따라
//    분기 방향을 정하기 위해 사용하는 제어문에는
//	  if문, if~else문, 조건연산자, 복합 if문(if 중첩), switch문이 있다.

// 2. if문은 if 다음의 조건이 참(true)일 경우
//    특정 문장을 수행하고자 할 때 사용되는 구문이다.

// 사용자로부터 임의의 두 정수와 연산자를 입력받아
// 해당 연산자의 연산 처리 결과를 출력하는 프로그램을 구현한다.
// 단, if 조건문을 활용하여 처리할 수 있도록 하며,
// 연산 결과는 편의상 정수 기반으로 처리될 수 있도록 한다.

// 실행 예)
// 첫 번째 정수 입력 : 10
// 두 번째 정수 입력 : 3
// 연산자 입력[+ - * /] : +

// >> 10 + 3 = 13
// 계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test035
{
	public static void main(String[] args) throws IOException
	{
		/*
		// 방법 ①
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b;									// 첫 번째, 두 번째 정수
		char op;									// 연산자

		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());
		
		// Integer.parseInt()
		// "1234" -> Integer.parseInt() -> 1234
		// "abcd" -> Integer.parseInt() -> (X)


		System.out.print("연산자 입력[+ - * /] : ");
		//op = (char)Integer.parseInt(br.readLine());
		op = (char)System.in.read();
		

		// 테스트(확인)
		//System.out.println("입력한 연산자 : " + op);

		// '+' -> 43 / '-' -> 45 / '*' -> 42 / '/' -> 47
		if (op == 43)			//-- 사용자가 입력한 연산자가 '+' 이라면
		{
			// a 와 b 의 덧셈 연산 수행하여 결과 출력
			System.out.printf("\n>> %d + %d = %d\n", a, b, (a+b));
		}
		else if (op == 45)		//-- 사용자가 입력한 연산자가 '-' 이라면
		{
			// a 와 b 의 뺄셈 연산 수행하여 결과 출력
			System.out.printf("\n>> %d - %d = %d\n", a, b, (a-b));
		}
		else if (op == 42)		//-- 사용자가 입력한 연산자가 '*' 이라면
		{
			// a 와 b 의 곱셈 연산 수행하여 결과 출력
			System.out.printf("\n>> %d * %d = %d\n", a, b, (a*b));
		}
		else if (op == 47)		//-- 사용자가 입력한 연산자가 '/' 이라면
		{
			// a 와 b 의 나눗셈 연산 수행하여 결과 출력
			System.out.printf("\n>> %d / %d = %d\n", a, b, (a/b));
		}
		else					//-- 사용자가 입력한 연산자가 기본 사칙 연산자가 아니라면...
		{
			System.out.println("\n>> 입력 과정에 오류가 존재합니다.");
		}
		*/


		// 방법 ②
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b;									// 첫 번째, 두 번째 정수
		char op;									// 연산자

		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());
		

		System.out.print("연산자 입력[+ - * /] : ");
		op = (char)System.in.read();
		
		
		// 내부적으로는 숫자형태로 비교하겠지만, 자바에서 문자 형태는 같은지 아닌지가 비교 가능하다.

		if (op == '+')	
			System.out.printf("\n>> %d + %d = %d\n", a, b, (a+b));
		else if (op == '-')
			System.out.printf("\n>> %d - %d = %d\n", a, b, (a-b));
		else if (op == '*')
			System.out.printf("\n>> %d * %d = %d\n", a, b, (a*b));
		else if (op == '/')	
			System.out.printf("\n>> %d / %d = %d\n", a, b, (a/b));
		else
			System.out.println("\n>> 입력 과정에 오류가 존재합니다.");
		*/


		// 방법 ③		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b, result=0;									// 첫 번째, 두 번째 정수
		char op;									// 연산자

		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("연산자 입력[+ - * /] : ");
		op = (char)System.in.read();



		if(op == '+')
			result=a+b;
		else if(op == '-')
			result=a-b;
		else if(op == '*')
			result=a*b;
		else if(op == '/')
			result=a/b;

		System.out.printf("\n>> %d %c %d = %d\n", a, op, b, result);
	}
}

// 실행 결과

/*
첫 번째 정수 입력 : 10
두 번째 정수 입력 : 3
연산자 입력[+ - * /] : +

>> 10 + 3 = 13
계속하려면 아무 키나 누르십시오 . . .

첫 번째 정수 입력 : 10
두 번째 정수 입력 : 3
연산자 입력[+ - * /] : *

>> 10 * 3 = 30
계속하려면 아무 키나 누르십시오 . . .
*/