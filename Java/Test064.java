/*===========================================
���� ���� �帧�� ��Ʈ��(���) ����
=============================================*/

// break �ǽ�

// ������ ���� ó���� �̷������ ���α׷��� �����Ѵ�.
// ��, �Է¹޴� ������ 1 ~ 100 ���� �ȿ�����
// �����ϵ��� ó���Ѵ�.

// ���� ��)
//
// ������ ���� �Է� : -10
//
// ������ ���� �Է� : 0
//
// ������ ���� �Է� : 2023
//
// ������ ���� �Է� : 10
// >> 1 ~ 10 ������ �� : 55
// ����Ͻðڽ��ϱ�(Y/N)? : y
//
// ������ ���� �Է� : 100
// >> 1 ~ 10 ������ �� : 5050
// ����Ͻðڽ��ϱ�(Y/N)? : N
// ����Ϸ��� �ƹ� Ű�� ��������...


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;


public class Test064
{
	public static void main(String[] args) throws IOException
	{

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// check~!!!
		// ������ ������ �ʱ�ȭ ��ġ~!!!
		
		int n, s, i;
		
		//-- n : ����� �Է°��� ��Ƶ� ����
		//   s : ������ ���� ����� ��Ƴ� ����
		//   i : 1 ���� 1�� ������� �Է°����� �����ϰ� �� ����

		char ch;
		//-- ���μ����� ��� �������� ������ ���θ� ��Ƶ� ����
		
		while (true)
		{
			// ���� �ݺ�(���� ����)

			do
			{
				System.out.print("\n������ ���� �Է�: ");
				n = Integer.parseInt(br.readLine());
			

			}
			while (n<1 || n>100);

			// �׽�Ʈ(Ȯ��)
			System.out.println("��ȿ�� ���� �Է� �Ϸ�~!!!");
			
			// ������ ���� �ʱ�ȭ ��ġ check~!!!
			s =0;

			for (i=1; i<=n; i++)
			{
				s += i;												//-- ������ ����
			}

			System.out.printf(">> 1 ~ %d ������ �� : %d\n",n,s);

			System.out.print("����Ͻðڽ��ϱ�(Y/N)? : ");			//-- y, Y�� ������ ��. �������� �Է��ϸ� ��� X
			ch= (char)System.in.read();
			//-- ������� ������ ���� ����(�ǻ�ǥ��)

			// �׸��ҷ� -> ��������
			if (ch!='y' && ch!='Y')									//-- y �Ǵ� Y �Է��� �� �¾�?
			{
				// �ݺ����� ���߰� �������� �� �ִ� �ڵ� �ۼ� �ʿ�
				//-- ��, ���� ���� ���� ǥ���� �ߴٸ�
				//   �׵��� �����ߴ� �ݺ����� ���߰� ���������� �Ѵ�.
				break;
				//-- �����. + (�׸��� ����������.) check~!!!
			

			}//end if

			// ���Ͱ�(\r\n) ó��
			System.in.skip(2);										//-- �Է�ĭ�� �����ִ� ���� �о��


		}//end while(true)



		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n=0;
		int num;
		int sum=0;
		char ans;
		
		
		do
		{
			System.out.print("������ ���� �Է� : ");
			n=Integer.parseInt(br.readLine());
			sum=0;

			if (n>=1 && n<=100)
			{
				for (num=0; num<=n ;num++ )
				{
					sum += num;
				}
				
				System.out.printf(">> 1 ~ %d ������ �� : %d\n",n,sum);
				
				System.out.print("����Ͻðڽ��ϱ�(Y/N)? : ");
				ans = (char)System.in.read();
				System.in.skip(2);

				if (ans != 'y' && ans != 'Y')
				{
					break;
				}
				System.out.println();

			}
			
		}
		while (n>=1 && n<=100);
		*/
	}
}

// ���� ���

/*
	
������ ���� �Է� : 40
>> 1 ~ 40 ������ �� : 820
����Ͻðڽ��ϱ�(Y/N)? : Y

������ ���� �Է� : 20
>> 1 ~ 20 ������ �� : 210
����Ͻðڽ��ϱ�(Y/N)? : y

������ ���� �Է� : 100
>> 1 ~ 100 ������ �� : 5050
����Ͻðڽ��ϱ�(Y/N)? : n
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .



������ ���� �Է� : -49
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .



������ ���� �Է� : 10
>> 1 ~ 10 ������ �� : 55
����Ͻðڽ��ϱ�(Y/N)? : N
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .



*/