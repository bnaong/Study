/*=============================================
 ■■■ 자바의 주요(중요) 클래스 ■■■
 - 자바에서 기본적으로 제공하는 주요 클래스들
 - StringBuffer 클래스
 ============================================*/

/*
○ StringBuffer 클래스
	문자열을 처리하는 클래스로 String 클래스와의 차이점은
	String 클래스는 내부 문자열 데이터의 수정이 불가능하지만
	StringBuffer 클래스는 문자열을 사용할 때 내부 문자열을 실행 단계에서 변경 할 수 있다.
	(Buffer라는 공간이 달려있는 String)

	즉, StringBuffer 객체는 가변적인 길이를 가지므로
	객체를 생성하는 시점에서 미리 그 크기나 값을 지정하거나
	실행 시점에 버퍼의 크기를 바꿀 수 있는 기능을 제공한다.

	또한, JDK1.5 이후부터는 문자열을 처리하는 StringBuilder라는 클래스도 제공한다. (얘도 Buffer를 가지고 있음)
	StringBuilder 클래스의 기능은 StringBuffer 클래스와 동일하지만
	가장 큰 차이점은 multi-thread unsafe(unsafety) 라는 점이다. (같이 동시성있게 작업했을 때 안전하지 않다)
	쓰레드 : 프로그램 안의 작은 기본 작업단위(또는 도구, 일꾼). 자기 할일만 신경씀(그래야 작업이 빠르니까)
	멀티쓰레드(다중쓰레드) : 프로그램 내에서 멀티태스킹을 구현한 것. 쓰레드가 여러개
	StringBuffer는 멀티쓰레드에서 안전하지만 기능(성능)이 많기 때문에 느리다(무겁다)

	즉, Syncronization이 없기 때문에 StringBuffer 보다 빠르며, 동시성((동기화) 문제가 없다면
	StringBuilder 를 사용하는것이 성능을 향상시킬 수 있다.
*/

public class Test138
{
	public static void main(String[] args)
	{
		String str1 = new String("seoul");
		String str2 = new String("seoul");

		System.out.println(str1==str2);
		System.out.println(str1.equals(str2));
		//--==>> false
		//		 true

		StringBuffer sb1 = new StringBuffer("korea");
		StringBuffer sb2 = new StringBuffer("korea");

		System.out.println(sb1 == sb2);
		System.out.println(sb1.equals(sb2));
		// StringBuffer 클래스에서는 equals를 오버라이딩 하지 않았다.
		//--==>> false
		//		 false

		System.out.println("--------------------------------------------------------------");

		System.out.println(sb1);				// StringBuffer객체를 출력한 것
		//--==>> korea

		System.out.println(sb1.toString());		// String을 출력한 것
		//--==>> korea

		System.out.println(sb1.toString().equals(sb2.toString()));
		//--==>> true

		System.out.println("--------------------------------------------------------------");

		StringBuffer sb3 = new StringBuffer();
		//-- StringBuffer 기본 생성자 호출(인스턴스 생성 과정)
		//	 기본적으로 생성되는 버퍼 크기는 『16』

		// capacity()		=> 얼마만큼 담아낼 수 있는지
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--==>> 버퍼 크기 : 16

		System.out.println(sb3);
		//--==>> 無
		
		/*
		String name = "박가영";			//-- 원래 값이 들어가 있던 메모리는 소실(불필요하게 잡혀있는 메모리↑)
		name += "박나영";
		name += "박범구";
		name += "엄재용";

		System.out.println(name);
		//--==>> 박가영박나영박범구엄재용
		*/

		sb3.append("seoul");			// 시각적으로는 위와 같지만, 메모리를 훨씬 덜 쓰게 된다.
		sb3.append("korea");
		sb3.append("우리나라");
		sb3.append("대한민국");

		System.out.println(sb3);
		//--==>> seoulkorea우리나라대한민국
		System.out.println(sb3.toString());
		//--==>> seoulkorea우리나라대한민국



		// 버퍼 크기 다시 확인
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--==>> 버퍼 크기 : 34									// 객체에 담기는게 많아지면 자동으로 늘려줌을 확인가능


		/////////////////////////////////////////////////////////////////////////////////
		
		String temp1 = "java and oracle";
		System.out.println(temp1.toUpperCase());
		//--==>> JAVA AND ORACLE
		//-- 소문자를 대문자로 변환된 값을 반환

		String temp2 = "JAVA AND ORACLE";
		System.out.println(temp2.toLowerCase());
		//--==>> java and oracle
		//-- 대문자를 소문자로 변환된 값을 반환

		//System.out.println(sb3.toUpperCase());
		//System.out.println(sb3.toLowerCase());
		//--==>> 에러 발생(컴파일 에러)
		
		String temp3 = sb3.toString();
		System.out.println(temp3.toUpperCase());
		//--==>> SEOULKOREA우리나라대한민국

		System.out.println(sb3.toString().toUpperCase());
		//--==>> SEOULKOREA우리나라대한민국

		// ○ 대상 문자열(sb3 -> "seoulkorea우리나라대한민국") 중
		//	  "seoul" 문자열 앞에 "한국" 이라는 문자열 추가
		//	  즉, 『한국seoulkorea우리나라대한민국』으로 구성
		
		//sb3.insert(index, 해당 index에 삽입할 문자열)							//원본 sb3 변경됨
		sb3.insert(0, "한국");
		System.out.println("seoul 앞에 『한국』 추가 : " + sb3);
		//--==>> seoul 앞에 『한국』 추가 : 한국seoulkorea우리나라대한민국
		System.out.println("seoul 앞에 『한국』 추가 : " + sb3.toString());
		//--==>> seoul 앞에 『한국』 추가 : 한국seoulkorea우리나라대한민국


		// ○ 대상 문자열(sb3 -> 한국seoulkorea우리나라대한민국) 중
		//	  "korea" 문자열 뒤에 "사랑" 이라는 문자열 추가
		//	  단, 대상 문자열의 인덱스를 눈으로 직접 확인하지 않고...
		//	  즉, 『한국seoulkorea사랑우리나라대한민국』
		
		// 테스트 ①
		//System.out.println(sb3.insert(sb3.indexOf("korea") + 5, "사랑"));
		//System.out.println(sb3.insert(sb3.indexOf("korea") + "korea".length(), "사랑"));
		//--==>>한국seoulkorea사랑우리나라대한미국

		// 나의 풀이방법
		sb3.insert(sb3.indexOf("우"), "사랑");
		System.out.println(sb3);
		//--==>>한국seoulkorea사랑우리나라대한민국
		

		// ○ 대상 문자열(sb3) 에서
		//	  『"우리나라"』 문자열 삭제

		// 테스트 ①
		//sb3.delete(14, 18);
		//14 : sb3.indexOf("우리나라"), 18 : sb3.indexOf("우리나라") + "우리나라".length()
		//System.out.println(sb3);
		//--==>> 한국seoulkorea사랑대한민국
		
		// 나의 풀이방법
		//System.out.println(sb3.delete(sb3.indexOf("우리나라"),sb3.indexOf("대")));	//원본 sb3 변경됨
		//--==>> 한국seoulkorea사랑대한민국

		sb3.delete(sb3.indexOf("우리나라"), sb3.indexOf("우리나라") + "우리나라".length());
		System.out.println(sb3);
		//--==>> 한국seoulkorea사랑대한민국


		// ○ 대상 문자열(sb3)에서
		//	  korea 이후 모든 문자열 삭제(korea 포함)
		//	  한국seoulkorea사랑대한민국 -> 한국seoul
		
		// 테스트 ①
		//sb3.delete(7,18);
		//System.out.println(sb3.toString());
		//--==>> 한국seoul

		sb3.delete(sb3.indexOf("korea"),sb3.length());
		System.out.println(sb3);
		//--==>> 한국seoul

		/////////////////////////////////////////////////////////////////////////////////

		// 버퍼 크기 다시 확인
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--==>> 버퍼 크기 : 34
		

		// 문자열(sb3)의 길이 확인
		System.out.println("문자열의 길이 : " + sb3.length());
		//--==>> 문자열의 길이 : 7
		

		// 버퍼 크기 조절
		// -> 현재 문자열을 담아둘 수 있는 버퍼의 크기로...
		// trimToSize()
		sb3.trimToSize();

		// 버퍼 크기 조절 이후 버퍼 크기 다시 확인
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--==>> 버퍼 크기 : 7

		
	}
}