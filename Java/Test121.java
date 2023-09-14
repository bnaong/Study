/*=============================
 ���� Ŭ���� ��� ����
 - �������̽�(Interface)
 =============================*/

// �� �ǽ� ����
//	  ���� ó�� ���α׷��� �����Ѵ�.
//	  ��, �������̽��� Ȱ���� �� �ֵ��� �Ѵ�.

// ���� ��)
// �ο� �� �Է�(1~10) : 11
// �ο� �� �Է�(1~10) : 0
// �ο� �� �Է�(1~10) : 2

// 1��° �л��� �й� �̸� �Է�(���� ����) : 2309123 ��ٽ�
// ���� ���� ���� ���� �Է�   (���� ����) : 90 100 85
// 1��° �л��� �й� �̸� �Է�(���� ����) : 2309125 �赿��
// ���� ���� ���� ���� �Է�   (���� ����) : 85 70 60

// 2309123 ��ٽ� 90 100 85    ����   ���
//				  ��  �� ��
// 2309125 �赿�� 85  70  60   ����   ���
//				  ��  ��  ��

// ����Ϸ��� �ƹ� Ű�� ��������...
// 90�� �̻� -> ��
// 80�� �̻� 90�� �̸� -> ��
// 70�� �̻� 80�� �̸� -> ��
// 60�� �̻� 70�� �̸� -> ��
// 60�� �̸� -> ��

// �Ӽ��� �����ϴ� Ŭ���� -> �ڷ��� Ȱ��

import java.util.Scanner;
import java.io.IOException;
class Record
{
	String hak, name;				//-- �й�, �̸�
	int kor, eng, mat;				//-- ����, ����, ���� ����
	int tot;						//-- ����
	double avg;						//-- ���
}

// �������̽�
interface Sungjuk
{
	public void set();				//-- �ο� ����
	public void input();			//-- ������ �Է�
	public void print();			//-- ��� ���
}

// ���� �ذ� �������� �����ؾ� �� Ŭ���� -> Sungjuk �������̽��� �����ϴ� Ŭ����
class SungjukImpl implements Sungjuk
{
	private int inwon;
	private Record[] rec;
	
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		do
		{
			System.out.print("�ο� �� �Է�(1~10) : ");
			inwon = sc.nextInt();
		}
		while (1>inwon || inwon>10);
		rec = new Record[inwon];
		
	}

	public void input()
	{
		Scanner sc = new Scanner(System.in);
		
		
		for (int i=0; i<inwon; i++)
		{
			rec[i] = new Record();
			System.out.printf("%d��° �л��� �й� �̸� �Է�(���� ����) : ",i+1);
			rec[i].hak = sc.next();
			rec[i].name = sc.next();

			System.out.print("���� ���� ���� ���� �Է�   (���� ����) : ");
			rec[i].kor = sc.nextInt();
			rec[i].eng = sc.nextInt();
			rec[i].mat = sc.nextInt();

			rec[i].tot = rec[i].kor + rec[i].eng + rec[i].mat;
			rec[i].avg = rec[i].tot / 3.0;
		}
			
	}

	public void print()
	{
		for (int i=0; i<inwon; i++)
		{			
			System.out.printf("%s %s %d  %d  %d  %d %f\n",rec[i].hak, rec[i].name, rec[i].kor, rec[i].eng, rec[i].mat, rec[i].tot, rec[i].avg);
			System.out.printf("              %s  %s %s\n",panjung(rec[i].kor),panjung(rec[i].eng),panjung(rec[i].mat));
			
		}
		
	}

	// ���������� ��޿� ���� ������ ������ �޼ҵ�
	private String panjung(int score)
	{
		if (score>=90)
		{
			return "��";
		}
		else if (score>=80)
		{
			return "��";
		}
		else if (score>=70)
		{
			return "��";
		}
		else if (score>=60)
		{
			return "��";
		}
		else
		{
			return "��";
		}
	
	}
}


// main() �޼ҵ带 �����ϴ� �ܺ��� �ٸ� Ŭ����
public class Test121
{
	public static void main(String[] args)
	{
		Sungjuk ob = new SungjukImpl();
		// ���� �ذ� �������� �ۼ��ؾ� �� ob ���� �� ��ü ����
		ob.set();
		ob.input();
		ob.print();

	}
}