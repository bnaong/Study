/*=====================================
 ■■■ 클래스와 인스턴스 ■■■
 - 직사각형 클래스 설계 실습
======================================*/

/*
직사각형의 넓이와 둘레를 계산하는 객체 → 클래스로 표현

클래스의 정체성 -> 직사각형 설계도
클래스의 속성 -> 가로, 세로 (, 넓이, 둘레, 부피, 무게, 재질, 색상, 질량, ....)
클래스의 기능 -> 넓이 계산, 둘레 계산, 가로 세로 입력, 결과 출력


객체를 구성		→ 속성(상태, 데이터)	+ 기능(동작, 행위)
	↓					 ↓					↓
클래스를 설계	→		변수			+ 메소드


class 직사각형
{
	// 속성(상태, 데이터)	-> 변수	(순서 의미 없음)
	가로, 세로

	// 기능(동작, 행위)		-> 메소드 (순서 의미 없음)
	가로 세로 입력()
	{
	}
	넓이 계산()
	{
	}
	둘레 계산()
	{
	}
	결과 출력()
	{
	}
}
*/

import java.util.Scanner;

class Rect							//-- 직사각형 클래스 설계
{
	// 속성(상태, 데이터)	-> 변수	(순서 의미 없음)
	int w, h;						//-- 가로, 세로

	// 기능(동작, 행위)		-> 메소드 (순서 의미 없음)
	void input()					//-- 가로, 세로 입력
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("가로 입력 : ");
		w = sc.nextInt();

		System.out.print("세로 입력 : ");
		h = sc.nextInt();
	}

	int calLength()					//-- 둘레 계산 -> (가로 + 세로) * 2
	{
		return (w + h) * 2;			//-- 메소드를 호출한 공간에 두고옴(반환)
		
		/*
		int result;
		result = (w + h) * 2;
		return result;
		*/
	}

	int calArea()					//-- 넓이 계산 -> 가로 * 세로
	{	

		// 주요 변수 선언
		int result;

		// 연산 및 처리		-> (대부분은) 선언한 변수들에 값 담아내기
		result = w * h;

		// 최종 결과 반환
		return result;
		//return w * h;
	}

	void print(int a, int b)				//-- 결과 출력 -> 가로 : xx 세로 : xx 넓이 : xx 둘레 : xx
	{
		
		
		// 가로 : 10				//-- 출력할 때, 가로와 세로는 있으니까 넓이와 둘레는 매개변수로 필요
		// 세로 : 20
		// 넓이 : 200
		// 둘레 : 60
		System.out.println("가로 : " + w);
		System.out.println("세로 : " + h);
		System.out.println("넓이 : " + a);
		System.out.println("둘레 : " + b);
	
	}
	
}

// ※ 하나의 자바 파일(.java)에 여러 개의 클래스(class)를 설계할 수 있다.
//	  하지만 public class 는 이 파일 내에서 하나만 올 수 있다.
//	  이 public class 의 이름으로 지정해야 한다.
//	  일반적으로는(실무적으로는) 하나의 파일에 하나의 클래스를 설계한다.
//	  또한, 여러 개의 클래스가 설계된 하나의 파일을 컴파일하게 되면
//	  내부에 설계된 클래스의 수 만큼 클래스 파일(.class)이 파생된다.



public class Test070
{
	public static void main(String[] args)
	{
		// Rect 클래스 기반의 인스턴스 생성
		Rect ob = new Rect();				// 자바는 메모리 공간의 주소값에 접근하는 것을 절대 허용X. 변수를 가지고 메모리공간에 접근하도록함

		// new Rect
		//		+
		//	   Rect();

		// 입력 메소드 호출
		ob.input();

		// 넓이 연산 메소드 호출
		int area = ob.calArea();

		// 둘레 연산 메소드 호출
		int length = ob.calLength();

		// 출력 메소드 호출
		ob.print(area, length);
	}	

}

// 실행 결과

/*

가로 입력 : 20
세로 입력 : 40
가로 : 20
세로 : 40
넓이 : 800
둘레 : 120
계속하려면 아무 키나 누르십시오 . . .

*/