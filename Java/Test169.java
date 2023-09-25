/*================================
 ■■■ 컬렉션(Collection) ■■■
 ================================*/

/*
○ Set -> HashSet, TreeSet, ...
 	- 순서 의미 없음
	- 중복 허용하지 않는 구조(기본)

○ TreeSet<E> 클래스

	java.util.TreeSet<E> 클래스는
	Set 인터페이스를 상속한 SortedSet 인터페이스를 구현한 클래스로
	(정렬기능이 포함된 Set -> 사용빈도가 높지않음. 정렬기능에 부하가 많이 발생하여 성능이 떨어지므로)
	데이터를 추가하면 데이터들이 자동으로 오름차순 정렬이 된다.
*/

// VO  - Value Object
// DTO - Data Transfer Object
// DAO - Data Access Object

// DTO + DA 구분
// VO + DAO 구분
// VO와 DTO를 거의 구분하진 않지만, 나눠서 프로젝트를 수행하는 경우도 있다.

import java.util.TreeSet;
import java.util.Iterator;
import java.util.Comparator;

class GradeVO
{
	// 주요 속성 구성
	private String hak;			//-- 학번
	private String name;		//-- 이름
	private int kor, eng, mat;  //-- 국어, 영어, 수학 점수

	// 사용자 정의 생성자
	GradeVO(String hak, String name, int kor, int eng, int mat)
	{
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	// 이와 같은 경우 default 생성자 자동 삽입되지 않음~!!!

	// 사용자 정의 생성자 -> 매개변수 없는 생성자(default 생성자 형태)
	GradeVO()
	{
		// 생성자 내부에서 또 다른 생성자 호출
		//GradeVO("","", 0, 0, 0);
		//
		this("","", 0, 0, 0);
	}

	// getter / setter 구성
	public void setHak(String hak)
	{
		this.hak = hak;
	}
	
	public String getHak()
	{
		return hak;
	}

	public void setName(String name)
	{
		this.name = name;
		
	}

	public String getName()
	{
		return name;
	}

	public void setKor(int kor)
	{
		this.kor = kor;
	}

	public int getKor()
	{
		return kor;
	}

	public void setEng(int eng)
	{
		this.eng = eng;
	}
	
	public int getEng()
	{
		return eng;
	}

	public void setMat(int mat)
	{
		this.mat = mat;
	}

	public int getMat()
	{
		return mat;
	}

	// 추가 메소드 정의(총점 산출)
	public int getTot()
	{
		//return kor + eng + mat;
		return this.kor + this.eng + this.mat;
	}
}
//-- 왜하냐면.. 내부적으로 크기비교를 할 때 쓰는 메소드가 compare이기 때문에 재정의해서 받아 쓰게 된다.
//-- E : 어떤 엘리먼트를 수용하게 되면~, T : 어떤 타입을 담게 되면~
// 클래스 설계할 때 : 인스턴스 생성할 떄 <>안에 타입을 끼워서 생성해라~
class MyComparator<T> implements Comparator<T>	
{
	// 비교 메소드 재정의
	@Override
	public int compare(T o1, T o2)
	{
		GradeVO s1 = (GradeVO)o1;
		GradeVO s2 = (GradeVO)o2;

		// 학번 기준(오름차순)
		//return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
		// return Integer.parseInt("2308113") - Integer.parseInt("2308116");
		// return 2308113 - 2308116;
		// return -3;
		// -> o2 가 더 큰 것으로 비교 결과 전달~!!!

		// ... return 5;
		// -> o1 이 더 큰 것으로 비교 결과 전달~!!

		// ... return 0;
		// -> o1 과 o2가 같은 것으로 비교 결과 전달~!!!

		// 학번 기준(내림차순)
		//return Integer.parseInt(s2.getHak()) - Integer.parseInt(s1.getHak());
		///return s2.getHak().compareTo(s1.getHak());

		// 총점 기준(오름차순)
		//return s1.getTot() - s2.getTot();
		return Integer.valueOf(s1.getTot()).compareTo(Integer.valueOf(s2.getTot()));

		// 총점 기준(내림차순)
		//return s2.getTot() - s1.getTot();

		// 이름 기준(오름차순)
		//return s1.getName().compareTo(s2.getName());

		// 이름 기준(내림차순)
		//return s2.getName().compareTo(s1.getName());


	}

}










public class Test169
{
	public static void main(String[] args)
	{
		// TreeSet 자료구조 생성
		TreeSet<String> set = new TreeSet<String>();

		// TreeSet 자료구조 set 에 요소 추가 -> add();
		set.add("짱구는못말려");
		set.add("슬램덩크");
		set.add("원피스");
		set.add("달빛천사");
		set.add("이누야샤");
		set.add("너의이름은");
		set.add("슈가슈가룬");		// 추가시간은
		set.add("배틀짱");
		set.add("디지몬");

		// Iterator 를 활용한 Set 요소 전체 출력
		Iterator<String> it = set.iterator();
		
		while (it.hasNext())
		{
			String s = it.next();
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>> 너의이름은 달빛천사 디지몬 배틀짱 슈가슈가룬 슬램덩크 원피스 이누야샤 짱구는못말려
		//-- 요소를 문자열로 구성할 경우
		//   가나다순 -> 오름차순 정렬

		// TreeSet 자료구조 생성
		//TreeSet<GradeVO> set2 = new TreeSet<GradeVO>();
		
		TreeSet<GradeVO> set2 = new TreeSet<GradeVO>(new MyComparator<GradeVO>());

		// TreeSet 자료구조 set2에 요소 추가
		set2.add(new GradeVO("2308113", "길현욱", 90, 80, 70));
		set2.add(new GradeVO("2308116", "최혜인", 91, 81, 81));
		set2.add(new GradeVO("2308120", "이윤수", 88, 78, 68));
		set2.add(new GradeVO("2308103", "김다슬", 70, 95, 91));
		set2.add(new GradeVO("2308132", "정형욱", 99, 82, 79));

		// Iterator 를 활용한 set2 요소 전체 출력
		/*
		Iterator<GradeVO> it2 = set2.iterator();
		
		while (it2.hasNext())
		{		
			System.out.print(it2.next() + " ");
		}
		System.out.println();
		//--==>> 에러 발생(런타임 에러)
		//		 java.lang.ClassCastException:
		//		 GradeVO cannot be cast to java.lang.Comparable
		// TreeSet은 문자열들끼리 비교하는 구조를 내부적으로 구성 되어있기 때문에
		// 자료들의 크기비교가 되어야 내부적으로 격납을 하고 꺼내 쓰는데, 어떠한 처리를 하지않으면
		// 그냥은 쓸 수 없다.
		//
		*/


		// ※ My Comparator 클래스를 생성하여
		//    compare() 메소드를 재정의 한 후 다시 구성

		/*
		Iterator<GradeVO> it2 = set2.iterator();

		while (it2.hasNext())
		{		
			System.out.print(it2.next() + " ");
		}
		System.out.println();
		*/

		// ※ 객체 자체를 직접 출력하는 것이 아니라
		//    객체가 갖고 있는 속성에 접근하여 출력할 수 있도록 처리
		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{
			// 주의 : System.out.print(it2.next().getName() + " " + it2.next().getHak()); 와 같이 구성하면, 0번째 학생의 이름, 1번째 학생의 학번을 얻어오게 된다.
			GradeVO vo = it2.next();
			System.out.println(vo.getHak() + " " + vo.getName() + " " + vo.getKor() + " " + vo.getEng() + " " + vo.getMat() + " " + vo.getTot());
		}

		

	}
}