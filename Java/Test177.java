/*===============================================
 ���� ��ü ����ȭ(Object Serialization) ����
 ===============================================*/

/*
�� ��ü ����ȭ(Object Serialization)��

	�޸𸮿� ������ Ŭ���� ��ü�� ��� ������ ���� ���¸�
	�״�� �����ؼ� ���Ͽ� �����ϰų�
	��Ʈ��ũ�� ���� ������ �� �ִ� �������
	��� ������ ���� �����Ѵٰų�
	�ٸ� ��Ʈ��ũ�� �ִ� ȣ��Ʈ�� ���� ���� ��� ����ϰ� �ȴ�.

	��, ��ü ����ȭ�� ���빰�� ����Ʈ ������ ��ȯ�Ͽ�
	���� �Ǵ� ��Ʈ��ũ�� ���� �ۼ���(��Ʈ��)�� �����ϰ�
	������ִ� ������ �� ��, ��ü�� ��� ������ �޸𸮸����� ������ ���� ���Ѵ�.

	����, �޼ҵ�� �����ڴ� ��ü ����ȭ�� ��󿡼� ���ܵȴ�.

�� ��ü ����ȭ�� ����

	��ü ��ü�� ������ ����� ���Ŀ� ���ֹ��� �ʰ�
	��ü�� ���Ͽ� ���������ν� ���Ӽ��� ������ �� ������
	��ü ��ü�� ��Ʈ��ũ�� ���� �ս��� ��ȯ(���� �� ����)�� �� �ְ� �ȴ�.

	��ü ����ȭ�� �ڹ� 1.1 ���Ŀ� ���ԵǾ��µ�
	�� ������ RMI �� Bean �����̾���.
	RMI �� ���� ��ü ����� �����ؾ� �ϱ� ������
	��ü�� �״��(Ư�� ���¸� ������ ä��) �̵��� �� �־�� �Ѵ�.
	���� �̸� �����ϱ� ���ؼ��� ��ü ����ȭ�� �ʼ����̾���.

	����, Bean �� ����� ���¿� ���� ������ ���� �� ��,
	�� ��ü ����ȭ�� ����ϸ� ���ϰ� ��ü ���¸� ������ �� �ִ�.

	�� RMI(Remote Method Invocation)
	   ���� �ٸ� ���� �����ġ�� �����ϴ� �Լ���
	   ȣ���ϰ� �����ϴ� ����� ����Ѵ�.
	   ���� �ٸ� ��� ������ ��ġ�� ������ ���� ��ü�� ����
	   ��� ������ �����ϴ� �������� �����ϸ� ���ڴ�.


	 �� Bean(��, �ڹ� ��)
	    C/S(Client, Server) ������ �𵨿��� ������ ������ �ش��ϸ�,
		���� ������ ����Ʈ���� ��ü�� ���� �� �ְ� �ϴ� ������Ʈ ���.
		�ۼ��� ��ü�� ������ �����ϸ� ������Ʈ�� ���� ���Խ�ų �� �ֵ��� �Ѵ�.
		Ŭ���̾�Ʈ���� ���̶�� ���α׷� ������Ʈ�� �й��ϴ� ������� ó��.
		// �Ӽ��� �����ϴ� Ŭ����, DTO�� VO



�� Serialization �������̽�

	��ü ����ȭ�� �ϱ� ���� ���� ��ü ����ȭ�� �����ϵ���
	java.io.Serializable �������̽��� ������ �־�� �Ѵ�.
	�� �������̽��� ��ü ����ȭ�� �����Ǿ�� �Ѵٴ� �����
	JVM �� �˷��ִ� ������ �����Ѵ�.(Implement�� �ϸ� ��ü����ȭ��
	�ʿ��ϴٴ� ���� ������)
	����, Serializable �������̽���
	�ٸ� �������̽��� �޸� �����ؾ� �� �޼ҵ尡 ���� ������
	���� ���� ���ָ� �ȴ�.

	����)
	1.
	public class Ŭ������ implements Serialzable
	{
		...
	}

	2.
	Serializable �������̽��� ������ ��
	ObjectInputStream Ŭ������ ObjectOutputStream Ŭ������ �̿��Ͽ�
	��ü ������ ������� �����ϰ� �ȴ�.

	�� ��� ������ static ���� ����� ���(��, Ŭ���� ������ ���)
	   ��ü ����ȭ�� ��󿡼� ���ܵȴ�.

�� Object Stream(ObjectInputStream, ObjectOutputStream)

	java.io.ObjectInputStream Ŭ������
	java.io.ObjectOutputStream Ŭ������ ����
	���Ͽ� ����Ǿ� �ִ� ��ü�� ��Ʈ��ũ�� ���� ���޵� ��ü��
	����ȭ�� �����ϴ� ����� �����Ѵ�.
	��, java.io.Serializable �������̽���
	java.io.Serializable �������̽��� �������ִ� ��ü�� ���ؼ��� ����� �����ϴ�.
	��, Serializable �������̽��� Externalizable �������̽���
	������ ��ü������ ���(������Ʈ�� �аų� ���ų� �������ų�)�� �����ϴٴ� ���̴�.
	�� ��, readObject() �޼ҵ带 �̿��Ͽ� ��Ʈ�����κ��� ����ȭ�� ��ü�� ���� �� ������
	�̷��� ���� ��ü�� �迭, ���ڿ� �Ǵ� �� ��ü ��
	������ ��(Type)���� ĳ���� �� �־�� �Ѵ�.
	(readObject()�� �����ڷ����� Object�̹Ƿ� �ٿ�ĳ����)

*/

import java.io.File;
import java.util.Hashtable;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
//import java.util.Hashtable;
import java.util.Enumeration;

public class Test177
{
	public static void main(String[] args) throws Exception
	{
		// getProperty(); -> �ý������κ��� Property(�Ӽ�)�� ���ڿ������� ������ �޼ҵ�
		String appDir = System.getProperty("user.dir");
		//-- �ý��� �Ӽ����κ��� ���� ����ڰ� ������� ���丮 ���� ������

		// �׽�Ʈ(Ȯ��)
		System.out.println(appDir);
		//--==>> C:\JavaStudy
		
		// ���� ��ü ����
		File f0 = new File(appDir, "\\data\\test.ser");
		//-- appDir -> c:\JavaStudy
		//-- appDir ��ġ�� ��������(�߽�����) "\\data\\test.ser"�� �����ϰڴٴ� �ǹ�
		//-- ���������... ��c:\JavaStudy\data\test.ser�� ����

		// �׽�Ʈ(Ȯ��)
		//System.out.println(f0.getParentFile().exists());		// ��ΰ� �����ϴ°�?
		//--==>> false											// �������� ����
		// test.ser ������ ��������� �� ���丮 ��ΰ� �����Ǿ� ���� �ʴ�.

		// �� ��C:\JavaStudy�� ��ο� ��data�� ���丮 ����~!!!

		// ���� ���� �ٽ� �׽�Ʈ(Ȯ��)
		//System.out.println(f0.getParentFile().exists());
		//--==>> true
		// test.ser ������ ��������� �� ���丮 ��ΰ� �����Ǿ� �ִ�.

		// test.ser ������ ��������� �� ���丮 ��ΰ� �����Ǿ� ���� �ʴٸ�...
		if (!f0.getParentFile().exists())
		{
			// ���丮�� ����ڴ�.(�����ϰڴ�.)
			f0.getParentFile().mkdirs();
		}

		// Hashtable �ڷᱸ�� �ν��Ͻ� ����
		Hashtable<String, String> h1 = new Hashtable<String, String>();
		
		// ������ h1 �̶�� Hashtable �ڷᱸ���� ��� �߰�
		h1.put("2308112", "������");
		h1.put("2308103", "����ȯ");
		h1.put("2308115", "�ڰ���");
		h1.put("2308107", "�ڳ���");
		h1.put("2308136", "�ڹ���");

		// �׽�Ʈ(Ȯ��)
		//System.out.println(h1.get("2308107"));
		//--==>> �ڳ���
		
		// ���� ���� ��� ��Ʈ�� ����(�������� ����)
		FileOutputStream fos = new FileOutputStream(f0);
		//-- ���� ���� ��� ��Ʈ��(���ٱ�)��
		//   f0�̶�� ���� ��ü�� ���ڴ�.
		// InputStreamReader isr = new InputStreamReader(System.in);

		// ��ü ���� ��� ��Ʈ�� ����
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		//-- ��ü ���� ��� ��Ʈ��(���ٱ�)����
		//   fos ��� ���� ���� ��� ��Ʈ���� ���ΰڴ�.
		// BufferedReader br = new BufferedReader(isr);

		// ���� line 151 ~ 157 �� ������ ����
		// ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f0));

		// ���� line 163 �� ����� ���� ����
		// BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// �� ObjectOutputStream Ŭ������
		//    ��ü���� ����ϴ� ����� �����ϴ� Ŭ������
		//    ��½�Ʈ���� ����ϱ� ����
		//    ���������� ��ü ����ȭ�� �����ϰ� �ȴ�.
		//    �ڹ� �⺻ ������ �Ǵ� ��ü����
		//    ���Ͽ� �����ϰų� ��Ʈ��ũ�� ���� �����ϱ� ����
		//    ������ ��ü�� ����ȭ�ϴ� ����� �����ϴ� ���̴�.



		// ������ ��Ʈ���� ������ ��ü�� ���
		oos.writeObject(h1);
		// out.write(ch); �� ���� ������ ����

		// ��ü ���� ���ҽ� �ݳ�
		oos.close();
		//-- ObjectOutputStream ���ҽ� �ݳ�
		
		// ���� ���� ���ҽ� �ݳ�
		fos.close();
		//-- FileOutputStream ���ҽ� �ݳ�


		// (��ü�� ����ȭ�Ͽ� ���Ϸ�) �������� ��~!!!
		// -------------------------------------------------------------------------
		
		// (��ü�� ����ȭ�Ͽ� ������ ����) �о���̱� ����~!!!
		
		// f0 ���� ��ü�� �����Ѵٸ�....
		if (f0.exists())
		{
			// f0 ������ ���� �Է� ��Ʈ������ �о���̰�
			FileInputStream fis = new FileInputStream(f0);

			// fis ���� �Է½�Ʈ�����κ��� ��ü �Է� ��Ʈ��(ois, ObjectInputStream)�� ����
			ObjectInputStream ois = new ObjectInputStream(fis);

			// ��ü �Է� ��Ʈ��(ois, ObjectInputStream)���κ��� �о���� ��ü(Object)��
			// ĳ����(Hashtable) �Ͽ� h2 ��� �ڷᱸ���� ��Ƴ���
			//Object obj = ois.readObject();
			Hashtable h2 = (Hashtable)ois.readObject();

			ois.close();
			//-- ois, ObjectInputStream ���ҽ� �ݳ�

			fis.close();
			//-- fis, FileInputStream ���ҽ� �ݳ�

			//------------------------------------ ������� �����ϸ� �о���̴� �۾� ��!

			// �о���� h2 ��ü�� ���� Ȯ��

			String key;
			String value;


			// �� Hashtable�� Iterator ����� �� ����
			Enumeration e = h2.keys();

			while (e.hasMoreElements())
			{
				key = (String)e.nextElement();
				//-- Hashtable �ڷᱸ���� ������� key�� �о���̴� ����
				
				// �׽�Ʈ(Ȯ��)
				//System.out.println(key);
				//--==>> 2308136
				//		 2308115
				//		 2308107
				//		 2308112
				//		 2308103

				value = (String)h2.get(key);
				//-- Hashtable �ڷᱸ���� ������� key �� Ȱ���Ͽ� value �� ���� ����

				System.out.println(key + "->" + value);
				//--==>> 2308136->�ڹ���
				//		 2308115->�ڰ���
				//		 2308107->�ڳ���
				//		 2308112->������
				//		 2308103->����ȯ
			}
		}

	}
}