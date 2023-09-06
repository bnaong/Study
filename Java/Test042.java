/*======================================
���� ���� �帧�� ��Ʈ��(���) ����
- switch �� �ǽ�
======================================*/

// ����ڷκ��� ������ �� ������ �����ڸ� �Է¹޾�
// �ش� �������� ���� ó�� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, switch ���� Ȱ���Ͽ� ó���� �� �ֵ��� �ϸ�,
// ���� ����� ���ǻ� ���� ���·� ó���� �� �ֵ��� �Ѵ�.

// ���� ��)
// ù ��° ���� �Է� : 3
// �� ��° ���� �Է� : 17
// ������ �Է�[+ - * /] : -

// >> 3 - 17 = -14
// ����Ϸ��� �ƹ� Ű�� ��������...


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test042
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		

		/*
		// ��� ��
		int a, b, result;
		int op;

		System.out.print("ù ��° ���� �Է� : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		b = Integer.parseInt(br.readLine());
		
		System.out.print("������ �Է�[+ - * /] : ");
		op = (char)System.in.read();

		// + -> op=43, - -> op=45, * -> op=42, / -> op=47

		switch (op)
		{
		case 43 : result = a + b; break;
		case 45 : result = a - b; break;
		case 42 : result = a * b; break;
		case 47 : result = a / b; break;
		default: return;					//-- 1. ���� ��ȯ, ���� �ΰ�
											//-- 2. �޼ҵ� ���� �� main() �޼ҵ� ����� ���α׷� ����(main �޼ҵ�� ���۰� ���� �ǹ��ϹǷ�)
		}

		System.out.println();
		System.out.printf(">> %d %c %d = %d\n",a, op, b, result);
		*/




		/*
		// ��� ��
		int a, b, result;
		char op;

		System.out.print("ù ��° ���� �Է� : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("������ �Է�[+ - * /] : ");
		op = (char)System.in.read();

		switch (op)
		{
		case '+' : result = a + b; break;
		case '-' : result = a - b; break;
		case '*' : result = a * b; break;
		case '/' : result = a / b; break;
		default : return;
		
		}
		
		System.out.println();
		System.out.printf(">> %d %c %d = %d\n",a, op, b, result);
		*/



		
		// ��� ��
		int a, b, result;
		String op;

		System.out.print("ù ��° ���� �Է� : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("������ �Է�[+ - * /] : ");
		op = br.readLine();

		switch (op)
		{
		case "+" : result = a + b; break;
		case "-" : result = a - b; break;
		case "*" : result = a * b; break;
		case "/" : result = a / b; break;
		default : return;
		
		}
		
		System.out.println();
		System.out.printf(">> %d %s %d = %d\n",a, op, b, result);



		

		/* ���� Ǭ ���=========================================================
		int a, b;
		char op;
		System.out.print("ù ��° ���� �Է� : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		b = Integer.parseInt(br.readLine());
		
		System.out.print("������ �Է�[+ - * /] : ");
		op = (char)System.in.read();

		

		switch (op)
		{
		case '+' : System.out.printf(">> %d + %d = %d\n", a, b, a+b); break;
		case '-' : System.out.printf(">> %d - %d = %d\n", a, b, a-b); break;
		case '*' : System.out.printf(">> %d * %d = %d\n", a, b, a*b); break;
		case '/' : System.out.printf(">> %d / %d = %d\n", a, b, a/b); break;
		
		}
		=======================================================================*/

	}
}

// ������

/*
ù ��° ���� �Է� : 5
�� ��° ���� �Է� : 7
������ �Է�[+ - * /] : +
>> 5 + 7 = 12
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

ù ��° ���� �Է� : 4
�� ��° ���� �Է� : 2
������ �Է�[+ - * /] : *
>> 4 * 2 = 8
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

*/