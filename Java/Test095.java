/*========================================
 ■■■ 배열 ■■■
 - 배열과 난수처리(※ Random 클래스 활용)
=========================================*/

// 사용자로부터 임의의 정수를 입력받아
// 그 수 만큼 난수(1~100)를 발생시켜 배열에 담고
// 배열에 담겨있는 데이터들 중
// 가장 큰 값과 가장 작은 값을 선택하여
// 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
// 발생시킬 난수의 갯수 입력 : 10
// (50 7 24 81 72 45 61 38 1 99 -> 무작위로 발생한 정수들...)
// (int[] arr = {50 7 24 81 72 45 61 38 1 99} -> 배열에 담아내기(배열구성))
// 가장 큰 값 : 99, 가장 작은 값 : 1
// 계속하려면 아무 키나 누르세요...

import java.util.Scanner;
import java.util.Random;

public class Test095
{
	public static void main(String[] args)
	{
		// Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		// 주요 변수 선언
		int size;							//-- 사용자의 입력값을 담아낼 변수

		// 안내 메시지 출력
		System.out.print("발생시킬 난수의 갯수 입력 : ");
		size = sc.nextInt();

		// 입력받은 size 만큼의 배열방 만들기(배열 길이)
		// (배열 선언 및 메모리 할당)
		int[] arr = new int[size];

		// 무작위 정수(난수)를 발생시키기 위해서는
		// 난수 발생 전용 객체가 필요하다.
		// -> 『java.util.Random』
		Random rd = new Random();
		//-- Random 인스턴스 생성

		// ※ Random 클래스의 『nextInt()』 메소드
		//	  0 ~ 매개변수로 넘겨받은 정수 n-1 까지의 수 중
		//	  무작위 정수(난수) 1개를 발생시킨다.
		
		//	  ex) rd.nextInt(10);			//-- 0 ~ 9 중 난수 1개 발생

		// 테스트(확인)
		//System.out.println("발생한 난수 : " + rd.nextInt(10));
		//-- 0 ~ 9 까지의 범위 내에서 무작위 정수 한 개 발생~!!!

		// 배열 구성
		//for (int i=0; i<arr.length; i++)
		for (int i=0; i<size; i++)
		{
			//rd.nextInt(101);
			//-- 0 ~ 100 중 1개
			//rd.nextInt(100);
			//-- 0 ~ 99 중 1개
			arr[i] = rd.nextInt(100) + 1;
			//		 -------------------
			//		   1 ~ 100 중 1개
			


		}

		// 테스트 -> 구성된 배열의 전체 요소 출력
		for (int i=0; i<arr.length; i++)
		{
			System.out.printf("%4d", arr[i]);
		}
		System.out.println();
		//--==>>
		/*
		발생시킬 난수의 갯수 입력 : 8
		   2  85  55  80  27   6  45  92
		계속하려면 아무 키나 누르십시오 . . .
		*/
		
		// ----------------------------------------- 배열 구성 완료

		// 가장 작은 값, 가장 큰 값 출력~!!!
		// big=small=arr[0];
		int big = arr[0];			//-- 최대값
		int small = arr[0];			//-- 최소값

		for (int i=1; i<arr.length; i++)
		{
			if (big<=arr[i])
			{
				big = arr[i];
			}
			if (small>=arr[i])
			{
				small = arr[i];
			}
		}
		System.out.println("가장 작은 값 : " + small);
		System.out.println("가장 큰 값 : " + big);

		

	}
}

// 실행 결과

/*

발생시킬 난수의 갯수 입력 : 9
  16  75  29   5   3  47   2  33  95
가장 작은 값 : 2
가장 큰 값 : 95
계속하려면 아무 키나 누르십시오 . . .

*/