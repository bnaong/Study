/*========================
 ■■■ 배열 ■■■
 - 배열의 배열
==========================*/

// ○ 과제
//	  배열의 배열(다차원 배열)을 활용하여
//	  다음과 같은 데이터를 요소로 취하는 배열을 구성하고
//	  그 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
/*
  A
  B  C
  D  E  F
  G  H  I  J
  K  L  M  N  O

계속하려면 아무 키나 누르세요...
 */

public class Test093
{
	public static void main(String[] args)
	{
		// 주요 변수 선언 및 배열의 배열 선언 + 메모리 할당
		char arr[][] = new char[5][5];
		int n=65;													// 65 == A


		// 배열 구성
		for (int i=0; i<arr.length; i++)							//-- 0부터 arr배열의 길이까지 반복한다.
		{
			for (int j=0; i>=j; j++)								//-- 0부터 j가 i보다 크기 전까지 반복한다.
			{
				arr[i][j] = (char)n;								//-- 배열의 배열 arr[i][j]에 문자 A ~ Z를 담는다.
				n++;												//-- n을 1씩 증가시킨다.
			}
		}

		// 배열 전체 요소 출력
		for (int i=0; i<arr.length; i++)							//-- 0부터 arr배열의 길이까지 반복한다.
		{
			for (int j=0; j<arr[i].length; j++)						//-- 0부터 arr[i]배열의 길이까지 반복한다.
			{
				System.out.printf("%3c", arr[i][j]);				//-- 배열을 출력한다.
			}
			System.out.println();									//-- 개행
		}
	}
}

// 실행 결과

/*
  A
  B  C
  D  E  F
  G  H  I  J
  K  L  M  N  O
계속하려면 아무 키나 누르십시오 . . .
*/