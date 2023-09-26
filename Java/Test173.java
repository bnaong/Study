/*=====================================
 ■■■ 자바의 기본 입출력(I/O) ■■■
 - OutputStream 실습
 ====================================*/

import java.io.IOException;
import java.io.OutputStream;

public class Test173
{
	public static void main(String[] args) throws IOException
	{
		// ※ 『System.in』 : 자바의 표준 입력 스트림(객체)
		//    『System.out』: 자바의 표준 출력 스트림(객체)
		OutputStream out = System.out;


		// 배열 구성
		byte[] ch = new byte[3];

		ch[0] = 65;		// A
		ch[1] = 97;		// a
		ch[2] = 122;	// z
		
		
		/*
		out.write(ch[0]);	// 65
		out.write(97);
		out.write(122);
		*/
		

		out.write(ch);		//-- 밖으로 내보낼 데이터(변수)를 스트림(물줄기)에 기록

		out.flush();		//-- 기록된 스트림을 내보내는(밀어내는) 기능을 수행
							//   지금은 BufferedReader를 활용하지 않고 있는 상황이기 때문에
							//   생략이 가능한 코드.
							//   (BufferedReader 되어있는 스트림(stream)일 경우 생략 불가
		
		out.close();		// .close() => 그 객체의 리소스를 반납해서 이제 리소스를 쓰지 않겠다는 의미
							//  (out 스트림을(물주기 수도꼭지를) 잠가버린 상황

		System.out.println("절대적인 신뢰를 갖고 있는 구문");
		//-- 『out.close()』를 작성한 이후 출력되지 않는 구문.
		//    출력되는 스트림(물줄기)를 닫았기 때문에...


	}
}