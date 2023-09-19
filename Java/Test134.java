/*============================================
 ■■■ 자바의 주요(중요) 클래스 ■■■
 - 자바에서 기본적으로 제공하는 주요 클래스들
 - Wrapper 클래스
 ============================================*/

public class Test134
{
	public static void main(String[] args)
	{
		byte b = 3;
		int i = 256;

		Byte b2 = new Byte(b);
		Integer i2 = new Integer(i);

		System.out.println(b2);
		System.out.println(i2);
		//--==>> 3
		//       256

		print(b2);
		print(i2);

		
	}
	
	// java.lang.Number 클래스(추상 클래스)는
	// 모든 숫자형 Wrapper 클래스의 부모클래스(슈퍼 클래스, 상위 클래스)이다
	// b2, i2에 해당하는 자료형이 Number에 넘어오면서 업 캐스팅이 일어나게 된다.
	static void print(Number n)
	{
		System.out.println(n);
		/*
		if (n instanceof Integer)						//-- 이것 저것 그것을 넘겨받게 생성할 때는 if문을 써주는게 바람직하다?
		{
			//매개변수로 넘겨받은 n이 업캐스팅이 일어나서 Number타입이 되었지만 Integer라면...
			System.out.println(n.intValue());
		}
		else if (n instanceof Double)
		{
			...
		}
		....
		*/
	}
}

Number n = new Integer();
