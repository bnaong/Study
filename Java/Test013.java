/*==========================================
  ���� �ڹ� �⺻ ���α׷��� ���� 
===========================================*/


// �� ����
//		�ﰢ���� �غ��� ���̿� ���̸� ����ڷκ��� �Է¹޾�
//		�� �ﰢ���� ���̸� ���ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// �� �ﰢ�� ���� ���ϴ� ���α׷� ��
// - �ﰢ���� �غ� �Է� : 5
// - �ﰢ���� ���� �Է� : 3

// >> �غ��� 5, ���̰� 3�� �ﰢ���� ���� : xxx
// ����Ϸ��� �ƹ�Ű�� ��������...

// �� ���� �ν� �� �м�
// �ﰢ���� ���� = �غ� * ���� / 2
// ����ڷκ��� ������ �Է¹޾� ó�� -> BufferedReader Ȱ��
// BufferedReader �� ������ ���?? �� �� ���??
//                                 ------------



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test013
{
	public static void main(String[] args) throws IOException
	{
		/* ===================���� �ۼ��� Ǯ��==========================
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int a, b;
		double c;
		
		System.out.println("�� �ﰢ�� ���� ���ϴ� ���α׷� ��");
		System.out.printf("- �ﰢ���� �غ� �Է� : ");
		a = Integer.parseInt(br.readLine());

		System.out.printf("- �ﰢ���� ���� �Է� : ");
		b = Integer.parseInt(br.readLine());
		
		c = a * b / 2.0;

		System.out.println();
		System.out.printf(">> �غ��� %d, ���̰� %d�� �ﰢ���� ���� : %.2f%n", a, b, c);
		===================================================================*/


		// �ֿ� ���� ����

		//BufferedReader �ν��Ͻ� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// �غ�, ����
		int underLength, height;		//-- �غ�, ����
		double area;					//-- ����


		// ���� �� ó��
		// 1. ����ڿ��� �ȳ� �޽��� ���
		System.out.println("�� �ﰢ�� ���� ���ϴ� ���α׷� ��");
		//System.out.println("- �ﰢ���� �غ� �Է� : ");
		System.out.print("- �ﰢ���� �غ� �Է� : ");

		// 2. ����ڰ� �Է��� ������(���ڿ�)�� ���� ���·� ��ȯ�� ��
		//	  ���� underLength �� ��Ƴ���
		underLength = Integer.parseInt(br.readLine());
		
		// 3. �ٽ� ����ڿ��� �ȳ� �޽��� ���
		System.out.print("- �ﰢ���� ���� �Է� : ");

		// 4. ����ڰ� �Է��� ������(���ڿ�)�� ���� ���·� ��ȯ�� ��
		//	  ���� height �� ��Ƴ���
		height = Integer.parseInt(br.readLine());

		// 5. �ﰢ���� ���� ���ϴ� ���� ó��
		//	  �ﰢ���� ���� = �غ� * ���� / 2
		//area = underLength * height / 2;
		//		������		������	������
		//     -------------------   -----
		//           ������          ������ - > ���� ��� ����
		//                                      (��, ���� ���ϰ� �������� ����)
		area = underLength * height / 2.0;
		//		������		������	�Ǽ���  - > �Ǽ� ��� ����

		// �� �Ǽ� �ڷ����� ��������� ������ ��������
		//	  �Ǽ� ����� ������ �ʿ��� ��Ȳ�̴�.
		//    ������ 2�� �ƴ�, �Ǽ��� 2.0���� ������ ������ �����ϰ� �Ǹ�
		//    �� ������ �Ǽ� ������� ó���ȴ�.
		// area = (double)underLength * height / 2;
		// area = underLength * (double)height / 2;
		// area = (double)(underLength * height) / 2;
		// area = (double)(underLength * height / 2);	--(X, ���� �Ǽ������� �ٲٴ� ��)


		// ��� ���
		//System.out.println();			// println()�ȿ� �Ű������� ���� ������ ����
		//System.out.print();			//-- ���� �߻�(������ ����)

		System.out.printf("\n>> �غ��� %d, ���̰� %d�� �ﰢ���� ���� : %.2f\n", underLength, height, area);


	}
}

// ���� ���
/*
�� �ﰢ�� ���� ���ϴ� ���α׷� ��
- �ﰢ���� �غ� �Է� : 5
- �ﰢ���� ���� �Է� : 3

>> �غ��� 5, ���̰� 3�� �ﰢ���� ���� : 7.50
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/