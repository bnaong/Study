/*========================
 ■■■ 배열 ■■■
 - 배열의 선언과 초기화
 - 배열의 기본적 활용
==========================*/

// char 자료형의 배열의 만들어
// 그 배열의 각 방에 알파벳 대문자를 채우고
// 채워진 그 배열의 전체 요소를 출력하는 프로그램을 구현한다.
// 단, 채우는 구문과 출력하는 구문은 따로 분리하여 처리할 수 있도록 한다.

// 실행 예)
// A B C D ... X Y Z
// 계속하려면 아무 키나 누르세요...

public class Test081
{
	public static void main(String[] args)
	{	
		char[] arr = new char[26];						//-- 0부터 25번 방까지 생성됨
		for (int i=0, ch=65; i<arr.length; i++, ch++)	// i -> 0 ~ 25, ch -> 65 ~ 90
		{

			arr[i] = (char)ch;
		}

		// 배열 요소 전체 출력
		for (int i=0; i<arr.length; i++)
		{
			System.out.printf("%c ", arr[i]);
		}
		System.out.println();





		/*=======================================
		char[] arr = new char[26];
		for (int i=0; i<arr.length; i++)
		{
			arr[i] =(char)(i+65);
		}

		for (int i=0; i<arr.length; i++)
		{
			System.out.printf("%c ", arr[i]);
		}
		System.out.println();
		========================================*/

		
	}
}

// 실행 결과

/*

A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
계속하려면 아무 키나 누르십시오 . . .

*/