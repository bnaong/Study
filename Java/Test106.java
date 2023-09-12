/*===========================================
 ���� �ֹε�Ϲ�ȣ ��ȿ�� �˻� ����
============================================*/

/*
�� �ֹε�Ϲ�ȣ ���� ����

	�� ������ �ڸ��� ������ ���ڸ� ���� ��Ģ�� �°� ���Ѵ�.
		123456-1234567 (�ֹι�ȣ)
		****** ******	------------------------- �� �ڸ����� ���ϱ�
		234567 892345	(�� �ڸ����� ������ ��)
	
	�� ��Ģ�� �°� ���� ������ ������ ����� ��� ���Ѵ�.
		ex) 7 5 0 6 1 5 - 1 8 6 2 1 3 3
			* * * * * *   * * * * * *
			2 3 4 5 6 7	  8 9 2 3 4 5
			---------------------------
			-> 14 + 15 + 0 + 30 + 6 + 35 + 8 + 72 + 12 + 6 + 4 + 15 == 217
	
	�� ������ ������� 11�� ������ ������������ ���Ѵ�.

		217 % 11 == 8

	�� 11���� ������(8)�� �� ������� ���Ѵ�.
		11 - 8 --> 3

		�� ���� ó�� �������� �������� 0�� ��� -> 11 - 0 --> 11
		   ���� ó�� �������� �������� 1�� ��� -> 11 - 1 --> 10

		   �̸� �ٽ� 10���� ������ �������� ���Ѵ�.		  --> 1 or 0
	
	�� ���� ���� ����� �ֹι�ȣ�� �����ϴ� ������ ���ڿ�
	   ��ġ�ϴ����� ���θ� ���Ͽ� Ȯ���Ѵ�.

	   ��ġ   --> ��ȿ�� �ֹι�ȣ
	   ����ġ --> �߸��� �ֹι�ȣ
	
*/

// ���� ��)
// �ֹι�ȣ�Է�(xxxxxx-xxxxxxx) : 123456-12345678		//-- �Է� ���� �ʰ�
// >> �Է� ����~!!!
// ����Ϸ��� �ƹ� Ű�� ��������...

// �ֹι�ȣ�Է�(xxxxxx-xxxxxxx) : 123456-123456			//-- �Է� ���� �̴�
// >> �Է� ����~!!!
// ����Ϸ��� �ƹ� Ű�� ��������...

// �ֹι�ȣ�Է�(xxxxxx-xxxxxxx) : 123456-1234567		//-- ��ȿ�� �ֹι�ȣ
// >> ��Ȯ�� �ֹι�ȣ~!!!
// ����Ϸ��� �ƹ� Ű�� ��������...

// �ֹι�ȣ�Է�(xxxxxx-xxxxxxx) : 123456-1234567		//-- �߸��� �ֹι�ȣ
// >> �߸��� �ֹι�ȣ~!!!
// ����Ϸ��� �ƹ� Ű�� ��������...

// �� ���� �ذ��� ���� �߰� ��~!!!
// �迭.length				-> �迭�� ����(�迭���� ����) ��ȯ
// ���ڿ�.length()			-> ���ڿ��� ���� ��ȯ

// ���ڿ�.substring(m,n)	-> ���ڿ� ����
// ���ڿ� m��° ��ġ���� n-1��° ��ġ���� ����(�ε����� 0����)

// ���ڿ�.substring(m)		-> ���ڿ� ����
// ���ڿ� m��° ��ġ���� ���ڿ��� ������ ����(�ε����� 0����)

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
public class Test106
{
	public static void main(String[] args) throws IOException
	{
		// BufferedReader �ν��Ͻ� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// �Է¹��� �ֹι�ȣ(���ڿ� ����)�� ��Ƶ� ���� ����
		String str;


		// ���Ŀ� ���� �ֹι�ȣ�� �� �ڸ����� ���ϰ� �� �� -> �迭 ���·� ����
		int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5};


		// ���� ���� �� ������ -> �� ������ ����� ���س�����...
		int tot=0;


		System.out.print("�ֹι�ȣ�Է�(xxxxxx-xxxxxxx) : ");
		str = br.readLine();										//-- �ֹι�ȣ�� 0���� ������ �� �����Ƿ� Integer�� �Է� X!!
		
		if (str.length()!=14)
		{
			System.out.println(">> �Է� ����~!!!");
			return;													//-- �޼ҵ� ���� -> main() �޼ҵ� ���� -> ���α׷� ����
		}
		
		//�׽�Ʈ
		//System.out.println(">> �ڸ� �� ����~!!!");
		// ex) "750615-1252085"
		for (int i=0; i<13; i++)
		{
			//System.out.print(i + " ");
			//--==>> 0 1 2 3 4 5 6 7 8 9 10 11 12
			
			// i�� 6�� ������ �޺κ� �����ϰ� ����ض�
			if (i==6)
			{
				continue;
			}

			tot += chk[i] * Integer.parseInt(str.substring(i, (i+1)));
		}


		//System.out.println("tot : " + tot);

		//------------------------------------------------------------------- ������� �����ϸ� ���������� 1�� 2�� ��� ���� ��Ȳ�̸�
		//																	  ��Ģ�� �°� ���� ������ ������ ����� ��� ���� ����
		//																	  ���� tot�� ����ִ� ���°� �ȴ�.

		int su = 11 - tot % 11;

		//------------------------------------------------------------------- ������� �����ϸ� ���� ������ 3�� 4�� ��� ���� ��Ȳ�̸�
		//																	  su�� ���� �������� �� �ڸ��� ������ ���� ���
		//																	  �ֹι�ȣ ������ �ڸ��� ���ڿ� �񱳸� ������ �� ���� ��Ȳ.

		su = su % 10;	// su %= 10;

		// �ֹι�ȣ�� ������ �ڸ��� ���� ����� ���ٸ� -> ��Ȯ�� �ֹι�ȣ
		//										�ƴ϶�� -> �߸��� �ֹι�ȣ
		if (su == Integer.parseInt(str.substring(13)))
		{
			System.out.println(">> ��Ȯ�� �ֹι�ȣ~!!!");
		}
		else
		{
			System.out.println(">> �߸��� �ֹι�ȣ~!!!");
		}




		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		String str;

		int sum=0;
		
		System.out.print("�ֹι�ȣ�Է�(xxxxxx-xxxxxxx) : ");
		str = br.readLine();

		if (str.length()!=14)
		{
			System.out.println(">> �Է� ����~!!!");
			return;
		}

		int[] arr = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5};
		
		for (int i=0; i<6; i++)
		{
			int num1 = Integer.parseInt(str.substring(i,i+1));
			sum += num1 * arr[i];
		}
		for (int i=7; i<13; i++)
		{
			int num2 = Integer.parseInt(str.substring(i,i+1));
			sum += num2 * arr[i];
		}


		// ������ ����
		int num3 = Integer.parseInt(str.substring(13));

		
		//System.out.println(sum);
		if ((sum % 11 < 10) && (11-(sum % 11) == num3))
		{
			System.out.println(">> ��Ȯ�� �ֹι�ȣ~!!!");
		}
		else if (((11-sum%11)%10==0) || ((11-sum%11)%10==1))
		{
			System.out.println(">> ��Ȯ�� �ֹι�ȣ~!!!");
		}
		else
		{
			System.out.println(">> �߸��� �ֹι�ȣ~!!!");	
		}
		*/



		
		//�׽�Ʈ
		/*
		String strTemp = "������";
		System.out.println(strTemp.length());
		//--==>> 3

		strTemp = "������������������";
		System.out.println(strTemp.length());
		//--==>> 9

		strTemp = "���ع��� ��λ��� ������ �⵵��";	//-- ��������
		System.out.println(strTemp.length());
		//--==>> 17

		strTemp = "study-hard";
		System.out.println(strTemp.length());
		//--==>> 10
		*/
		//-------------------------------------------------------------------
		/*
		String strTemp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println(strTemp.substring(13, 17));

		//System.out.println(strTemp.substring(13, 53));
		//--==>> ���� �߻�(��Ÿ�� ����)
		//	     StringIndexOutOfBoundsException

		System.out.println(strTemp.substring(13));
		//--==>> NOPQRSTUVWXYZ
		*/
		
	}
}

// ���� ���

/*

�ֹι�ȣ�Է�(xxxxxx-xxxxxxx) : 750615-1862133
>> ��Ȯ�� �ֹι�ȣ~!!!
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

*/