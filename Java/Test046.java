/*======================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
- 반복문 실습 및 관찰
======================================*/

// 실행 예)
// 1부터 100까지 정수의 합 : xxx
// 1부터 100까지 짝수의 합 : xxx
// 1부터 100까지 홀수의 합 : xxx
// 계속하려면 아무 키나 누르세요...

public class Test046
{
	public static void main(String[] args)
	{
		
		// 주요 변수 선언 및 초기화
		int n=1, sum, odd, even;
		sum=odd=even=0;					//-- even=0을 대입 -> 0이 담겨있는 even의 값을 odd에 대입 -> 0이 담겨있는 odd의 값을 sum에 대입

		// 연산 및 처리
		while (n<=100)
		{
			sum += n;
			if (n % 2 == 0)
			{
				even += n;
			}
			else if (n % 2 != 0)
			{
				odd += n;
			}
			else
			{
				System.out.println("판별할 수 없는 데이터");
				return;
			}
			n++;
		}

		// 결과 출력
		System.out.println("1부터 100까지 정수의 합 : " + sum);
		System.out.println("1부터 100까지 짝수의 합 : " + even);
		System.out.println("1부터 100까지 홀수의 합 : " + odd);


		/*==========================================================
		int n=1;
		int evenSum=0;
		int oddSum=0;
		int sum=0;

		while (n<=100)
		{
			if (n % 2 == 0)
			{
				evenSum += n;
			}
			else if (n % 2 != 0)
			{
				oddSum += n;
			}
			else
			{
				System.out.println("판별불가");
				return;
			}
			sum += n;
			n++;
		}

		System.out.println("1부터 100까지 정수의 합 : " + sum);
		System.out.println("1부터 100까지 짝수의 합 : " + evenSum);
		System.out.println("1부터 100까지 홀수의 합 : " + oddSum);
		===============================================================*/

	}
}

// 실행 결과

/*
1부터 100까지 정수의 합 : 5050
1부터 100까지 짝수의 합 : 2550
1부터 100까지 홀수의 합 : 2500
계속하려면 아무 키나 누르십시오 . . .
*/