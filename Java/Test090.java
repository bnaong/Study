/*========================
 ���� �迭 ����
 - �迭�� �迭
==========================*/

// �迭�� �迭(������ �迭)�� Ȱ���Ͽ�
// ������ ���� �����͸� ��ҷ� ���ϴ� �迭�� �����ϰ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
/*
  E  J  O  T  Y
  D  I  N  S  X
  C  H  M  R  W
  B  G  L  Q  V
  A  F  K  P  U

00 01 02 03 04
10 11 12 13 14
20 21 22 23 24
30 31 32 33 34
40 41 42 43 44
*/


public class Test090
{
	public static void main(String[] args)
	{

		
		// �迭�� �迭 ���� �� �޸� �Ҵ�
		char arr[][] = new char[5][5];
		//int n=65;
		char start = 'A';					// 65

		// �迭 ����
		for (int i=0; i<5; i++)				// ��~~~ i -> 0 1 2 3 4
		{
			for (int j=4; j>=0; j--)
			{
				arr[j][i] = start++;
				
			}

		}


		/*=======���� Ǭ ���==========
		for (int i=0; i<5; i++)
		{
			for (int j=4; j>=0; j--)
			{
				arr[j][i] = (char)n;
				n++;
			}
		}
		=============================*/

		
		// �迭 ��ü ��� ���
		for (int i=0; i<arr.length; i++)
		{
			for (int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%3c", arr[i][j]);
			}
			System.out.println();
		}



	}
}

// ���� ���

/*

  E  J  O  T  Y
  D  I  N  S  X
  C  H  M  R  W
  B  G  L  Q  V
  A  F  K  P  U
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

*/