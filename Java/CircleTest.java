/*=====================================
 ���� Ŭ������ �ν��Ͻ� ����
======================================*/

// �� Test071.java ���ϰ� �� ��Ʈ~!!!

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

/*
class ��
{
	// �Ӽ�(����, ������)	-> ����	(���� �ǹ� ����)
	������

	// ���(����, ����)		-> �޼ҵ� (���� �ǹ� ����)
	������ �Է�()
	{
	}
	���� ���()
	{
	}
	�ѷ� ���()
	{
	}
	��� ���()
	{
	}
}
*/

// �������� ���������� �Ǿ�� ��. main �޼ҵ尡 ���� ������ ������ X
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class CircleTest
{

	// �ֿ� �Ӽ�(����, ������)		-> ��� ����
	int r;											//-- ������
	final double PI = 3.141592;						//-- ������(������ ���ȭ)	

	// �ֿ� ���(����, ����)		-> ��� �޼ҵ�
	
	// ������ �Է� ���
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("������ �Է� : ");
		r = Integer.parseInt(br.readLine());
	}
	
	// �ѷ� ��� ���
	double calLength()
	{
		// ���� �ѷ� = ������ * 2 * 3.141592
		return r * 2 * PI;
	}
	

	// ���� ��� ���
	double calArea()
	{
		// ���� ���� = ������ * ������ * 3.141592
		//return r * r * PI;

		double result;
		result = r * r * PI;
		return result;
	}
	
	// ��� ���
	void print(double a, double b)
	{
		System.out.printf("\n>> �������� %d �� ����\n",r);
		System.out.println(">> ���� : " + a);
		System.out.println(">> �ѷ� : " + b);
	}


	
}