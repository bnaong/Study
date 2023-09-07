/*=============================
■■■연산자(Operator)■■■
- 조건 연산자 == 삼항 연산자
=============================*/

// 사용자로부터 임의의 문자 하나를 입력받아
// 알파벳 대문자이면 소문자로...
// 알파벳 소문자이면 대문자로...
// 알파벳이 아닌 기타 문자라면 그 문자를 그대로...
// 출력하는 프로그램을 구현한다.

// 실행 예)
// 한 문자 입력 : A
// A -> a
// 계속하려면 아무 키나 누르세요...

// 한 문자 입력 : b
// b -> B
// 계속하려면 아무 키나 누르세요...

// 한 문자 입력 : 7
// 7 -> 7
// 계속하려면 아무 키나 누르세요...

import java.io.IOException;


public class Test029
{
	public static void main(String[] args) throws IOException
	{

		/*
																				알파벳 아닌 문자
																					  ↑
		알파벳대문자 ? 알파벳소문자로변환 : (알파벳소문자 ? 알파벳대문자로변환 : 있는그대로);
		------------   ------------------    ----------------------------------------------
		     1					2									 3
		*/


		/*===============================================================================================
		int i;
		//int b;
		char result;

		System.out.print("한 문자 입력 : ");
		i = System.in.read();


		result = (65 <= i && i <= 90) ? (char)(i + 32) : ((97 <= i && i <= 122) ? (char)(i - 32) : (char)(i));
		//result = (char)b;
		
		System.out.printf("%s -> %s\n", (char)i, result);
		=================================================================================================*/



		//char temp;

		//System.out.print("한 문자 입력 : ");
		//temp = (char)System.in.read();

		//System.out.println("입력받은 값 확인 : " + temp);

		// 대문자? 대문자아님?
		//temp == 'A' -> 65
		//temp == 'B' -> 66
		//temp == 'C' -> 67
		// :
		//temp == 'z' -> 90

		//String result = temp >=65 && temp<=90 ? "대문자" : "대문자아님";
		//System.out.println("결과 : " + result);

		//String result = temp >='A' && temp<='Z' ? "대문자" : "대문자아님";
		//System.out.println("결과 : " + result);

		//String result = temp >='a' && temp<='z' ? "소문자" : "소문자아님";
		//System.out.println("결과 : " + result);


		// 대문자 -> 소문자				// +32
		// 'A(65)' -> 'a(97)'
		// 'B(66)' -> 'b(98)'
		// 'C(67)' -> 'c(99)'
		//  :
		// 'Z(90)' -> 'z(122)'

		// 소문자 -> 대문자				// -32
		// 'a(97)' -> 'A(65)' 
		// 'b(98)' -> 'B(66)' 
		// 'c(99)' -> 'C(67)' 
		//  :
		// 'z(122)' -> 'Z(90)'	



		
		char ch, result;

		System.out.print("한 문자 입력 : ");
		ch = (char)System.in.read();

		// result = () ? () : ();
		// result = (입력값대문자) ? (소문자로 변환) : ((입력값소문자) ? (대문자로변환) : (그대로));
		result = (ch>='A'&&ch<='Z') ? ((char)(ch+32)) : ((ch>='a'&&ch<='z') ? ((char)(ch-32)) : (ch)); // ch+32이면 자동 형 변환 규칙에 의해 97이라는 값이 나오므로 (char)로 형 변환 필요

		// 'Q' (-> 81)
		// result = (ch>='A'&&ch<='z') ? ((char)(ch+32)) : ((ch>='a'&&ch<='z') ? ((char)(ch-32)) : (ch));
		// result = (81>=65&&81<=122) ? ((char)(ch+32)) : ((ch>='a'&&ch<='z') ? ((char)(ch-32)) : (ch));
		// result = (true) ? ((char)(81+32)) : ((ch>='a'&&ch<='z') ? ((char)(ch-32)) : (ch));
		// result = ((char)(81+32))
		// result = ((113))
		// result = 'q'
		
		//System.out.printf("%s -> %s\n", (char)ch, result);
		System.out.println(ch + " -> " + result);

		

	}
}

// 실행 결과

/*
한 문자 입력 : A
A -> a
계속하려면 아무 키나 누르십시오 . . .

한 문자 입력 : b
b -> B
계속하려면 아무 키나 누르십시오 . . .

한 문자 입력 : 9
9 -> 9
계속하려면 아무 키나 누르십시오 . . .
*/