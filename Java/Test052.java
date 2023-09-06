/*======================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
- 반복문(while문) 실습 및 관찰
======================================*/

// ○ 과제
//	  사용자로부터 임의의 정수를 입력받아
//	  1부터 입력받은 그 정수까지의
//	  전체 합과, 짝수의 합과, 홀수의 합을
//	  각각 결과값으로 연산하여 출력하는 프로그램을 구현한다.

// 실행 예)
// 임의의 정수 입력 : 396
// >> 1 ~ 396 까지 정수의 합 : xxxxx
// >> 1 ~ 396 까지 짝수의 합 : xxxx
// >> 1 ~ 396 까지 홀수의 합 : xxxx
// 계속하려면 아무 키나 누르세요...



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test052
{
	public static void main(String[] args) throws IOException
	{
		
		// 주요 변수 선언 및 초기화
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int n;										//-- 사용자의 입력값을 담아낼 변수
		System.out.print("임의의 정수 입력 : ");
		n = Integer.parseInt(br.readLine());
		

		int even=0;									//-- 사용자의 입력값까지의 짝수의 합을 담아낼 변수
		int	odd=0;									//-- 사용자의 입력값까지의 홀수의 합을 담아낼 변수
		int	sum=0;									//-- 사용자의 입력값까지의 총합을 담아낼 변수
		int num=1;									//-- 반복하면서 증가할 변수



		// 연산 및 처리
		while (num <= n)							// 사용자가 입력한 값 n이 num보다 작거나 같은 값이 될 때까지 반복한다.
		{
			if (num % 2 == 0)						// 증가하는 변수 num을 2로 나눴을 때 나머지 0이면 짝수이므로
			{
				even += num;						// 짝수합 변수 even에 담는다.
			}
			else									// 증가하는 변수 num을 2로 나눴을 때 나머지 0이 아니면 홀수이므로
			{
				odd += num;							// 홀수합 변수 odd에 담는다.
			}
			sum += num;								// num을 sum에 더한다.
			num++;									// num을 1씩 증가시킨다.
		}
		


		// 결과 출력
		System.out.printf(">> 1 ~ %d 까지 정수의 합 : %d\n", n, sum);
		System.out.printf(">> 1 ~ %d 까지 짝수의 합 : %d\n", n, even);
		System.out.printf(">> 1 ~ %d 까지 홀수의 합 : %d\n", n, odd);


		
	}
}

// 실행 결과

/*
임의의 정수 입력 : 343
>> 1 ~ 343 까지 정수의 합 : 58996
>> 1 ~ 343 까지 짝수의 합 : 29412
>> 1 ~ 343 까지 홀수의 합 : 29584
계속하려면 아무 키나 누르십시오 . . .

임의의 정수 입력 : 25
>> 1 ~ 25 까지 정수의 합 : 325
>> 1 ~ 25 까지 짝수의 합 : 156
>> 1 ~ 25 까지 홀수의 합 : 169
계속하려면 아무 키나 누르십시오 . . .

임의의 정수 입력 : 4
>> 1 ~ 4 까지 정수의 합 : 10
>> 1 ~ 4 까지 짝수의 합 : 6
>> 1 ~ 4 까지 홀수의 합 : 4
계속하려면 아무 키나 누르십시오 . . .

*/