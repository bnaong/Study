/*===================================================================
 ■■■ 클래스와 인스턴스 ■■■
 - 메소드 중복정의(Method Overloading)이 가능한 형태와 불가능한 형태
====================================================================*/

public class Test104
{
	public static void main(String[] args)
	{
		print('A');
		print(20);

		print(3.14);

		//double result = print(3.14);
		
	}

	public static void print() {}
	//public static void print() {}							//--(X)
	public static void print(int i) {}
	//public static void print(int j) {}					//--(X) 매개변수이름이 다른 것은 상관없다
	public static void print(char c) {}						//-- 자동 형 변환 규칙 check~!!!
	public static void print(int i, int j) {}
	public static void print(double d) {}					//-- 자동 형 변환 규칙 check~!!!
	//public static void print(double e) {return 10.0}		//-- 정의 불가
	//public static double print(double e) {return 10.0;}	//-- 반환자료형이 다른 것은 메소드를 호출한 후의 일이므로 전혀 상관없다.



}