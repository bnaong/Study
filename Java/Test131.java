/*=============================================
 ■■■ 자바의 주요(중요) 클래스 ■■■
 - 자바에서 기본적으로 제공하는 주요 클래스들
 - Wrapper 클래스
 ============================================*/


public class Test131
{
	public static void main(String[] args)
	{
		boolean bi = true;
		Boolean wrapBi = new Boolean(bi);
		Boolean wBi = bi;					// 오토 박싱

		int n = 300;
		Integer wrapN = new Integer(n);
		int n2 = wrapN;						// 오토 언박싱
		
		float f = 300.3f;
		Float wrapF = new Float(f);
		
		System.out.println(wrapBi.toString());			//-- 클래스명@해시코드 로 나오지 않는 이유는 각자 자기방식으로 오버라이딩 했기 때문
		System.out.println(wrapN.toString());
		System.out.println(wrapF.toString());
		//--==>> true
		//		 300
		//		 300.3

		System.out.println(wrapBi);
		System.out.println(wrapN);
		System.out.println(wrapF);
		//--==>> true
		//       300
		//	  	 300.3

		//Integer 클래스
		String sn = "12";
		int ni = Integer.parseInt(sn);
		System.out.println(ni);
		//--==>> 12

		ni = Integer.parseInt("0101", 2);

		System.out.println(ni);
		//--==>> 5

		ni = Integer.parseInt("12", 8);
		System.out.println(ni);
		//--==>> 10

		ni = Integer.parseInt("A", 16);
		System.out.println(ni);
		//--==>> 10

		sn = Integer.toBinaryString(20);		// 메소드 이름중에 to~() : 변환해주는역할 , is~() : ~인지아닌지확인 역할
		System.out.println(sn);
		//--==>> 10100							// 2진수로 변환하는 기능

		sn = Integer.toOctalString(31);
		System.out.println(sn);
		//--==>> 37								// 8진수로 변환하는 기능

		sn = Integer.toHexString(31);
		System.out.println(sn);
		//--==>> 1f								// 16진수로 변환하는 기능

		Integer num = new Integer(50);
		System.out.println(num.toString());		// 숫자를 문자열타입으로 변환하는 기능
		//--==>> 50

		int n3 = 345;
		Integer n4 = Integer.valueOf(n3);		// 우항 Integer 타입, 좌항 Integer 타입 n4
		System.out.println(n4);
		//--==>> 345

	}
}