/*=====================================
 ���� Ŭ������ �ν��Ͻ� ����
======================================*/

// ����ڷκ��� ������ �� ������ �����ڸ� �Է¹޾�
// �ش� ������ �����ϴ� ���α׷��� �����Ѵ�.
// ��, Ŭ������ �ν��Ͻ��� ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
// (Calculate Ŭ���� ����)

// ���� ��)
// ������ �� ���� �Է�(���� ����) : 100 51
// ������ ������(+ - * /)		  : +

// >> 100 + 51 = 151
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;
import java.io.IOException;


class Calculate
{
	// �ֿ� ���� ����
	int su1, su2;			//-- ����ڷκ��� �Է¹��� �� ������ ��Ƴ� ����
	char op;				//-- ����ڷκ��� �Է¹��� �����ڸ� ��Ƴ� ����

	// �Է� �޼ҵ�
	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("������ �� ���� �Է�(���� ����) : ");
		su1 = sc.nextInt();
		su2 = sc.nextInt();

		System.out.print("������ ������(+ - * /)		  : ");
		op = (char)System.in.read();
	}
	
	// ���� �޼ҵ� -> ������ ���굵 ���� ������� ó��
	int cal()
	{
		int result = -1;							// �ʱ�ȭ or default �߰� ���ֱ�

		switch (op)
		{
		case '+': result = su1 + su2; break;
		case '-': result = su1 - su2; break;
		case '*': result = su1 * su2; break;
		case '/': result = su1 / su2; break;
		}
		return result;
	
	}

	// ��� �޼ҵ�
	void print(int s)
	{
		System.out.printf("\n>> %d %c %d = %d\n", su1, op, su2, s);
	}
	

}







public class Test073
{
	public static void main(String[] args) throws IOException
	{
		Calculate ob = new Calculate();

		ob.input();
		int r = ob.cal();
		ob.print(r);

		
	}
}

// ���� ���
/*

������ �� ���� �Է�(���� ����) : 40 20
������ ������(+ - * /)            : +

>> 40 + 20 = 60
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

������ �� ���� �Է�(���� ����) : 49 3
������ ������(+ - * /)            : -

>> 49 - 3 = 46
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/