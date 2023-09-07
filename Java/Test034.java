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

// ○ 과제
//	  사용자로부터 임의의 연도를 입력받아
//	  입력받은 연도가 윤년인지... 평년인지... 판별하여
//	  그 결과를 출력하는 프로그램을 구현한다.
//	  단, 입력은 BufferedReader 를 활용하고
//	  if 조건문을 활용하여 연산할 수 있도록 한다.

// 실행 예)
// 임의의 연도 입력 : 2024
// 2024년 → 윤년
// 계속하려면 아무 키나 누르세요...

// 임의의 연도 입력 : 2023
// 2023년 → 평년
// 계속하려면 아무 키나 누르세요...

// ※ 2월이 28일까지 있는 해 -> 평년
//	  2월이 29일까지 있는 해 -> 윤년

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test034
{
	public static void main(String[] args) throws IOException
	{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));



		int year;									//-- 사용자가 입력한 연도를 담아낼 변수
		

		System.out.print("임의의 연도 입력 : "); 
		year = Integer.parseInt(br.readLine());



		// 연도가 4의 배수				연도가 100의 배수 아님					연도가 400의 배수
		// year % 4 == 0				year % 100 != 0							year % 100 == 0


		if ((year % 4 == 0) && (year % 100 != 0))		//-- 만약 연도가 4의 배수이고, 100의 배수가 아니다 -> 윤년
		{
			System.out.printf("%d년 → 윤년\n", year);
		}
		else if (year % 400 == 0)						//-- 그 외 연도가 400의 배수이다 -> 윤년
		{
			System.out.printf("%d년 → 윤년\n", year);
		}
		else											//-- 그 외 연도 -> 평년
		{
			System.out.printf("%d년 → 평년\n", year);
		}
		
	}
}

// 실행 결과

/*
임의의 연도 입력 : 2000
2000년 → 윤년
계속하려면 아무 키나 누르십시오 . . .

임의의 연도 입력 : 2012
2012년 → 윤년
계속하려면 아무 키나 누르십시오 . . .

임의의 연도 입력 : 2023
2023년 → 평년
계속하려면 아무 키나 누르십시오 . . .
*/