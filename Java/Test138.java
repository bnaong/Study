/*=============================================
 ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
 - �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
 - StringBuffer Ŭ����
 ============================================*/

/*
�� StringBuffer Ŭ����
	���ڿ��� ó���ϴ� Ŭ������ String Ŭ�������� ��������
	String Ŭ������ ���� ���ڿ� �������� ������ �Ұ���������
	StringBuffer Ŭ������ ���ڿ��� ����� �� ���� ���ڿ��� ���� �ܰ迡�� ���� �� �� �ִ�.
	(Buffer��� ������ �޷��ִ� String)

	��, StringBuffer ��ü�� �������� ���̸� �����Ƿ�
	��ü�� �����ϴ� �������� �̸� �� ũ�⳪ ���� �����ϰų�
	���� ������ ������ ũ�⸦ �ٲ� �� �ִ� ����� �����Ѵ�.

	����, JDK1.5 ���ĺ��ʹ� ���ڿ��� ó���ϴ� StringBuilder��� Ŭ������ �����Ѵ�. (�굵 Buffer�� ������ ����)
	StringBuilder Ŭ������ ����� StringBuffer Ŭ������ ����������
	���� ū �������� multi-thread unsafe(unsafety) ��� ���̴�. (���� ���ü��ְ� �۾����� �� �������� �ʴ�)
	������ : ���α׷� ���� ���� �⺻ �۾�����(�Ǵ� ����, �ϲ�). �ڱ� ���ϸ� �Ű澸(�׷��� �۾��� �����ϱ�)
	��Ƽ������(���߾�����) : ���α׷� ������ ��Ƽ�½�ŷ�� ������ ��. �����尡 ������
	StringBuffer�� ��Ƽ�����忡�� ���������� ���(����)�� ���� ������ ������(���̴�)

	��, Syncronization�� ���� ������ StringBuffer ���� ������, ���ü�((����ȭ) ������ ���ٸ�
	StringBuilder �� ����ϴ°��� ������ ����ų �� �ִ�.
*/

public class Test138
{
	public static void main(String[] args)
	{
		String str1 = new String("seoul");
		String str2 = new String("seoul");

		System.out.println(str1==str2);
		System.out.println(str1.equals(str2));
		//--==>> false
		//		 true

		StringBuffer sb1 = new StringBuffer("korea");
		StringBuffer sb2 = new StringBuffer("korea");

		System.out.println(sb1 == sb2);
		System.out.println(sb1.equals(sb2));
		// StringBuffer Ŭ���������� equals�� �������̵� ���� �ʾҴ�.
		//--==>> false
		//		 false

		System.out.println("--------------------------------------------------------------");

		System.out.println(sb1);				// StringBuffer��ü�� ����� ��
		//--==>> korea

		System.out.println(sb1.toString());		// String�� ����� ��
		//--==>> korea

		System.out.println(sb1.toString().equals(sb2.toString()));
		//--==>> true

		System.out.println("--------------------------------------------------------------");

		StringBuffer sb3 = new StringBuffer();
		//-- StringBuffer �⺻ ������ ȣ��(�ν��Ͻ� ���� ����)
		//	 �⺻������ �����Ǵ� ���� ũ��� ��16��

		// capacity()		=> �󸶸�ŭ ��Ƴ� �� �ִ���
		System.out.println("���� ũ�� : " + sb3.capacity());
		//--==>> ���� ũ�� : 16

		System.out.println(sb3);
		//--==>> ��
		
		/*
		String name = "�ڰ���";			//-- ���� ���� �� �ִ� �޸𸮴� �ҽ�(���ʿ��ϰ� �����ִ� �޸𸮡�)
		name += "�ڳ���";
		name += "�ڹ���";
		name += "�����";

		System.out.println(name);
		//--==>> �ڰ����ڳ����ڹ��������
		*/

		sb3.append("seoul");			// �ð������δ� ���� ������, �޸𸮸� �ξ� �� ���� �ȴ�.
		sb3.append("korea");
		sb3.append("�츮����");
		sb3.append("���ѹα�");

		System.out.println(sb3);
		//--==>> seoulkorea�츮������ѹα�
		System.out.println(sb3.toString());
		//--==>> seoulkorea�츮������ѹα�



		// ���� ũ�� �ٽ� Ȯ��
		System.out.println("���� ũ�� : " + sb3.capacity());
		//--==>> ���� ũ�� : 34									// ��ü�� ���°� �������� �ڵ����� �÷����� Ȯ�ΰ���


		/////////////////////////////////////////////////////////////////////////////////
		
		String temp1 = "java and oracle";
		System.out.println(temp1.toUpperCase());
		//--==>> JAVA AND ORACLE
		//-- �ҹ��ڸ� �빮�ڷ� ��ȯ�� ���� ��ȯ

		String temp2 = "JAVA AND ORACLE";
		System.out.println(temp2.toLowerCase());
		//--==>> java and oracle
		//-- �빮�ڸ� �ҹ��ڷ� ��ȯ�� ���� ��ȯ

		//System.out.println(sb3.toUpperCase());
		//System.out.println(sb3.toLowerCase());
		//--==>> ���� �߻�(������ ����)
		
		String temp3 = sb3.toString();
		System.out.println(temp3.toUpperCase());
		//--==>> SEOULKOREA�츮������ѹα�

		System.out.println(sb3.toString().toUpperCase());
		//--==>> SEOULKOREA�츮������ѹα�

		// �� ��� ���ڿ�(sb3 -> "seoulkorea�츮������ѹα�") ��
		//	  "seoul" ���ڿ� �տ� "�ѱ�" �̶�� ���ڿ� �߰�
		//	  ��, ���ѱ�seoulkorea�츮������ѹα������� ����
		
		//sb3.insert(index, �ش� index�� ������ ���ڿ�)							//���� sb3 �����
		sb3.insert(0, "�ѱ�");
		System.out.println("seoul �տ� ���ѱ��� �߰� : " + sb3);
		//--==>> seoul �տ� ���ѱ��� �߰� : �ѱ�seoulkorea�츮������ѹα�
		System.out.println("seoul �տ� ���ѱ��� �߰� : " + sb3.toString());
		//--==>> seoul �տ� ���ѱ��� �߰� : �ѱ�seoulkorea�츮������ѹα�


		// �� ��� ���ڿ�(sb3 -> �ѱ�seoulkorea�츮������ѹα�) ��
		//	  "korea" ���ڿ� �ڿ� "���" �̶�� ���ڿ� �߰�
		//	  ��, ��� ���ڿ��� �ε����� ������ ���� Ȯ������ �ʰ�...
		//	  ��, ���ѱ�seoulkorea����츮������ѹα���
		
		// �׽�Ʈ ��
		//System.out.println(sb3.insert(sb3.indexOf("korea") + 5, "���"));
		//System.out.println(sb3.insert(sb3.indexOf("korea") + "korea".length(), "���"));
		//--==>>�ѱ�seoulkorea����츮������ѹ̱�

		// ���� Ǯ�̹��
		sb3.insert(sb3.indexOf("��"), "���");
		System.out.println(sb3);
		//--==>>�ѱ�seoulkorea����츮������ѹα�
		

		// �� ��� ���ڿ�(sb3) ����
		//	  ��"�츮����"�� ���ڿ� ����

		// �׽�Ʈ ��
		//sb3.delete(14, 18);
		//14 : sb3.indexOf("�츮����"), 18 : sb3.indexOf("�츮����") + "�츮����".length()
		//System.out.println(sb3);
		//--==>> �ѱ�seoulkorea������ѹα�
		
		// ���� Ǯ�̹��
		//System.out.println(sb3.delete(sb3.indexOf("�츮����"),sb3.indexOf("��")));	//���� sb3 �����
		//--==>> �ѱ�seoulkorea������ѹα�

		sb3.delete(sb3.indexOf("�츮����"), sb3.indexOf("�츮����") + "�츮����".length());
		System.out.println(sb3);
		//--==>> �ѱ�seoulkorea������ѹα�


		// �� ��� ���ڿ�(sb3)����
		//	  korea ���� ��� ���ڿ� ����(korea ����)
		//	  �ѱ�seoulkorea������ѹα� -> �ѱ�seoul
		
		// �׽�Ʈ ��
		//sb3.delete(7,18);
		//System.out.println(sb3.toString());
		//--==>> �ѱ�seoul

		sb3.delete(sb3.indexOf("korea"),sb3.length());
		System.out.println(sb3);
		//--==>> �ѱ�seoul

		/////////////////////////////////////////////////////////////////////////////////

		// ���� ũ�� �ٽ� Ȯ��
		System.out.println("���� ũ�� : " + sb3.capacity());
		//--==>> ���� ũ�� : 34
		

		// ���ڿ�(sb3)�� ���� Ȯ��
		System.out.println("���ڿ��� ���� : " + sb3.length());
		//--==>> ���ڿ��� ���� : 7
		

		// ���� ũ�� ����
		// -> ���� ���ڿ��� ��Ƶ� �� �ִ� ������ ũ���...
		// trimToSize()
		sb3.trimToSize();

		// ���� ũ�� ���� ���� ���� ũ�� �ٽ� Ȯ��
		System.out.println("���� ũ�� : " + sb3.capacity());
		//--==>> ���� ũ�� : 7

		
	}
}