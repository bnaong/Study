/*=====================================
 ���� Ŭ������ �ν��Ͻ� ����
======================================*/

// �� CircleTest.java ���ϰ� �� ��Ʈ~!!!

// ���� ���̿� �ѷ� ���ϱ�
// ���� ���̿� �ѷ��� ���� �� �ִ� Ŭ������ �����Ѵ�.
// (Ŭ������ : CircleTest)
// �Է��� BufferedReader �� readLine()

// �� ���� ���� = ������ * ������ * 3.141592
//	  ���� �ѷ� = ������ * 2 * 3.141592

// ���� ��)
// ������ �Է� : xxx

// >> �������� xxx�� ����
// >> ���� : xxx.xx
// >> �ѷ� : xxx.xx
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.IOException;

public class Test071
{
	public static void main(String[] args) throws IOException
	{
		// CircleTest Ŭ���� ����� �ν��Ͻ� ����
		// CircleTest �ν��Ͻ� ����
		// CircleTest ��ü ����
		CircleTest ct = new CircleTest();

		ct.input();

		double area = ct.calArea();

		double length = ct.calLength();

		ct.print(area, length);

		
	}
}

// ���� ���

/*

������ �Է� : 5

>> �������� 5�� ����
>> ���� : 78.5398
>> �ѷ� : 31.41592
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .


*/