/*========================
 ■■■ 배열 ■■■
 - 배열의 선언과 초기화
 - 배열의 기본적 활용
==========================*/

// ○ 과제
//	  사용자로부터 임의의 학생 수를 입력받고
//	  그만큼의 점수(정수 형태)를 입력받아
//	  전체 학생 점수의 합, 평균, 편차를 구해서
//	  결과를 출력하는 프로그램을 구현한다.

// 실행 예)
// 학생 수 입력 : 5
// 1번 학생의 점수 입력 : 90
// 2번 학생의 점수 입력 : 82
// 3번 학생의 점수 입력 : 64
// 4번 학생의 점수 입력 : 36
// 5번 학생의 점수 입력 : 98

// >> 합   : 370
// >> 평균 : 74.0
// >> 편차
// 90 : -16.0
// 82 : -8.0
// 64 : 10.0
// 36 : 38.0
// 98 : -24.0
// 계속하려면 아무 키나 누르세요...

// * 편차 : 평균과의 차이

import java.util.Scanner;

public class Test084
{
	public static void main(String[] args)
	{	
		// 주요 변수 선언
		int num;
		int hap=0;
		double avg;
		

		// 연산 및 처리
		Scanner sc = new Scanner(System.in);
		System.out.print("학생 수 입력 : ");
		num = sc.nextInt();										//-- 사용자가 입력한 학생 수를 num 변수에 담는다.

		int students[] = new int[num];							//-- 입력한 데이터를 담을 students라는 배열을 선언 + 메모리를 할당한다.
		
		for (int i=0; i<students.length; i++)					//-- 0부터 입력한 students 배열 길이전까지 반복한다.
		{
			System.out.print((i+1) + "번 학생의 점수 입력 : ");	
			students[i] = sc.nextInt();							//-- 학생의 점수를 입력받아서 배열에 담는다.
			hap += students[i];									//-- hap 변수에 students 배열에 담긴 점수들을 더하는 것을 반복한다.
		}
		avg = hap / students.length;							//-- avg 변수에 점수의 평균값을 입력하는 연산을 수행한다.
		


		// 출력 결과
		System.out.println(">> 합   : " + hap);					//-- 입력한 점수들의 합을 출력한다.
		System.out.println(">> 평균 : " + avg);					//-- 점수들의 평균값을 출력한다.
		System.out.println(">> 편차");							
		for (int i=0; i<students.length; i++)					//-- 점수들의 평균과 학생들의 점수의 편차를 출력하는 것을 반복한다.
		{
			System.out.printf("%d : %.1f\n",students[i], avg - (double)students[i]);
		}



		
	}
}

// 실행 결과

/*

학생 수 입력 : 5
1번 학생의 점수 입력 : 70
2번 학생의 점수 입력 : 34
3번 학생의 점수 입력 : 92
4번 학생의 점수 입력 : 63
5번 학생의 점수 입력 : 55
>> 합   : 314
>> 평균 : 62.0
>> 편차
70 : -8.0
34 : 28.0
92 : -30.0
63 : -1.0
55 : 7.0
계속하려면 아무 키나 누르십시오 . . .

*/