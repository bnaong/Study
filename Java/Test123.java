/*=============================
 ■■■ 클래스 고급 ■■■
 - 중첩 클래스
 =============================*/

// outer
class Test2
{
	static int a = 10;
	int b = 20;
	
	void write()									//-- 첫 번째 write() 메소드
	{
		System.out.println("write()...①");
		final int c= 20;
		int d = 40;									//-- 접근을 할 수 있냐 아니냐의 문제가 아니라 한참 뒤에 LocalTest 인스턴스 생성이 되었을 때 d의 값이 변할 수 있어서
													//   불확실하기 때문에 에러남
		

		// inner
		// 메소드 안에 존재하는 또다른 클래스(로컬 클래스, local class, 지역 클래스)
		class LocalTest
		{
			void write()							//-- 두 번째 write() 메소드
			{
				System.out.println("write()...②");
				System.out.println("a : " + a);
				System.out.println("b : " + b);
				System.out.println("c : " + c);
				//System.out.println("d : " + d);
				//--==>> 에러 발생(컴파일 에러)

			}
		}
		// ※ 변수 c 와 변수 d 는 둘 다 지역변수이지만...
		//	  (첫 번째 write() 메소드 안에서 선언된 변수이므로...)
		//	  c는 final 변수이기 때문에 두 번째 write() 메소드에서 언제 접근하더라도
		//    고정된 값 20이 담겨있음을 보장받을 수 있다.
		//	  반면에 d는 그 값이 수시로 변화될 수 있는 상황이므로
		//    LocalTest 클래스의 인스턴스 생성 시점이
		//    언제가 될 지 알 수 없기 때문에
		//    이로 인해 인스턴스 생성 시점에 d 에 어떤 값이 담겨있는지를
		//    보장받을 수 없게 된다.
		//    변수 d 에 접근하는 것은 피할 수 있도록 문법적으로 처리하는 것이다.

		d++;
		
		// LocalTest 클래스 기반 인스턴스 생성(-> inner)
		LocalTest lt = new LocalTest();
		lt.write();									//-- 두 번째 write() 메소드 호출
	}
}

public class Test123
{
	public static void main(String[] args)
	{
		// Test2 클래스 기반 인스턴스 생성(-> outer)
		Test2 ob = new Test2();
		ob.write();										//-- 첫 번째 write() 메소드
	}
}