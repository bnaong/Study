/*=========================
 ■■■ 클래스 고급 ■■■
 - 상속(Inheritance)
 =========================*/

 // ※ 메소드 오버라이딩(Method Overriding)의 특징

 //		- 메소드 이름, 리턴 타입, 파라미터 수나 타입이 완전히 일치해야 한다.
 //	    - 반드시 상속 관계가 있어야한다.
 //     - 재정의된 하위 클래스의 메소드 접근제어지시자는
 //		  상위 클래스의 메소드 접근제어지시자보다 범위가 크거나 같아야 한다.
 //		  예를 들어, 상위 클래스 메소드의 접근제어지시자가 『protected』 인 경우
 //		  하위 클래스가 이 메소드를 오버라이딩 하는 경우
 //		  접근제어지시자는 『public』 또는 『protected』 이어야 한다.
 //		- <『static』 - 먼저 메모리에 퍼올려져서 덮어쓰기 안됨, 『final』- 변수에 상수화(값을 고정할거야) => 튜닝하면 안돼
 //		  『private』 메소드 - 접근불가, 물려받지 못해서 튜닝불가 >는 오버라이딩(Overriding) 할 수 없다.
 //		- Exception의 추가가 불가능하다.
 //		  즉, 상위 메소드가 가지고 있는 기존의 예외 사항에
 //       새로운 Exception을 추가하는 것은 불가능하다는 것이다.

// 부모 클래스(상위 클래스, super class)
class SuperTest114
{
	private int a = 5;
	protected int b = 10;
	public int c = 20;

	public void write()
	{
		System.out.println("Super write() 메소드 : " + a + " : " + b + " : " + c);
	}

}

// 자식 클래스(하위 클래스, sub class)
class SubTest114 extends SuperTest114
{	/*
	protected int b = 10;
	public int c = 20;

	public void write()
	{
		System.out.println("Super write() 메소드 : " + a + " : " + b + " : " + c);
		//--==>> 에러 발생(컴파일 에러)
		//-- 슈퍼클래스에서 선언된 변수 a 에는 접근 할 수 없다.
		//   -> private 변수이기 때문에...
	}
	*/
	
	protected int b = 100;

	public void print()
	{
		System.out.println("Sub print() 메소드 : " + b + " : " + c);
		//--==>> Sub print() 메소드 : 100 : 20

		System.out.println("Sub print() 메소드 : " + b);
		System.out.println("Sub print() 메소드 : " + this.b);	// SubTest114.b
		System.out.println("Sub print() 메소드 : " + super.b);  // SuperTest114.b
		//--==>> Sub print() 메소드 : 100
		//		 Sub print() 메소드 : 100
		//		 Sub print() 메소드 : 10
		//-- 변수 b 는 접근 방법에 따라 다른 b 로 접근 및 출력이 이루어진다.
		//	 슈퍼클래스에서 선언된 b, 서브클래스에서 선언된 b

		System.out.println("Sub print() 메소드 : " + c);
		System.out.println("Sub print() 메소드 : " + this.c);
		System.out.println("Sub print() 메소드 : " + super.c);
		//--==>> Sub print() 메소드 : 20
		//		 Sub print() 메소드 : 20
		//		 Sub print() 메소드 : 20
		//-- 변수 c는 접근하는데 아무런 제약과 제한이 없다.
		//   슈퍼클래스에서 선언된 c
		

	}// end print()

	@Override
	public void write()
	{
		//System.out.println("Super write() 메소드 : " + a + " : " + b + " : " + c);
		//-- 슈퍼클래스에서 선언된 변수 a 에는 접근 할 수 없다.
		//   -> private 변수이기 때문에...
		
		System.out.println("Sub write() 메소드 : " + b + " : " + c);
	}

}

// main() 메소드를 포함하는 외부의 다른 클래스
public class Test114
{
	public static void main(String[] args)
	{
		// 하위 클래스(SubTest114) 인스턴스 생성
		SubTest114 ob = new SubTest114();

		ob.print();

		ob.write();
		//--==>> Super write() 메소드 : 5 : 10 : 20
		//--==>> Sub write() 메소드 : 100 : 20

		System.out.println("----------------------------- 구분선");

		System.out.println(ob.b);
		//--==>> 100
		
		System.out.println(((SuperTest114)ob).b);	//-- 제 3자의 입장에서 자식 객체의 부모를 부를 때 사용하는 방법. super는 자식입장에서 부모를 부를 때 사용
		//--==>> 10
		// ※ 슈퍼부름~!!!

		ob.write();
		//--==>> Sub write() 메소드 : 100 : 20

		((SuperTest114)ob).write();					
		//--==>> Sub write() 메소드 : 100 : 20		//-- 메소드는 한번 튜닝하면 다시 되돌릴 수 없다. 변수에는 슈퍼부름이 가능하지만 메소드에는 적용 불가



		
	}
}

// 실행 결과

/*

*/