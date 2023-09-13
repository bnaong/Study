/*=========================
 ■■■ 클래스 고급 ■■■
 - 상속(Inheritance)
 =========================*/

 // 다음과 같은 프로그램을 구현한다.
 // 단, 상속의 개념을 적용하여 작성할 수 있도록 한다.

 // 실행 예)
 // 임의의 두 정수 입력(공백 구분) : 20 10
 // 연산자 입력(+ - * /) : -
 // >> 20 - 10 = 10
 // 계속하려면 아무 키나 누르세요...

//import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class Aclass
{
	protected int x, y;
	protected char op;

	Aclass()
	{
		
	}

	void write(double result)
	{
		System.out.printf("\n>> %d %c %d = %.2f\n", x, op, y, result);
	}
}

// Aclass 를 상속받는 클래스로 설계
class Bclass extends Aclass
{
	Bclass()
	{
		//super();
	}

	boolean input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("임의의 두 정수 입력(공백 구분) : ");						// "20 10"
		String temp = br.readLine();

		// ※ 문자열.split("구분자");
		//    문자열.split("\\s");		//-- 구분자 --> 공백
		//
		//    ex) "10 20 30 40 50" split("\\s");
		//		  -> 반환 -> {"10", "20", "30", "40", "50"}
		//
		//    ex) "010-1234-4567".split("-");
		//	      -> 반환 -> {"010", "1234", "4567"}

		String[] strArr = temp.split("\\s");						// "20 10" -> String[] strArr = {"20, 10"}

		if (strArr.length != 2)
			return false;
		//-- false 를 반환하며 input() 메소드 종료
		//   이 조건을 만족하여 if 문을 수행하게 될 경우...
		//   아래 수행해야 할 코드가 남아있더라도
		//   결과값(->false)을 반환하며 메소드는 종료된다.

		x = Integer.parseInt(strArr[0]);
		y = Integer.parseInt(strArr[1]);
		// this.x = Integer.parseInt(strArr[0]);	// 내가 가진 x에 담겠다
		// super.x = Integer.parseInt(strArr[0]);	// 부모가 가진 x에 담겠다

		System.out.print("연산자 입력(+ - * /) : ");
		op = (char)System.in.read();

		if (op!='+' && op!='-' && op!='*' && op!='/')
		{
			return false;
		}
		
		return true;

	}// end Input()
	

	double calc()
	{
		double result = 0;

		switch (op)
		{
			case '+': result = x + y; break;
			case '-': result = x - y; break;
			case '*': result = x * y; break;
			case '/': result = (double)x / y;
		
		}

		return result;

	}// end calc()




	/*========================================================================
	double result;
	
	Bclass()
	{}

	public void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("임의의 두 정수 입력(공백 구분) : ");
		x = sc.nextInt();
		y = sc.nextInt();
		
		System.out.print("연산자 입력(+ - * /) : ");
		op = (char)System.in.read();
	}

	public double cal()
	{
		switch (op)
		{
			case '+' : result = x + y; break;
			case '-' : result = x - y; break;
			case '*' : result = x * y; break;
			case '/' : result = x / (double)y; break;
			default : break;
		}
		return result;
	}
	=======================================================================*/

}

// main() 메소드를 포함하고 있는 외부의 다른 클래스
public class Test113
{
	public static void main(String[] args) throws IOException
	{	
		Bclass ob = new Bclass();					//-- 자식클래스(Bclass)를 메모리에 퍼올릴 때 부모(Aclass)도 메모리에 퍼올릴 의무가 있다.

		//ob.input();
		
		/*
		boolean resp = ob.input()
		if (resp!=true)
		{
			System.out.println("Error...");
			return;									//-- 프로그램 종료
		}
		*/
		
		/*
		boolean resp = ob.input()
		if (!resp)
		{
			System.out.println("Error...");
			return;									//-- 프로그램 종료
		}
		*/

		
		if (!ob.input())
		{
			System.out.println("Error...");
			return;									//-- 프로그램 종료
		}
		
		double result = ob.calc();

		ob.write(result);




		/*========================
		Bclass bc = new Bclass();
		bc.input();
		double a = bc.cal();
		bc.write(a);
		==========================*/
		
	}
}

// 실행 결과

/*
임의의 두 정수 입력(공백 구분) : 10 20
연산자 입력(+ - * /) : +

>> 10 + 20 = 30.00
계속하려면 아무 키나 누르십시오 . . .

임의의 두 정수 입력(공백 구분) : 30
Error...
계속하려면 아무 키나 누르십시오 . . .

임의의 두 정수 입력(공백 구분) : 45 22
연산자 입력(+ - * /) : /

>> 45 / 22 = 2.05
계속하려면 아무 키나 누르십시오 . . .

*/