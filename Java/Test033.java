/*======================================
���� ���� �帧�� ��Ʈ��(���) ����
- if ��
- if ~ else �� �ǽ�
======================================*/

// 1. ���α׷��� �ۼ��� �� �־��� ���ǿ� ����
//    �б� ������ ���ϱ� ���� ����ϴ� �������
//	  if��, if~else��, ���ǿ�����, ���� if��(if ��ø), switch���� �ִ�.

// 2. if���� if ������ ������ ��(true)�� ���
//    Ư�� ������ �����ϰ��� �� �� ���Ǵ� �����̴�.

// ����ڷκ��� ������ ������ �Է¹޾�
// ������ ���� �Ǻ������ ����ϴ� ���α׷��� �����Ѵ�.
// - 2�� ���
// - 3�� ���
// - 2�� 3�� ���
// - 2�� 3�� ��� �ƴ�

// ���� ��)
// ������ ���� �Է� : 
// 4 -> 2�� ���
// ����Ϸ��� �ƹ� Ű�� ��������...

// ������ ���� �Է� : 
// 12 -> 2�� 3�� ���
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test033
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

	

		System.out.print("������ ���� �Է� : ");
		
		int i = Integer.parseInt(br.readLine());



		String result = "�Ǻ��Ұ�";
		
		if (i == 0)
		{
			result = "2�� 3�� ��� �ƴ�";
		}
		else if ((i % 2 == 0) && (i % 3 == 0))
		{
			result = "2�� 3�� ���";
		}
		else if (i % 2 == 0)
		{
			result = "2�� ���";
		}
		else if (i % 3 == 0)
		{
			result = "3�� ���";
		}
		else
		{
			result = "2�� 3�� ��� �ƴ�";
		}


		System.out.println(i + " -> " + result);



	}
}

// ���� ���

/*
������ ���� �Է� : 13
13 -> 2�� 3�� ��� �ƴ�
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

������ ���� �Է� : 66
66 -> 2�� 3�� ���
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/