/*================================
 ■■■ 컬렉션(Collection) ■■■
 ================================*/

// Map -> Hashtable, HashMap

/*
○ java.util.Map 인터페이스
   키(key)를 값(valu)에 매핑(mapping)하며
   동일한 키를 등록할 수 없고, 유일해야 하며,
   각 키는 한 개의 값만을 매핑해야 한다.
   즉, 하나의 키에 대응하는 하나의 값을 갖는 구조이다.
*/

/*
○ HashMap<K, V> 클래스

   - HashMap 클래스는 Hashtable 클래스와 마찬가지로
     Map 인터페이스에서 상속받아 주요 기능이 같지만
	 Synchronization 이 업식 때문에 동시성 문제가 없다면
	 (즉, 멀티 스레드 프로그램이 아닌 경우라면)
	 HashMap 을 사용하는 것이 성능을 향상시킬 수 있다.
   - 또한, HashMap은 Hashtable 과 달리 null 을 허용한다.

*/
import java.util.HashMap;
import java.util.Map;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test171
{
	public static void main(String[] args) throws IOException
	{
		// HashMap 자료구조 생성
		//HashMap<String, String> map = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();

		// map 이라는 HashMap 자료구조에 요소 추가
		// -> put(); 메소드 사용
		map.put("영화", "거미집");
		map.put("드라마", "무빙");
		map.put("만화", "슬램덩크");
		map.put("소설", "지구끝의온실");
		
		// 테스트(확인) -> 더미 확인
		System.out.print(map);
		//--==>> {소설=지구끝의온실, 드라마=무빙, 영화=거미집, 만화=슬램덩크}
		// 데이터 매핑 구조 확인
		// 데이터 요소 격납 순서가 추가 순서와 관계 없음
		System.out.println();

		// ※ null 관련 처리
		map.put(null, null);		//-- key와 value 가 모두 null
		System.out.print(map);
		//--==>> {소설=지구끝의온실, null=null, 드라마=무빙, 영화=거미집, 만화=슬램덩크}
		System.out.println();

		map.put("동화", null);		//-- value 가 null
		System.out.print(map);
		//--==>> {소설=지구끝의온실, null=null, 드라마=무빙, 영화=거미집, 동화=null, 만화=슬램덩크}
		System.out.println();

		map.put(null, "모나리자");	//-- key 가 null
		System.out.print(map);
		//--==>> {소설=지구끝의온실, null=모나리자, 드라마=무빙, 영화=거미집, 동화=null, 만화=슬램덩크}계
		System.out.println();
		// key는 중복 허용하지 않으며, null 도 하나의 key와 value로 간주

		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("카테고리 타이틀 입력(컴마 구분) : ");
		String[] temp;

		for (String str; ((str = br.readLine()) != null); )
		{
			temp = str.split(",");
			if (temp.length<2)
			{
				System.out.print("카테고리, 타이틀 입력(컴마 구분) : ");
				continue;
			}

			map.put(temp[0].trim(), temp[1].trim());
			System.out.println(map);
		}
		//--==>> 카테고리 타이틀 입력(컴마 구분) : 소설,어린왕자
		//	{소설=어린왕자, null=모나리자, 드라마=무빙, 영화=거미집, 동화=null, 만화=슬램덩크}
		//	드라마,힙하게
		//	{소설=어린왕자, null=모나리자, 드라마=힙하게, 영화=거미집, 동화=null, 만화=슬램덩크}
		//	영화,잠
		//	{소설=어린왕자, null=모나리자, 드라마=힙하게, 영화=잠, 동화=null, 만화=슬램덩크}

		

	}
}