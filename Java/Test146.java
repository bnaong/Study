/*=============================================
 ■■■ 자바의 주요(중요) 클래스 ■■■
 - 자바에서 기본적으로 제공하는 주요 클래스들
 - Random 클래스
 ============================================*/

/*
○ java.util.Random 클래스는

	여러 형태의 난수를 발생시켜 제공하는 클래스이다.
	Math 클래스의 정적 메소드인 random() 메소드도 난수를 제공하는 메소드이지만
	0.0~1.0 사이의 실수 형태만 발생하게 되므로
	필요한 형태의 난수를 만들어내기 위해서는 추가적인 연산을 여러 행태로 수행해야 한다.
	그래서 자바는 여러 형태의 난수를 발생시켜주는 전용 클래스인
	Random 클래스를 별도로 제공하고 있다.


*/

// 로또 번호 생성(난수 발생 프로그램)

// 프로그램이 실행되면...
// 기본적으로 로또 5게임을 수행하는 프로그램을 구현한다.

// 실행 예)
//    3 12 15 24 31 41
//    1 12 18 36 41 42
//    4  9 12 13 22 30
//    5 10 13 14 22 40
//   22 31 36 40 43 44
// 계속하려면 아무 키나 누르세요...

import java.util.Random;
import java.util.Arrays;

class Lotto
{	
	// 배열 변수 선언 및 메모리 할당 -> 로또 번호를 담아둘 배열 방 6칸
	private int[] num;
	
	// 생성자
	Lotto()
	{
		num = new int[6];
	}

	public int[] getNum()
	{
		return num;
	}
	// 6개의 난수를 발생시키는 메소드 정의
	public void start()
	{
		Random rd = new Random();
		int n;
		int cnt = 0;
		
		// 라벨을 만들어서 사용(라벨명 :).빈번한 사용 바람직하지 않음	
		jump:

		while(cnt < 6)				// cnt -> 0 1 2 3 4 5
		{
			n = rd.nextInt(45)+ 1;	// 0 - 44 -> 『+1』 -> 1 ~ 45

			for (int i=0; i<cnt; i++)
			{
				// num[i] 요소와 n 을 비교
				if (num[i]==n)
					continue jump;				// 같은 라벨명이 적힌곳으로 포탈 이동
			}
			num[cnt++] = n;
			
		}

		// 정렬 메소드 호출
		sorting();


		/*=============================
		for (int i=0; i<6; i++)
		{
			num[i] = rd.nextInt(45)+1;

			for (int j=0; j<i; j++)
			{
				if (num[i]==num[j])
				{
					i--;
				}
			}
		}

		sorting();
		=============================*/
	}
	
	// 정렬 메소드 정의
	private void sorting()
	{
		Arrays.sort(num);
		/*====================================
		for (int i=0; i<num.length-1; i++)
		{
			for (int j=i+1; j<num.length; j++)
			{
				if (num[i]>num[j])
				{
					// 자리 바꾸기
					num[i]=num[i]^num[j];
					num[j]=num[j]^num[i];
					num[i]=num[i]^num[j];
				}
			}
		}
		====================================*/
		
		
	}
}

public class Test146
{
	public static void main(String[] args)
	{
		//Lotto 클래스 기반 인스턴스 생성
		Lotto lotto = new Lotto();


		for (int i=1; i<=5; i++)
		{
			// 로또 1게임 수행
			lotto.start();
			
			
			// 결과 출력
			for (int n : lotto.getNum())
			{
				System.out.printf("%3d",n);
			}
			System.out.println();
			
		}


		/*
		int arr[] = lotto.getNum();
		// 기본 5게임
		for (int i=1; i<=5; i++)
		{
			// 로또 1게임 수행
			lotto.start();
			
			
			// 결과 출력
			for (int n : arr)
			{
				System.out.printf("%3d",n);
			}
			System.out.println();
			
			

		}
		*/
	}
}

// 실행 결과

/*
 16 25 33 41 42 43
 13 26 30 31 36 42
  3 14 29 33 36 38
  6 22 25 27 32 36
 10 12 26 41 43 44
계속하려면 아무 키나 누르십시오 . . .
*/
