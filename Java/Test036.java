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

// 사용자로부터 임의의 정수 세 개를 입력받아
// 작은 수에서 큰 수 순으로 출력하는 프로그램을 구현한다.

// 실행 예)
// 첫 번째 정수 입력 : 753
// 두 번째 정수 입력 : 22
// 세 번째 정수 입력 : 124
//
// >> 정렬 결과 : 22 124 753
// 계속하려면 아무 키나 누르세요...



/*
		8	21	74		// 정수 크기를 비교해서 자리를 바꾼다
		------
		--		--
			------
		
		7	25	99
		------
		--		--
			------

		13	25	87
		------
		--		--
			------

① 첫 번째 정수 vs 두 번째 정수 크기 비교
    -> 첫 번째 정수가 두 번째 정수보다 클 경우... 자리 바꿈

② 첫 번째 정수 vs 세 번째 정수 크기 비교
    -> 첫 번째 정수가 세 번째 정수보다 클 경우... 자리 바꿈

③ 두 번째 정수 vs 세 번째 정수 크기 비교
    -> 두 번째 정수가 세 번째 정수보다 클 경우... 자리 바꿈
	
*/



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test036
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));


		int a, b, c;									//-- 사용자가 입력하는 임의의 정수를 담아둘 변수

		System.out.print("첫 번째 정수 입력 : ");	
		a = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("세 번째 정수 입력 : ");
		c = Integer.parseInt(br.readLine());
		

		if (a > b)										//-- 첫 번째 정수가 두 번째 정수보다 클 경우
		{
			// 자리 바꿈
			a=a^b;
			b=b^a;
			a=a^b;
		}

		if (a > c)										//-- 첫 번째 정수가 세 번째 정수보다 클 경우
		{
			// 자리 바꿈
			a=a^c;
			c=c^a;
			a=a^c;

		}

		if (b > c)										//-- 두 번째 정수가 세 번째 정수보다 클 경우
		{
			// 자리 바꿈
			b=b^c;
			c=c^b;
			b=b^c;
		
		}
		
		// 최종 결과 출력
		System.out.printf("\n>> 정렬 결과 : %d %d %d\n", a, b, c);







		/*=============================================================
		// 내가 푼 방법

		if (a <= b && b <= c)
		{
			System.out.printf("\n>> 정렬 결과 : %d %d %d\n", a, b, c);
		}
		else if (a <= c && c <= b)
		{
			System.out.printf("\n>> 정렬 결과 : %d %d %d\n", a, c, b);
		}
		else if (b <= a && a <= c)
		{
			System.out.printf("\n>> 정렬 결과 : %d %d %d\n", b, a, c);
		}
		else if (b <= c && c <= a)
		{
			System.out.printf("\n>> 정렬 결과 : %d %d %d\n", b, c, a);
		}
		else if (c <= a && a <= b)
		{
			System.out.printf("\n>> 정렬 결과 : %d %d %d\n", c, a, b);
		}
		else if (c <= b && b <= a)
		{
			System.out.printf("\n>> 정렬 결과 : %d %d %d\n", c, b, a);
		}
		===============================================================*/

		/*==============================================================
		// 다른 사람이 푼 방법

		int temp;
		
		if (a > b)
		{
			temp = a;
			a = b;
			b = temp;
		}
		if (a > c)
		{
			temp = a;
			a = c;
			c = temp;
		}
		if (b > c)
		{
			temp = b;
			b = c;
			c = temp;
		}

		System.out.printf("\n>> 정렬 결과 : %d %d %d\n", a, b, c);
		================================================================*/
		


	}
}

// 실행 결과

/*
첫 번째 정수 입력 : 10
두 번째 정수 입력 : 3
세 번째 정수 입력 : 5

>> 정렬 결과 : 3 5 10
계속하려면 아무 키나 누르십시오 . . .


첫 번째 정수 입력 : 50
두 번째 정수 입력 : 1
세 번째 정수 입력 : 50

>> 정렬 결과 : 1 50 50
계속하려면 아무 키나 누르십시오 . . .
*/