/*========================
 ■■■ 배열 ■■■
 - 배열의 배열
==========================*/

// 배열의 배열(다차원 배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
/*
  1   2   3   4  10
  5   6   7   8  26
  9  10  11  12  42
 13  14  15  16  58
 28  32  36  40 136

00 01 02 03 04
10 11 12 13 14
20 21 22 23 24
30 31 32 33 34
40 41 42 43 44


*/



public class Test091
{
	public static void main(String[] args)
	{
		int arr[][] = new int[5][5];
		int n=0;

		//테스트 변수
		//int sum=0;
		

		// 각 for문 수식2의 『-1』 -> 반복문의 처리가 필요하지 않은 영역
		for (int i=0;i<arr.length-1 ;i++)			// 웅~~~~ i -> 0 1 2 3
		{
			for (int j=0;j<arr[i].length-1 ;j++)	// 쑝쑝쑝~	-> 0123 0123 0123
			{
				n++;
				arr[i][j] = n;
				//sum+=n;
				//System.out.printf("%4d",sum);
				
				arr[i][arr[i].length-1] += arr[i][j];
				/*
				arr[0][4] += arr[0][0]
						  += arr[0][1]
						  += arr[0][2]
					      += arr[0][3]
						  :
				*/
				
				arr[arr.length-1][j] += arr[i][j];
				/*
				arr[4][0] += arr[0][0]
					      += arr[1][0]
					      += arr[2][0]
					      += arr[3][0]
						  :
				*/
				
				arr[arr.length-1][arr[i].length-1] += arr[i][j];
				/*
				arr[4][4] += arr[0][0]
					      += arr[0][1]
					      += arr[0][2]
					      += arr[0][3]
						  :
				*/
				
			}
		}


		// 배열의 배열 전체 출력 구문
		for (int i=0;i<arr.length ;i++)
		{
			for (int j=0;j<arr[i].length ;j++)
			{
				System.out.printf("%4d",arr[i][j]);
			}
			System.out.println();
		}


		/*
		int arr[][] = new int[5][5];
		int n=1;


		for (int i=0; i<4; i++)
		{
			for (int j=0; j<4; j++)
			{
				arr[i][j] = n;
				arr[i][4] += n;
				arr[4][j] += n;
				arr[4][4] += n;
				n++;
			}

		}
		
		for (int i=0;i<arr.length ;i++)
		{
			for (int j=0;j<arr[i].length ;j++)
			{
				System.out.printf("%4d",arr[i][j]);
			}
			System.out.println();
		}
		*/
	}
}

// 실행 결과

/*

   1   2   3   4  10
   5   6   7   8  26
   9  10  11  12  42
  13  14  15  16  58
  28  32  36  40 136
계속하려면 아무 키나 누르십시오 . . .


*/