/*=============================================
 ■■■ 자바의 주요(중요) 클래스 ■■■
 - 자바에서 기본적으로 제공하는 주요 클래스들
 - String 클래스
 ============================================*/

public class Test137
{
	public static void main(String[] args)
	{
		String s = "seoul korea";
		System.out.println("s : " + s);
		//--==>> s : seoul korea

		// ○ 문자열 추출
		System.out.println(s.substring(6,9));
		//--==>> kor

		// ※ String.subString(s,e)
		//	  String 문자열을 대상으로 s 번째에서 e-1번째까지 추출(단, 인덱스는 0부터 시작)

		System.out.println(s.substring(7));
		//--==>> orea

		// ※ String.subString(s)
		//	  String 문자열을 대상으로 s 번째에서 끝까지 추출(즉, 문자열이 가진 길이만큼)

		// ○ 문자열의 데이터(값) 비교
		System.out.println(s.equals("seoul korea"));
		System.out.println(s.equals("seoul Korea"));
		//--==>> true
		//		 false (대소문자 엄격히 구분)

		System.out.println(s.equalsIgnoreCase("SEOUL KOREA"));
		//--==>> true (대소문자 구분하지 않고 값이 같으면 true)

		// ○ 찾고자 하는 대상 문자열(s)에 kor 문자열이 존재할까?
		//	  존재한다면.. 그 위치는 어떻게 될까?
		// "seoul korea"
		// (0123456789)
		
		System.out.println(s.indexOf("kor"));
		//--==>> 6
		System.out.println(s.indexOf("ea"));
		//--==>> 9
		System.out.println(s.indexOf("e"));
		//--==>> 1
		//-- 찾고자 하는 문자열의 여부 뿐 만 아니라 어떤 인덱스에 위치하는지 반환
		//	 (먼저 찾은 문자열의 인덱스를 반환하고 종료.)
		
		System.out.println(s.indexOf("tt"));
		//--==>> -1
		//-- 찾고자 하는 문자열이 대상 문자열에 존재하지 않을 경우 음수를 반환

		// ○ 대상 문자열(s)이 rea로 끝나는지의 여부 확인
		//	  (true/false)
		System.out.println(s.endsWith("rea"));
		System.out.println(s.endsWith("oul"));
		//--==>> true
		//		 false


		// ○ 찾고자 하는 대상 문자열(s)에 kor 문자열이 존재할까?
		//	  존재한다면.. 그 위치는 어떻게 될까? (단, 뒤에서 부터 검사)
		// "seoul korea"

		System.out.println(s.lastIndexOf("e"));
		System.out.println(s.lastIndexOf("o"));
		//--==>> 9
		//		 7
		//-- 뒤에서부터 검사한다고 해서 인덱스를 거꾸로 설정하지 않음

		// ○ 대상 문자열(s) 중 6번째 인덱스 위치의 문자는?
		// "seoul korea"

		System.out.println(s.charAt(6));
		//--==>> k
		//System.out.println(s.charAt(22));
		//--==>> StringIndexOutOfBoundsException 에러 발생(런타임 에러)

		// ○ 대상 문자열(s)와 비교 문자열 seoul korea 중
		//	  어떤 문자열이 더 큰가?   -> 문자열 크기 비교
		//	  ==> 두 문자열이 같다면   -> 0
		//	  ==> 두 문자열이 다르다면 -> ???

		// "seoul korea"
		System.out.println(s.compareTo("seoul korea"));
		//--==>> 0
		//-- 두 문자열이 같음
		System.out.println(s.compareTo("seoul corea"));
		//--==>> 8
		//-- c부터 k까지 차이 defghijk 반환 -> 8


		// ○ 대상 문자열(s) 중 해당 문자열을 찾아서 원하는 형태로 수정된 문자열 반환
		s = "우리나라 대한민국 대한독립 만세";
		//s.replaceAll("대한", "자주");	// 문자열을 바꾸지만 원본대상이 바뀌지 않음
		s = s.replaceAll("대한", "자주");	// 다시 s에 대입하면 원본대상 바뀜
		System.out.println("처리 결과 : " + s);
		//--==>> 처리 결과 : 우리나라 자주민국 자주독립 만세

		// ○ 공백 제거
		s = "          사      랑          ";
		System.out.println("|" + s + "|");
		//--==>> |          사      랑          |

		System.out.println("|" + s.trim() + "|");
		//--==>> |사      랑|
		//-- 양 끝의 가장자리 공백을 없애는 메소드(손톱깎기)

		System.out.println("|" + s.replaceAll(" ","") + "|");
		//--==>> |사랑|


		
		int temp = Integer.parseInt("50");
		System.out.printf("%d\n", temp);
		//--==>> 50


		s = Integer.toString(30);
		System.out.printf("%s\n", s);
		//--==>> 30

		int n = 2345678;
		System.out.printf("%d", n);
		System.out.format("%d", n);
		//--==>> 23456782345678
		//-- 사용법은 같음

		System.out.println();		// 개행

		s = String.format("%d",n); // 이런형태의 문자열을 만들어주는 메소드
		System.out.println(s);
		//--==>> 2345678

		s = String.format("%.2f",123.456);
		System.out.println(s);
		//--==>> 123.46

		s = String.format("확인 : %b", true);
		System.out.println(s);
		//--==>> 확인 : true

		s = String.format("결과 : %,d", n);
		System.out.println(s);
		//--==>> 결과 : 2,345,678


		//String str = "기본,열정,배려";
		//String[] strArr = str.split(",");

		String[] strArr = "기본,열정,배려".split(",");

		for (String str : strArr)
			System.out.print(str + " ");
		System.out.println();
		//--==>> 기본 열정 배려


	}
}