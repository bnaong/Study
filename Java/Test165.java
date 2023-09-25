/*================================
 ���� �÷���(Collection) ����
 ================================*/


// List -> Vector, ArrayList, LinkedList, ...
// ������ ����
// ���迭�� ����
// ���ߺ� ���

/*
�� ArrayList Ŭ���� : Vector�� �����ϴ�.

	- ArrayList�� Vector Ŭ������
	  List �� ũ�� ������ ������ �迭�� ������ ������
	  �������� Vector Ŭ������ ��ü�� �⺻������ ����ȭ ������,
	  ArrayList�� �׷��� �ʴٴ� ���̴�. �񵿱�ȭ �÷����̴�.
	  ��Ƽ�����忡 safety�ϰ� ó���ؾ����� �ʴ� ��Ȳ������ ������ ArrayList�� ���

	- �񵿱�ȭ �÷����� ����ȭ�� �÷��Ǻ��� �� ���� ������ �����ϸ�
	  ��������� �÷����� ������ �ʿ䰡 ���� ���α׷�������
	  �Ϲ������� ArrayList�� Vector ���� �� ��ȣ�ϸ�,
	  ������ ����ȭ�� ������ �δ��� ������ �ʱ� ������
	  Vector ���� �� ������ ����ȴ�.

	- null �� ������ ��� ��Ҹ� ����ϸ�
	  List �������̽��� �����ϴ� �� �ܿ� ����Ʈ�� �ݳ��ϱ� ����
	  ���������� ���Ǵ� �迭�� ����� �����ϴ� �޼ҵ带 �����Ѵ�.


*/

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.ListIterator;

public class Test165
{
	public static void main(String[] args)
	{
		// ArrayList �ڷᱸ�� ����
		//ArrayList<String> list = new ArrayList<String>();

		// list �ڷᱸ���� �����߰ڴٰ� �Ѵٸ�
		// List<String> list = new List<String>();

		//Vector<String> list = new Vector<String>();
		//List<String> list = new Vector<String>();
		List<String> list1 = new ArrayList<String>();

		// list1 �ڷᱸ���� ��� �߰� -> add()
		list1.add("�������̸�");
		list1.add("������Ż");
		list1.add("�˶��");

		List<String> list2 = new ArrayList<String>(list1);  // list ��ü�� �޴� ������

		// list2 �ڷᱸ���� ��� �߰� -> add()
		list2.add("�����̴���");
		
		List<String> list3 = new ArrayList<String>();

		// list3 �� list2 �� ��ü ��� �߰� -> addAll()
		list3.addAll(list2);

		// "�˶��" �տ� "ž��" �߰�
		// --> [�������̸�, ������Ż, ž��, �˶��, �����̴���]

		// �� �˶�� ã�� -> indexOf() -> ��ġ �ε��� ��ȯ
		int n = list3.indexOf("�˶��");

		// �׽�Ʈ(Ȯ��)
		//System.out.println("n : " + n);
		//--==>> n : 2

		// �� "�˶��" ã�� �ε��� ��ġ�� "ž��" ���� -> add()\
		list3.add(n, "ž��");






		// ��� -> ���̵����� Ȯ��
		System.out.println("==========================================");

		System.out.println(list1);
		//--==>> [�������̸�, ������Ż, �˶��]

		System.out.println(list2);
		//--==>> []
		//--==>> [�������̸�, ������Ż, �˶��]
		//--==>> [�������̸�, ������Ż, �˶��, �����̴���]
		
		System.out.println(list3);
		//--==>> [�������̸�, ������Ż, �˶��, �����̴���]
		//--==>> [�������̸�, ������Ż, ž��, �˶��, �����̴���]
		
		// ��� -> listIterator() �޼ҵ带 Ȱ���Ͽ� ���(�������� ������ ������ �޼ҵ�)
		System.out.println("===========================================");
		ListIterator<String> li = list3.listIterator();
		while(li.hasNext())
		{
			System.out.print(li.next() + " ");
		}
		System.out.println();
		//--==>> �������̸� ������Ż ž�� �˶�� �����̴���

		// ��� -> �������� ����
		while (li.hasPrevious())		// ���� ���� �ִ��� ������ Ȯ��
		{
			System.out.print(li.previous() + " ");
		}
		System.out.println();
		//--==>> �����̴��� �˶�� ž�� ������Ż �������̸�







	}
}