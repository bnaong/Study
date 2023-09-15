/*=============================================
 ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
 - �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
 - BigDecimal Ŭ����
 ============================================*/

import java.math.BigDecimal;

public class Test133
{
	public static void main(String[] args)
	{
		BigDecimal a = new BigDecimal("123456789.123456789");

		//movePointLeft()
		BigDecimal b = a.movePointLeft(3);						// �Ҽ����� �Ű�������ŭ �������� �̵���Ű�� ���
		System.out.println("ó�� ��� : " + b);
		//--==>> ó�� ��� : 123456.789123456789
		
		// ������ ����
		BigDecimal c = a.divide(b);
		System.out.println("ó�� ��� : " + c);
		//--==>> ó�� ��� : ó�� ��� : 1E+3

		BigDecimal d = a.divide(b, BigDecimal.ROUND_DOWN);		// �ݿø��� ���� �ʴ´�. -> ����
		System.out.println("ó�� ��� : " + d);
		//--==>> ó�� ��� : 1000.000000000

		// BigInteger ��ü�� ��ȯ
		System.out.println("ó�� ��� : " + a.toBigInteger());
		//--==>> ó�� ��� : 123456789

		
	}
}

// ���� ���

/*
ó�� ��� : 123456.789123456789
ó�� ��� : 1E+3
ó�� ��� : 1000.000000000
ó�� ��� : 123456789
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/