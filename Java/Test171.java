/*================================
 ���� �÷���(Collection) ����
 ================================*/

// Map -> Hashtable, HashMap

/*
�� java.util.Map �������̽�
   Ű(key)�� ��(valu)�� ����(mapping)�ϸ�
   ������ Ű�� ����� �� ����, �����ؾ� �ϸ�,
   �� Ű�� �� ���� ������ �����ؾ� �Ѵ�.
   ��, �ϳ��� Ű�� �����ϴ� �ϳ��� ���� ���� �����̴�.
*/

/*
�� HashMap<K, V> Ŭ����

   - HashMap Ŭ������ Hashtable Ŭ������ ����������
     Map �������̽����� ��ӹ޾� �ֿ� ����� ������
	 Synchronization �� ���� ������ ���ü� ������ ���ٸ�
	 (��, ��Ƽ ������ ���α׷��� �ƴ� �����)
	 HashMap �� ����ϴ� ���� ������ ����ų �� �ִ�.
   - ����, HashMap�� Hashtable �� �޸� null �� ����Ѵ�.

*/
import java.util.HashMap;
import java.util.Map;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test171
{
	public static void main(String[] args) throws IOException
	{
		// HashMap �ڷᱸ�� ����
		//HashMap<String, String> map = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();

		// map �̶�� HashMap �ڷᱸ���� ��� �߰�
		// -> put(); �޼ҵ� ���
		map.put("��ȭ", "�Ź���");
		map.put("���", "����");
		map.put("��ȭ", "������ũ");
		map.put("�Ҽ�", "�������ǿ½�");
		
		// �׽�Ʈ(Ȯ��) -> ���� Ȯ��
		System.out.print(map);
		//--==>> {�Ҽ�=�������ǿ½�, ���=����, ��ȭ=�Ź���, ��ȭ=������ũ}
		// ������ ���� ���� Ȯ��
		// ������ ��� �ݳ� ������ �߰� ������ ���� ����
		System.out.println();

		// �� null ���� ó��
		map.put(null, null);		//-- key�� value �� ��� null
		System.out.print(map);
		//--==>> {�Ҽ�=�������ǿ½�, null=null, ���=����, ��ȭ=�Ź���, ��ȭ=������ũ}
		System.out.println();

		map.put("��ȭ", null);		//-- value �� null
		System.out.print(map);
		//--==>> {�Ҽ�=�������ǿ½�, null=null, ���=����, ��ȭ=�Ź���, ��ȭ=null, ��ȭ=������ũ}
		System.out.println();

		map.put(null, "�𳪸���");	//-- key �� null
		System.out.print(map);
		//--==>> {�Ҽ�=�������ǿ½�, null=�𳪸���, ���=����, ��ȭ=�Ź���, ��ȭ=null, ��ȭ=������ũ}��
		System.out.println();
		// key�� �ߺ� ������� ������, null �� �ϳ��� key�� value�� ����

		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("ī�װ� Ÿ��Ʋ �Է�(�ĸ� ����) : ");
		String[] temp;

		for (String str; ((str = br.readLine()) != null); )
		{
			temp = str.split(",");
			if (temp.length<2)
			{
				System.out.print("ī�װ�, Ÿ��Ʋ �Է�(�ĸ� ����) : ");
				continue;
			}

			map.put(temp[0].trim(), temp[1].trim());
			System.out.println(map);
		}
		//--==>> ī�װ� Ÿ��Ʋ �Է�(�ĸ� ����) : �Ҽ�,�����
		//	{�Ҽ�=�����, null=�𳪸���, ���=����, ��ȭ=�Ź���, ��ȭ=null, ��ȭ=������ũ}
		//	���,���ϰ�
		//	{�Ҽ�=�����, null=�𳪸���, ���=���ϰ�, ��ȭ=�Ź���, ��ȭ=null, ��ȭ=������ũ}
		//	��ȭ,��
		//	{�Ҽ�=�����, null=�𳪸���, ���=���ϰ�, ��ȭ=��, ��ȭ=null, ��ȭ=������ũ}

		

	}
}