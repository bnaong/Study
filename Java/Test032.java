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
// �Է¹��� ������ Ȧ������ ¦������ 0���� Ȯ���Ͽ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ������ ���� �Է� : 14
// 14 -> ¦��
// ����Ϸ��� �ƹ� Ű�� ��������...

// ������ ���� �Է� : 0
// 0 -> ��
// ����Ϸ��� �ƹ�Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test032
{
	public static void main(String[] args) throws IOException
	{

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String result;

		System.out.print("������ ���� �Է� : ");
		int i = Integer.parseInt(br.readLine());
		
		/*
		if (i % 2 == 0)
		{	
			if (i == 0)
			{
				result = "��";
			}
			else
			{
				result = "¦��";
			}
		}
		else
		{
			result = "Ȧ��";
		}
		*/


		if (i % 2 == 1)
		{	
			result = "Ȧ��";
		}
		else if (i == 0)
		{
			result = "��";						// ¦���� ���� ���� �˻纸�� 0�� ���� ���� �˻縦 ���� �ؾ��Ѵ�.
		}
		else
		{
			result = "¦��";
		}


		System.out.println(i + " -> " + result);

	}
}

// ���� ���

/*
������ ���� �Է� : -14
-14 -> ¦��
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

������ ���� �Է� : 5
5 -> Ȧ��
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

������ ���� �Է� : 0
0 -> ��
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/