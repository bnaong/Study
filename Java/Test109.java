/*===================================
 ���� ����(Sort) �˰��� ����
===================================*/

// ���� ���� ����(Bubble Sort)

// �� �տ��� �� Selection Sort(Test107.java)�� Bubble Sort(Test108.java)�� ������ ����.
//	  (-> ���ɿ� ���� ���� �ٰ� : �ݺ����� ������ Ƚ��)
//    ������, ���� Bubble Sort�� ��� �������� ������ ����
//    �Ϲ� Bubble Sort �� Selection Sort �� ���� ������ ���� �� �ִ�.

// ���� ������ : 61 15 20 22 30
//				 15 61 20 22 30
//				 15 20 61 22 30
//				 15 20 22 61 30
//				 15 20 22 30 61 --> 1ȸ�� ���ҹ߻� -> true  -> ����ȸ�� ���� O
//								--> 2ȸ�� ���ҹ߻� -> false -> ����ȸ�� ���� X

//--==>> 1ȸ��.. 2ȸ�� ������ �غ��Ҵ���, 2ȸ������ ������ ���� �Ͼ�� �ʾƼ�
//       ���ʿ��� �߰� ������ ���ǹ��� ������ �Ǵ��Ͽ� �������� �ʴ´�.


public class Test109
{
	public static void main(String[] args)
	{
		int[] a = {10, 50, 20, 30, 40};
		/*
		10, 50, 20, 30, 40
		==  --

		10, 20, 50, 30, 40
		    ==  --		

		10, 20, 30, 50, 40
		        ==  --	

		10, 20, 30, 40, 50
		            ==  --	
		---------------------------- ��~ 1ȸ�� -> ���ҹ߻�O

		10, 20, 30, 40, 50
		==  --	

		10, 20, 30, 40, 50
		    ==  --	

		10, 20, 30, 40, 50
		        ==  --	
 		---------------------------- ��~ 2ȸ�� -> ���ҹ߻�X
		---------------------------- 3ȸ�� -> X
		---------------------------- 4ȸ�� -> X
		*/

		System.out.print("Source Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();
		
		boolean flag;
		int pass=0;

		do
		{
			flag = false;		//-- �̹� ȸ������ �ڸ��ٲ��� �߻����� ���� ���̴�.
			pass++;

			for (int i=0; i<a.length-pass; i++)
			{
				// �׽�Ʈ
				//System.out.println("��");

				if (a[i] > a[i+1]) // ��������
				{
					// �ڸ� �ٲ�
					a[i]=a[i]^a[i+1];
					a[i+1]=a[i+1]^a[i];
					a[i]=a[i]^a[i+1];

					flag = true;
					//-- ��, �ѹ��̶� ����(�ڸ��ٲ�)�� �߻��ϰ� �Ǹ�
					//   flag ������ true�� ����~!!!
				}
			}
		}
		while (flag);
		// flag ������ false ��� ���� ȸ���� ���������� �߻��ϴ� ���� ������ �Ͼ�� ���� ����
		// �� �̻��� �ݺ��� ������ ���ǹ��� ������ �Ǵ�~!!!


		System.out.print("Sorted Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();


		/*
		System.out.print("Source Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();
			
				
		boolean result = false;

		for (int i=1; i<a.length; i++)
		{
			for (int j=0; j<a.length-i; j++)
			{
				if (a[j]>a[j+1])
				{
					// �ڸ��ٲ�
					a[j]=a[j]^a[j+1];
					a[j+1]=a[j+1]^a[j];
					a[j]=a[j]^a[j+1];

					result = true;
				}
			}

			if (result == false)
				break;
			result = false;
		}

		System.out.print("Sorted Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();
		*/
	}
}

// ���� ���

/*
Source Data : 10 50 20 30 40
Sorted Data : 10 20 30 40 50
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/