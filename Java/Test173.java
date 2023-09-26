/*=====================================
 ���� �ڹ��� �⺻ �����(I/O) ����
 - OutputStream �ǽ�
 ====================================*/

import java.io.IOException;
import java.io.OutputStream;

public class Test173
{
	public static void main(String[] args) throws IOException
	{
		// �� ��System.in�� : �ڹ��� ǥ�� �Է� ��Ʈ��(��ü)
		//    ��System.out��: �ڹ��� ǥ�� ��� ��Ʈ��(��ü)
		OutputStream out = System.out;


		// �迭 ����
		byte[] ch = new byte[3];

		ch[0] = 65;		// A
		ch[1] = 97;		// a
		ch[2] = 122;	// z
		
		
		/*
		out.write(ch[0]);	// 65
		out.write(97);
		out.write(122);
		*/
		

		out.write(ch);		//-- ������ ������ ������(����)�� ��Ʈ��(���ٱ�)�� ���

		out.flush();		//-- ��ϵ� ��Ʈ���� ��������(�о��) ����� ����
							//   ������ BufferedReader�� Ȱ������ �ʰ� �ִ� ��Ȳ�̱� ������
							//   ������ ������ �ڵ�.
							//   (BufferedReader �Ǿ��ִ� ��Ʈ��(stream)�� ��� ���� �Ұ�
		
		out.close();		// .close() => �� ��ü�� ���ҽ��� �ݳ��ؼ� ���� ���ҽ��� ���� �ʰڴٴ� �ǹ�
							//  (out ��Ʈ����(���ֱ� ����������) �ᰡ���� ��Ȳ

		System.out.println("�������� �ŷڸ� ���� �ִ� ����");
		//-- ��out.close()���� �ۼ��� ���� ��µ��� �ʴ� ����.
		//    ��µǴ� ��Ʈ��(���ٱ�)�� �ݾұ� ������...


	}
}