/*=======================================
 ■■■ 클래스 고급 ■■■
 - 상속 관계에 있는 클래스들 간의 캐스팅
   (업 캐스팅, 다운 캐스팅)
 ======================================*/

// super class, 부모 클래스, 상위 클래스
class SuperTest116
{
	public int a=10, b=20;

	public void write()
	{
		System.out.println("슈퍼클래스 write() 메소드");
	}

	public int hap()
	{
		return a + b;
	}
}

// sub class, 자식 클래스, 하위 클래스
class SubTest116 extends SuperTest116
{
	/*
	public int a=10, b=20;

	public void write()
	{
		System.out.println("슈퍼클래스 write() 메소드");
	}

	public int hap()
	{
		return a + b;
	}
	*/



	public int b=100, c=200;
	
	@Override
	public int hap()
	{
		return a + b + c;
	}

	public void print()
	{
		System.out.println("서브클래스 print() 메소드...");
	}

}

// main() 메소드를 포함하는 외부의 다른 클래스 -> 제 3자의 입장
public class Test116
{
	public static void main(String[] args)
	{
		// 하위 클래스 기반 인스턴스 생성
		SubTest116 ob1 = new SubTest116();

		System.out.println("ob1.b : " + ob1.b);
		//--==>> ob1.b : 100
		
		// ○ 업 캐스팅
		SuperTest116 ob2=ob1;
		//-- 『SuperTest116 ob2 = (SuperTest116)ob1;』과 동일한 코드
		/*
		학생 혜인이 = new 학생();

		포유류 사람 = 혜인이;		// 『포유류 사람 = (사람)혜인이;』와 동일한 코드

		※ 학생도 포유류~!!!

		class 포유류        class 학생 extends 포유류
		{					{
		}					}

		*/
		System.out.println("ob2.b : " + ob2.b);
		//System.out.println("ob2.b : " + ((SuperTest116)ob1).b);
		//--==>> ob2.b : 20
		//-- 메모리 그림판에서 변수는 객체별로 따로 할당되기 때문에
		//   변수 b는 ob2 의 변수이다.

		System.out.println("합 : " + ob2.hap());
		//--==>> 합 : 310
		//-- hap() 메소드는 오버라이딩(Overriding) 되어 있고
		//   ob2 는 ob1 을 업캐스팅한 상태의 객체이므로
		//   『SuperTest116』 의 hap() 메소드를 호출하는 것이 아니라
		//   『SubTest116』 에서 재정의한 hap() 메소드를 호출하게 된다.
		//    즉, 메소드는
		//    업 캐스팅이 되더라도
		//    재정의(덮어쓰기)한 이상... 원래의 기능으로 되돌릴 수 없다.

		ob2.write();
		//--==>> 슈퍼클래스 write() 메소드

		//ob2.print();
		//--==>> 에러 발생(컴파일 에러)
	
		// ○ 다운 캐스팅
		((SubTest116)ob2).print();
		//--==>> 서브클래스 print() 메소드...
		
		// ※ 추가 관찰 -----------------------------------------------------------------------
		//    다운 캐스팅 가능 여부
		
		// 상위 클래스 기반 인스턴스 생성
		SuperTest116 ob3 = new SuperTest116();
		SubTest116 ob4;

		//System.out.println("ob3.c : " + ob3.c);
		//--==>> 에러 발생(컴파일 에러)
		//-- 상위 객체는 하위 객체의 멤버에 접근하는 것이 불가능하다.
		//   (상위 객체 입장에서는 어떤 하위 객체가 존재하는지도 알 수 없음)

		//ob4 = ob3;
		//--==>> 에러 발생(컴파일 에러)
		//-- 상위 객체는 하위 객체에 담을 수(참조할 수) 없다.

		//ob4 = (SubTest116)ob3;
		//--==>> 에러 발생(런타임 에러)
		//-- 작성된 구문의 문법적인 구조만 봤을 때 이 구문은 다운 캐스팅이 이루어지는 상황이다.
		//   하지만, 정상적인 캐스팅이 이루어지지 않는다.
		//   현재 SubTest116 객체에 대한 메모리 할당은 이루어지지 않은 상태이기 때문이다.
		//   그러므로 다운 캐스팅은 불가능하다.  --> 부모클래스 인스턴스 생성으로 메모리에 퍼올려질 때 자식은 절대 함께 메모리에 함께 퍼올려질 일이 없다!!


		
	}
}
