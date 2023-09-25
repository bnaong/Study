/*================================
 ���� �÷���(Collection) ����
 ================================*/

 // List -> String[] : List�ȿ� List.toArray() ��� �޼ҵ� �ִ�.
 
 // String[] -> List : Arrays�ȿ� Arrays.asList() ��� �޼ҵ� �ִ�.

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
		// list ������ String �迭�� ��ȯ��Ű�� ����
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
		// String �迭�� List�� ��ȯ��Ű�� ����
		List<String> mNewList = Arrays.asList(strArray);
		// �� Array.asList() �� ��ȯ �ڷ����� List
		
		for (String s : mNewList)
		{
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>> 1 2 3

	}
}