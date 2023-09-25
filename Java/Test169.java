/*================================
 ���� �÷���(Collection) ����
 ================================*/

/*
�� Set -> HashSet, TreeSet, ...
 	- ���� �ǹ� ����
	- �ߺ� ������� �ʴ� ����(�⺻)

�� TreeSet<E> Ŭ����

	java.util.TreeSet<E> Ŭ������
	Set �������̽��� ����� SortedSet �������̽��� ������ Ŭ������
	(���ı���� ���Ե� Set -> ���󵵰� ��������. ���ı�ɿ� ���ϰ� ���� �߻��Ͽ� ������ �������Ƿ�)
	�����͸� �߰��ϸ� �����͵��� �ڵ����� �������� ������ �ȴ�.
*/

// VO  - Value Object
// DTO - Data Transfer Object
// DAO - Data Access Object

// DTO + DA ����
// VO + DAO ����
// VO�� DTO�� ���� �������� ������, ������ ������Ʈ�� �����ϴ� ��쵵 �ִ�.

import java.util.TreeSet;
import java.util.Iterator;
import java.util.Comparator;

class GradeVO
{
	// �ֿ� �Ӽ� ����
	private String hak;			//-- �й�
	private String name;		//-- �̸�
	private int kor, eng, mat;  //-- ����, ����, ���� ����

	// ����� ���� ������
	GradeVO(String hak, String name, int kor, int eng, int mat)
	{
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	// �̿� ���� ��� default ������ �ڵ� ���Ե��� ����~!!!

	// ����� ���� ������ -> �Ű����� ���� ������(default ������ ����)
	GradeVO()
	{
		// ������ ���ο��� �� �ٸ� ������ ȣ��
		//GradeVO("","", 0, 0, 0);
		//
		this("","", 0, 0, 0);
	}

	// getter / setter ����
	public void setHak(String hak)
	{
		this.hak = hak;
	}
	
	public String getHak()
	{
		return hak;
	}

	public void setName(String name)
	{
		this.name = name;
		
	}

	public String getName()
	{
		return name;
	}

	public void setKor(int kor)
	{
		this.kor = kor;
	}

	public int getKor()
	{
		return kor;
	}

	public void setEng(int eng)
	{
		this.eng = eng;
	}
	
	public int getEng()
	{
		return eng;
	}

	public void setMat(int mat)
	{
		this.mat = mat;
	}

	public int getMat()
	{
		return mat;
	}

	// �߰� �޼ҵ� ����(���� ����)
	public int getTot()
	{
		//return kor + eng + mat;
		return this.kor + this.eng + this.mat;
	}
}
//-- ���ϳĸ�.. ���������� ũ��񱳸� �� �� ���� �޼ҵ尡 compare�̱� ������ �������ؼ� �޾� ���� �ȴ�.
//-- E : � ������Ʈ�� �����ϰ� �Ǹ�~, T : � Ÿ���� ��� �Ǹ�~
// Ŭ���� ������ �� : �ν��Ͻ� ������ �� <>�ȿ� Ÿ���� ������ �����ض�~
class MyComparator<T> implements Comparator<T>	
{
	// �� �޼ҵ� ������
	@Override
	public int compare(T o1, T o2)
	{
		GradeVO s1 = (GradeVO)o1;
		GradeVO s2 = (GradeVO)o2;

		// �й� ����(��������)
		//return Integer.parseInt(s1.getHak()) - Integer.parseInt(s2.getHak());
		// return Integer.parseInt("2308113") - Integer.parseInt("2308116");
		// return 2308113 - 2308116;
		// return -3;
		// -> o2 �� �� ū ������ �� ��� ����~!!!

		// ... return 5;
		// -> o1 �� �� ū ������ �� ��� ����~!!

		// ... return 0;
		// -> o1 �� o2�� ���� ������ �� ��� ����~!!!

		// �й� ����(��������)
		//return Integer.parseInt(s2.getHak()) - Integer.parseInt(s1.getHak());
		///return s2.getHak().compareTo(s1.getHak());

		// ���� ����(��������)
		//return s1.getTot() - s2.getTot();
		return Integer.valueOf(s1.getTot()).compareTo(Integer.valueOf(s2.getTot()));

		// ���� ����(��������)
		//return s2.getTot() - s1.getTot();

		// �̸� ����(��������)
		//return s1.getName().compareTo(s2.getName());

		// �̸� ����(��������)
		//return s2.getName().compareTo(s1.getName());


	}

}










public class Test169
{
	public static void main(String[] args)
	{
		// TreeSet �ڷᱸ�� ����
		TreeSet<String> set = new TreeSet<String>();

		// TreeSet �ڷᱸ�� set �� ��� �߰� -> add();
		set.add("¯���¸�����");
		set.add("������ũ");
		set.add("���ǽ�");
		set.add("�޺�õ��");
		set.add("�̴��߻�");
		set.add("�����̸���");
		set.add("����������");		// �߰��ð���
		set.add("��Ʋ¯");
		set.add("������");

		// Iterator �� Ȱ���� Set ��� ��ü ���
		Iterator<String> it = set.iterator();
		
		while (it.hasNext())
		{
			String s = it.next();
			System.out.print(s + " ");
		}
		System.out.println();
		//--==>> �����̸��� �޺�õ�� ������ ��Ʋ¯ ���������� ������ũ ���ǽ� �̴��߻� ¯���¸�����
		//-- ��Ҹ� ���ڿ��� ������ ���
		//   �����ټ� -> �������� ����

		// TreeSet �ڷᱸ�� ����
		//TreeSet<GradeVO> set2 = new TreeSet<GradeVO>();
		
		TreeSet<GradeVO> set2 = new TreeSet<GradeVO>(new MyComparator<GradeVO>());

		// TreeSet �ڷᱸ�� set2�� ��� �߰�
		set2.add(new GradeVO("2308113", "������", 90, 80, 70));
		set2.add(new GradeVO("2308116", "������", 91, 81, 81));
		set2.add(new GradeVO("2308120", "������", 88, 78, 68));
		set2.add(new GradeVO("2308103", "��ٽ�", 70, 95, 91));
		set2.add(new GradeVO("2308132", "������", 99, 82, 79));

		// Iterator �� Ȱ���� set2 ��� ��ü ���
		/*
		Iterator<GradeVO> it2 = set2.iterator();
		
		while (it2.hasNext())
		{		
			System.out.print(it2.next() + " ");
		}
		System.out.println();
		//--==>> ���� �߻�(��Ÿ�� ����)
		//		 java.lang.ClassCastException:
		//		 GradeVO cannot be cast to java.lang.Comparable
		// TreeSet�� ���ڿ��鳢�� ���ϴ� ������ ���������� ���� �Ǿ��ֱ� ������
		// �ڷ���� ũ��񱳰� �Ǿ�� ���������� �ݳ��� �ϰ� ���� ���µ�, ��� ó���� ����������
		// �׳��� �� �� ����.
		//
		*/


		// �� My Comparator Ŭ������ �����Ͽ�
		//    compare() �޼ҵ带 ������ �� �� �ٽ� ����

		/*
		Iterator<GradeVO> it2 = set2.iterator();

		while (it2.hasNext())
		{		
			System.out.print(it2.next() + " ");
		}
		System.out.println();
		*/

		// �� ��ü ��ü�� ���� ����ϴ� ���� �ƴ϶�
		//    ��ü�� ���� �ִ� �Ӽ��� �����Ͽ� ����� �� �ֵ��� ó��
		Iterator<GradeVO> it2 = set2.iterator();
		while (it2.hasNext())
		{
			// ���� : System.out.print(it2.next().getName() + " " + it2.next().getHak()); �� ���� �����ϸ�, 0��° �л��� �̸�, 1��° �л��� �й��� ������ �ȴ�.
			GradeVO vo = it2.next();
			System.out.println(vo.getHak() + " " + vo.getName() + " " + vo.getKor() + " " + vo.getEng() + " " + vo.getMat() + " " + vo.getTot());
		}

		

	}
}