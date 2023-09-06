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

// 사용자로부터 임의의 정수 5개를 입력받아
// 짝수별, 홀수별 합계를 출력하는 프로그램을 구현한다.
// 단, Scanner 를 활용하여 데이터를 입력받을 수 있도록 한다.

// 실행 예)
// 임의의 정수 5개 입력(공백 구분) : 11 12 13 14 15

// >> 짝수의 합은 26 이고, 홀수의 합은 39 입니다.
// 계속하려면 아무 키나 누르세요...


import java.io.IOException;
import java.util.Scanner;

public class Test037
{
	public static void main(String[] args)
	{


		// 주요 변수 선언
		Scanner sc = new Scanner(System.in);
		

		// 누적 합을 담아낼 변수
		int evenSum=0;						//-- 짝수의 합을 담아낼 변수 선언(누적합)  ※ 만약 누적곱이라면 =1로 초기화 시킴
		int oddSum=0;							//-- 홀수의 합을 담아낼 변수 선언(누적합)
		int num1, num2, num3, num4, num5;
		

		// 연산 및 처리
		System.out.print("임의의 정수 5개 입력(공백 구분) : ");	// 10 20 30 40 50
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		num3 = sc.nextInt();
		num4 = sc.nextInt();
		num5 = sc.nextInt();

		if (num1 % 2 == 0)	//-- num1 이 짝수일 때...
		{
			// evenSum 을 num1 만큼 증가
			evenSum += num1;
		}
		else		//-- num1 이 짝수가 아닐 때... (홀수일 때)
		{
			// oddSum 을 num1 만큼 증가
			oddSum += num1;
		}

		if (num2 % 2 == 0)	//-- num2 가 짝수일 때...
		{
			// evenSum 을 num2 만큼 증가
			evenSum += num2;
		}
		else		//-- num2 가 짝수가 아닐 때... (홀수일 때)
		{
			// oddSum 을 num2 만큼 증가
			oddSum += num2;
		}
		
		if (num3 % 2 == 0)
		{

			evenSum += num3;
		}
		else
		{

			oddSum += num3;
		}

		if (num4 % 2 == 0)
		{

			evenSum += num4;
		}
		else
		{

			oddSum += num4;
		}

		if (num5 % 2 == 0)
		{
			evenSum += num5;
		}
		else
		{
			oddSum += num5;
		}

		// 결과 출력
		System.out.printf("\n>> 짝수의 합은 %d 이고, 홀수의 합은 %d 입니다.\n", evenSum, oddSum);


		
		
		/* 내가 푼 방법 =============================================================
		int a, b, c, d, e;
		int tot1=0;
		int tot2=0;

		System.out.print("임의의 정수 5개 입력(공백 구분) : ");
		a = sc.nextInt();
		b = sc.nextInt();
		c = sc.nextInt();
		d = sc.nextInt();
		e = sc.nextInt();

		if (a % 2 == 0)
		{
			tot1 += a;
		}
		else
		{
			tot2 += a;
		}

		if (b % 2 == 0)
		{
			tot1 += b;
		}
		else
		{
			tot2 += b;
		}

		if (c % 2 == 0)
		{
			tot1 += c;
		}
		else
		{
			tot2 += c;
		}
		if (d % 2 == 0)
		{
			tot1 += d;
		}
		else
		{
			tot2 += d;
		}
		if (e % 2 == 0)
		{
			tot1 += e;
		}
		else
		{
			tot2 += e;
		}

		System.out.printf("\n>> 짝수의 합은 %d 이고, 홀수의 합은 %d 입니다.\n", tot1, tot2);

		=====================================================================================*/
	}
}

// 실행 결과

/*
임의의 정수 5개 입력(공백 구분) : 1 2 3 4 5

>> 짝수의 합은 6 이고, 홀수의 합은 9 입니다.
계속하려면 아무 키나 누르십시오 . . .


임의의 정수 5개 입력(공백 구분) : 2 4 6 8 10

>> 짝수의 합은 30 이고, 홀수의 합은 0 입니다.
계속하려면 아무 키나 누르십시오 . . .
*/