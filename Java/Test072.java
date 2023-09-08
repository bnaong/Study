/*=====================================
 ■■■ 클래스와 인스턴스 ■■■
======================================*/

// 사용자로부터 임의의 정수를 입력받아
// 1 부터 입력받은 수 까지의 합을 연산하여
// 결과값을 출력하는 프로그램을 구현한다.

// 단, 지금까지처럼 main() 메소드에 모든 기능을 적용하는 것이 아니라
// 클래스와 인스턴스의 개념을 활용하여 처리할 수 있도록 한다.
// (Hap 클래스 설계)
// 또한, 데이터 입력 처리 과정에서 BufferedReader 의 readLine() 을 사용하며,
// 입력 데이터가 1보다 작거나 1000보다 큰 경우
// 다시 입력받을 수 있는 처리를 포함하여 프로그램을 구현할 수 있도록 한다.

// 실행 예)
// 임의의 정수 입력(1~1000) : 1200
// 임의의 정수 입력(1~1000) : -50
// 임의의 정수 입력(1~1000) : 100
// >> 1 ~ 100 까지의 합 : 5050
// 계속하려면 아무 키나 누르세요...


/*
class 합
{
	// 속성(상태, 데이터)	-> 변수	(순서 의미 없음)
	임의의 정수

	// 기능(동작, 행위)		-> 메소드 (순서 의미 없음)
	임의의 정수 입력()
	{
	}
	입력받은 값을 판단()
	{
	}
	결과 출력()
	{
	}
}
*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class Hap
{
	// 주요 변수 선언(사용자의 입력값을 담아낼 변수)
	int n;
	int sum;											//-- 전역변수 자동 0으로 초기화
	
	// 입력 메소드 정의
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		do
		{
			System.out.print("임의의 정수 입력(1~1000) : ");
			n = Integer.parseInt(br.readLine());
		}
		while (n<1 || n>1000);
	}
	
	// 연산 처리 메소드 정의
	int calSum()
	{
		
		for (int num=0;num<=n ;num++ )
		{
			sum += num;
		}
		return sum;
	}
	
	// 결과 출력 메소드 정의
	void print()
	{
		System.out.printf(">> 1 ~ %d 까지의 합 : %d\n",n ,sum);
	}

}



public class Test072
{
	public static void main(String[] args) throws IOException
	{
		// Hap 인스턴스 생성
		Hap ob = new Hap();
		
		// 생성된 인스턴스를 통해 입력 메소드 호출
		// ---------------
		//  참조변수 활용

		ob.input();				//-- new Hap().input();
		
		// 생성된 인스턴스를 통해 연산 메소드 호출
		int sum = ob.calSum();

		// 생성된 인스턴스를 통해 출력 메소드 호출
		ob.print();



		
	}
}

// 실행 결과

/*

임의의 정수 입력(1~1000) : 2424
임의의 정수 입력(1~1000) : 12312532
임의의 정수 입력(1~1000) : -12302130
임의의 정수 입력(1~1000) : 100
>> 1 ~ 100 까지의 합 : 5050
계속하려면 아무 키나 누르십시오 . . .

*/