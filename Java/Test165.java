/*================================
 ■■■ 컬렉션(Collection) ■■■
 ================================*/


// List -> Vector, ArrayList, LinkedList, ...
// ·순서 있음
// ·배열과 유사
// ·중복 허용

/*
○ ArrayList 클래스 : Vector와 유사하다.

	- ArrayList와 Vector 클래스는
	  List 를 크기 변경이 가능한 배열로 구성한 것으로
	  차이점은 Vector 클래스의 객체는 기본적으로 동기화 되지만,
	  ArrayList는 그렇지 않다는 점이다. 비동기화 컬렉션이다.
	  멀티스레드에 safety하게 처리해야하지 않는 상황에서는 무조건 ArrayList를 사용

	- 비동기화 컬렉션은 동기화된 컬렉션보다 더 나은 성능을 제공하며
	  스레드들이 컬렉션을 공유할 필요가 없는 프로그램에서는
	  일반적으로 ArrayList를 Vector 보다 더 선호하며,
	  스레드 동기화에 따르는 부담을 가지지 않기 때문에
	  Vector 보다 더 빠르게 실행된다.

	- null 을 포함한 모든 요소를 허용하며
	  List 인터페이스를 구현하는 것 외에 리스트에 격납하기 위해
	  내부적으로 사요되는 배열의 사이즈를 조작하는 메소드를 제공한다.


*/

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.ListIterator;

public class Test165
{
	public static void main(String[] args)
	{
		// ArrayList 자료구조 생성
		//ArrayList<String> list = new ArrayList<String>();

		// list 자료구조를 만들어야겠다고 한다면
		// List<String> list = new List<String>();

		//Vector<String> list = new Vector<String>();
		//List<String> list = new Vector<String>();
		List<String> list1 = new ArrayList<String>();

		// list1 자료구조에 요소 추가 -> add()
		list1.add("오펜하이머");
		list1.add("엘리멘탈");
		list1.add("알라딘");

		List<String> list2 = new ArrayList<String>(list1);  // list 객체를 받는 생성자

		// list2 자료구조에 요소 추가 -> add()
		list2.add("스파이더맨");
		
		List<String> list3 = new ArrayList<String>();

		// list3 에 list2 의 전체 요소 추가 -> addAll()
		list3.addAll(list2);

		// "알라딘" 앞에 "탑건" 추가
		// --> [오펜하이머, 엘리멘탈, 탑건, 알라딘, 스파이더맨]

		// ① 알라딘 찾기 -> indexOf() -> 위치 인덱스 반환
		int n = list3.indexOf("알라딘");

		// 테스트(확인)
		//System.out.println("n : " + n);
		//--==>> n : 2

		// ② "알라딘" 찾은 인덱스 위치에 "탑건" 삽입 -> add()\
		list3.add(n, "탑건");






		// 출력 -> 더미데이터 확인
		System.out.println("==========================================");

		System.out.println(list1);
		//--==>> [오펜하이머, 엘리멘탈, 알라딘]

		System.out.println(list2);
		//--==>> []
		//--==>> [오펜하이머, 엘리멘탈, 알라딘]
		//--==>> [오펜하이머, 엘리멘탈, 알라딘, 스파이더맨]
		
		System.out.println(list3);
		//--==>> [오펜하이머, 엘리멘탈, 알라딘, 스파이더맨]
		//--==>> [오펜하이머, 엘리멘탈, 탑건, 알라딘, 스파이더맨]
		
		// 출력 -> listIterator() 메소드를 활용하여 출력(역순으로 접근이 가능한 메소드)
		System.out.println("===========================================");
		ListIterator<String> li = list3.listIterator();
		while(li.hasNext())
		{
			System.out.print(li.next() + " ");
		}
		System.out.println();
		//--==>> 오펜하이머 엘리멘탈 탑건 알라딘 스파이더맨

		// 출력 -> 역순으로 접근
		while (li.hasPrevious())		// 이전 것이 있는지 없는지 확인
		{
			System.out.print(li.previous() + " ");
		}
		System.out.println();
		//--==>> 스파이더맨 알라딘 탑건 엘리멘탈 오펜하이머







	}
}