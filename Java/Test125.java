/*=============================
 ���� Ŭ���� ��� ����
 - ��ø Ŭ����
 =============================*/

/*
�� Annonymous Ŭ����(�͸��� Ŭ���� : ���� Ŭ����)

	- AWT �� �ȵ���̵� �̺�Ʈ ó��(���α׷� ó������ �Ͼ�� ��� ��, ���۵�)���� �Ϲ������� ���
	- ���� Ŭ���� �޼ҵ带 �ϳ� ���� �������� �ʿ伺�� ���� �� ���
	- Ŭ������ ��ü�� �ʿ��ϸ� �� �ٽ� Ŭ������ �����ؾ� �ϴ� ���ŷο����� ���� ����ϰ� ��ü ������ �ʿ��� ���
	�͸��� Ŭ������ �����Ͽ� ó���� �� �ִ�.

�� ���� �� ����

	new ���� Ŭ������ ������()
	{
		�������������� �ڷ��� �޼ҵ�()
		{
			...;
		}
	};		<- check~!!! �����ݷ�


*/

// import java.lang.Object;
import java.lang.*;	//-- �ڵ����� ���Ե�

class TestObj // extends Object -> ��� Ŭ������ ���� �ö󰡺��� Object Ŭ������ �ִ�. (����Ŭ����)
{
	/*
	object �����~!!!
	...;
	...;
	*/
	
	/*
	@Override
	public String toString()
	{
		...;
	}

	...;

	*/
	
	public Object getString()	//-- ������Ʈ ��ü Ÿ���� ��ȯ�ϴ� �ڷ���
	{
		/*
		Object ob = new Object();
		ob.xx();
		ob.yyy();
		ob.zzzz();

		return ob;
		*/

		//return new Object();
		//       ------------- Object ��

		return new Object()						// �̹� ������� ���赵�� �մ� �� ������ �������ؼ� ���°�. ������ ob��� �̸� ���ΰͰ� �޸� �̸��� ����.
		{
			// Ư�� �޼ҵ� �籸�� -> ������
			@Override
			public String toString()
			{
				return "�͸��� Ŭ����...";
			}
		};

	}

}
// import java.lang.*;

public class Test125		// extends Object
{
	/*
	Object �� ����� ���~!!!
	*/
	
	public static void main(String[] args)
	{
		TestObj ob = new TestObj();

		System.out.println(ob.toString());				//-- object�� ���� �������� �� �״�� ���ڴ�.
		//--==>> TestObj@15db9742

		System.out.println(ob.getString());
		//--==>> �͸��� Ŭ����...



		
	}
}