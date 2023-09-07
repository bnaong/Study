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

// 사용자로부터 임의의 정수를 입력받아
// 입력받은 정수가 홀수인지 짝수인지 0인지 확인하여
// 그 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
// 임의의 정수 입력 : 14
// 14 -> 짝수
// 계속하려면 아무 키나 누르세요...

// 임의의 정수 입력 : 0
// 0 -> 영
// 계속하려면 아무키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test032
{
	public static void main(String[] args) throws IOException
	{

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String result;

		System.out.print("임의의 정수 입력 : ");
		int i = Integer.parseInt(br.readLine());
		
		/*
		if (i % 2 == 0)
		{	
			if (i == 0)
			{
				result = "영";
			}
			else
			{
				result = "짝수";
			}
		}
		else
		{
			result = "홀수";
		}
		*/


		if (i % 2 == 1)
		{	
			result = "홀수";
		}
		else if (i == 0)
		{
			result = "영";						// 짝수에 대한 조건 검사보다 0에 대한 조건 검사를 먼저 해야한다.
		}
		else
		{
			result = "짝수";
		}


		System.out.println(i + " -> " + result);

	}
}

// 실행 결과

/*
임의의 정수 입력 : -14
-14 -> 짝수
계속하려면 아무 키나 누르십시오 . . .

임의의 정수 입력 : 5
5 -> 홀수
계속하려면 아무 키나 누르십시오 . . .

임의의 정수 입력 : 0
0 -> 영
계속하려면 아무 키나 누르십시오 . . .
*/