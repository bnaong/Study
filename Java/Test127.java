/*=============================================
 ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
 - �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
 - Object Ŭ����
 ============================================*/

// Test126.java ���ϰ� ��~!!!

// import java.lang.*;
// (import java.lang.Object �� �����ϴ� ����)

public class Test127 // extends Object
{
	/*
	Object Ŭ������ ���� ��� ���� �����
	...


	public String toString()
	{
		...;
	}
	..
	*/

	@Override
	public String toString()
	{
		return "�������� toString()...";
	}

	public static void main(String[] args)
	{
		Test127 ob = new Test127();

		System.out.println(ob.toString());
		//--==>> �������� toString()...

		System.out.println(ob);					//-- �޼ҵ尡 ����� �Ǿ
		//--==>> �������� toString()...
	}
}