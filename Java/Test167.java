/*===============================
 ■■■ 컬렉션(Collection) ■■■
 ===============================*/

 // List -> String[] : List안에 List.toArray() 라는 메소드 있다.
 
 // String[] -> List : Arrays안에 Arrays.asList() 라는 메소드 있다.

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

public class Test167
{
	public static void main(String[] args)
	{
		List<String> mList = new ArrayList<String>();

		mList.add("1");
		mList.add("2");
		mList.add("3");

		// check~!!!
		// List -> String[]
		// mList.toArray(new String[3]);
		// list 구조를 String 배열로 변환시키는 구문
		String[] strArray = mList.toArray(new String[mList.size()]);

		for (String s : strArray)
		{
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>> 1 2 3

		// check~!!!
		// String[] -> List
		// Array.asList();
		// String 배열을 List로 변환시키는 구문
		List<String> mNewList = Arrays.asList(strArray);
		// ※ Array.asList() 의 반환 자료형은 List
		
		for (String s : mNewList)
		{
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>> 1 2 3

	}
}
