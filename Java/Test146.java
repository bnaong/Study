/*=============================================
 ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
 - �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
 - Random Ŭ����
 ============================================*/

/*
�� java.util.Random Ŭ������

	���� ������ ������ �߻����� �����ϴ� Ŭ�����̴�.
	Math Ŭ������ ���� �޼ҵ��� random() �޼ҵ嵵 ������ �����ϴ� �޼ҵ�������
	0.0~1.0 ������ �Ǽ� ���¸� �߻��ϰ� �ǹǷ�
	�ʿ��� ������ ������ ������ ���ؼ��� �߰����� ������ ���� ���·� �����ؾ� �Ѵ�.
	�׷��� �ڹٴ� ���� ������ ������ �߻������ִ� ���� Ŭ������
	Random Ŭ������ ������ �����ϰ� �ִ�.


*/

// �ζ� ��ȣ ����(���� �߻� ���α׷�)

// ���α׷��� ����Ǹ�...
// �⺻������ �ζ� 5������ �����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
//    3 12 15 24 31 41
//    1 12 18 36 41 42
//    4  9 12 13 22 30
//    5 10 13 14 22 40
//   22 31 36 40 43 44
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Random;
import java.util.Arrays;

class Lotto
{	
	// �迭 ���� ���� �� �޸� �Ҵ� -> �ζ� ��ȣ�� ��Ƶ� �迭 �� 6ĭ
	private int[] num;
	
	// ������
	Lotto()
	{
		num = new int[6];
	}

	public int[] getNum()
	{
		return num;
	}
	// 6���� ������ �߻���Ű�� �޼ҵ� ����
	public void start()
	{
		Random rd = new Random();
		int n;
		int cnt = 0;
		
		// ���� ���� ���(�󺧸� :).����� ��� �ٶ������� ����	
		jump:

		while(cnt < 6)				// cnt -> 0 1 2 3 4 5
		{
			n = rd.nextInt(45)+ 1;	// 0 - 44 -> ��+1�� -> 1 ~ 45

			for (int i=0; i<cnt; i++)
			{
				// num[i] ��ҿ� n �� ��
				if (num[i]==n)
					continue jump;				// ���� �󺧸��� ���������� ��Ż �̵�
			}
			num[cnt++] = n;
			
		}

		// ���� �޼ҵ� ȣ��
		sorting();


		/*=============================
		for (int i=0; i<6; i++)
		{
			num[i] = rd.nextInt(45)+1;

			for (int j=0; j<i; j++)
			{
				if (num[i]==num[j])
				{
					i--;
				}
			}
		}

		sorting();
		=============================*/
	}
	
	// ���� �޼ҵ� ����
	private void sorting()
	{
		Arrays.sort(num);
		/*====================================
		for (int i=0; i<num.length-1; i++)
		{
			for (int j=i+1; j<num.length; j++)
			{
				if (num[i]>num[j])
				{
					// �ڸ� �ٲٱ�
					num[i]=num[i]^num[j];
					num[j]=num[j]^num[i];
					num[i]=num[i]^num[j];
				}
			}
		}
		====================================*/
		
		
	}
}

public class Test146
{
	public static void main(String[] args)
	{
		//Lotto Ŭ���� ��� �ν��Ͻ� ����
		Lotto lotto = new Lotto();


		for (int i=1; i<=5; i++)
		{
			// �ζ� 1���� ����
			lotto.start();
			
			
			// ��� ���
			for (int n : lotto.getNum())
			{
				System.out.printf("%3d",n);
			}
			System.out.println();
			
		}


		/*
		int arr[] = lotto.getNum();
		// �⺻ 5����
		for (int i=1; i<=5; i++)
		{
			// �ζ� 1���� ����
			lotto.start();
			
			
			// ��� ���
			for (int n : arr)
			{
				System.out.printf("%3d",n);
			}
			System.out.println();
			
			

		}
		*/
	}
}

// ���� ���

/*
 16 25 33 41 42 43
 13 26 30 31 36 42
  3 14 29 33 36 38
  6 22 25 27 32 36
 10 12 26 41 43 44
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
