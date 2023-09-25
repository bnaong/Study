/*================================
 ■■■ 컬렉션(Collection) ■■■
 ================================*/

 // 자료구조 객체 선언 및 생성시
 // 사용자 정의 클래스 활용
 // -> 자료형

import java.util.Vector;

// 클래스 -> 사용자 정의 자료형으로 활용
class MyData
{
	// 주요 속성 구성 -> 주요 변수 선언(멤버 변수)
	private String name;		//-- 이름
	private int age;			//-- 나이

	// 왜 메소드를 통해서 접근하게 하냐?
	//-- 변수에 값을 담는 것에 대해 얼마든지 규칙, 조건(제한)을 걸 수 있다.
	 
	// getter : 값을 가져다씀?
	// setter : 값을 세팅

	// getter / setter 구성 (외부에서 접근이 가능해야함 => public, 리턴자료형)
	public String getName()				// 가져올 때
	{
		return name;
	}

	public void setName(String name)	// 넣을 때
	{
		this.name = name;
	}

	public int getAge()
	{
		return age;
	}
	 
	public void setAge(int age) // 내가 건네주는 걸로 네가 가진걸 초기화시켜
	{
		this.age = age;
	}
	 
	 // 생성자 -> 사용자 정의 생성자(매개변수 2개인 생성자)
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}
	
	// ※ 사용자 정의 생성자가 구성될 경우
	//	default 생성자가 자동으로 삽입되지 않기 때문에
	//  default 생성자 형태의 생성자를 사용자 정의 생성자로
	//  추가 구성하게 되는 것이 일반적인 클래스 설계 과정
	//  (반드시 설계해야 한다는 문법적인 규칙은 없다.)

	public MyData()
	{
		//this("",0); 또는 아래처럼 구성
		name = "";
		age = 0;
	}




 }


public class Test162
{
	public static void main(String[] args)
	{
		// 벡터 자료구조 생성
		Vector<MyData> v = new Vector<MyData>();  // MyData 타입만 취할 수 있는 v
		//MyData[] dataArr = new MyData[10];

		// 벡터 자료구조 v 에
		// 김수환 73세 / 김지민 7세 / 노은하 3세
		// 담아내기
		
		// ①
		/*
		MyData st1 = new MyData();
		st1.setName("김수환");
		st1.setAge(73);
		v.add(st1);

		MyData st2 = new MyData();
		st2.setName("김지민");
		st2.setAge(7);
		v.add(st2);

		MyData st3 = new MyData();
		st3.setName("노은하");
		st3.setName(3);
		v.add(st3);
		*/

		
		// ②
		/*
		MyData st1 = new MyData("김수환", 73);
		v.add(st1);
		MyData st2 = new MyData("김지민", 7);
		v.add(st2);
		MyData st3 = new MyData("노은하", 3);
		v.add(st3);
		*/

		// ③
		v.add(new MyData("김수환", 73));
		v.add(new MyData("김지민", 7));
		v.add(new MyData("노은하", 3));

		// 벡터 자료구조 v에 담긴 내용(요소) 전체 출력하기
		// 실행 예)
		// 이름 : 김수환, 나이 : 73세
		// 이름 : 김지민, 나이 : 7세
		// 이름 : 노은하, 나이 : 3세
		
		// ①
		/*
		for (MyData obj : v)
		{
			System.out.printf("이름:%s, 나이 :%d세\n", obj.getName(), obj.getAge());
		}
		System.out.println();
		*/

		// ②
		/*
		for (int i=0; i<v.size(); i++)
		{
			System.out.print("이름 : " + v.elementAt(i).getName() + ", 나이 : " + v.elementAt(i).getAge());
			System.out.println();
		}
		*/
		
		// ③
		/*
		for (int i=0; i<v.size(); i++)
		{
			System.out.print("이름 : " + v.get(i).getName() + ", 나이 : " + v.get(i).getAge());
			System.out.println();
		}
		*/
		
		// ④
		for(Object obj : v)
		{
			System.out.print("이름 : " + ((MyData)obj).getName() + ", 나이 : " + ((MyData)obj).getAge());
			System.out.println();
		}
		

		
	}
}

// 실행 결과
/*

이름 : 김수환, 나이 : 73
이름 : 김지민, 나이 : 7
이름 : 노은하, 나이 : 3
계속하려면 아무 키나 누르십시오 . . .

*/