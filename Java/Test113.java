/*=========================
 ���� Ŭ���� ��� ����
 - ���(Inheritance)
 =========================*/

 // ������ ���� ���α׷��� �����Ѵ�.
 // ��, ����� ������ �����Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.

 // ���� ��)
 // ������ �� ���� �Է�(���� ����) : 20 10
 // ������ �Է�(+ - * /) : -
 // >> 20 - 10 = 10
 // ����Ϸ��� �ƹ� Ű�� ��������...

//import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class Aclass
{
	protected int x, y;
	protected char op;

	Aclass()
	{
		
	}

	void write(double result)
	{
		System.out.printf("\n>> %d %c %d = %.2f\n", x, op, y, result);
	}
}

// Aclass �� ��ӹ޴� Ŭ������ ����
class Bclass extends Aclass
{
	Bclass()
	{
		//super();
	}

	boolean input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("������ �� ���� �Է�(���� ����) : ");						// "20 10"
		String temp = br.readLine();

		// �� ���ڿ�.split("������");
		//    ���ڿ�.split("\\s");		//-- ������ --> ����
		//
		//    ex) "10 20 30 40 50" split("\\s");
		//		  -> ��ȯ -> {"10", "20", "30", "40", "50"}
		//
		//    ex) "010-1234-4567".split("-");
		//	      -> ��ȯ -> {"010", "1234", "4567"}

		String[] strArr = temp.split("\\s");						// "20 10" -> String[] strArr = {"20, 10"}

		if (strArr.length != 2)
			return false;
		//-- false �� ��ȯ�ϸ� input() �޼ҵ� ����
		//   �� ������ �����Ͽ� if ���� �����ϰ� �� ���...
		//   �Ʒ� �����ؾ� �� �ڵ尡 �����ִ���
		//   �����(->false)�� ��ȯ�ϸ� �޼ҵ�� ����ȴ�.

		x = Integer.parseInt(strArr[0]);
		y = Integer.parseInt(strArr[1]);
		// this.x = Integer.parseInt(strArr[0]);	// ���� ���� x�� ��ڴ�
		// super.x = Integer.parseInt(strArr[0]);	// �θ� ���� x�� ��ڴ�

		System.out.print("������ �Է�(+ - * /) : ");
		op = (char)System.in.read();

		if (op!='+' && op!='-' && op!='*' && op!='/')
		{
			return false;
		}
		
		return true;

	}// end Input()
	

	double calc()
	{
		double result = 0;

		switch (op)
		{
			case '+': result = x + y; break;
			case '-': result = x - y; break;
			case '*': result = x * y; break;
			case '/': result = (double)x / y;
		
		}

		return result;

	}// end calc()




	/*========================================================================
	double result;
	
	Bclass()
	{}

	public void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("������ �� ���� �Է�(���� ����) : ");
		x = sc.nextInt();
		y = sc.nextInt();
		
		System.out.print("������ �Է�(+ - * /) : ");
		op = (char)System.in.read();
	}

	public double cal()
	{
		switch (op)
		{
			case '+' : result = x + y; break;
			case '-' : result = x - y; break;
			case '*' : result = x * y; break;
			case '/' : result = x / (double)y; break;
			default : break;
		}
		return result;
	}
	=======================================================================*/

}

// main() �޼ҵ带 �����ϰ� �ִ� �ܺ��� �ٸ� Ŭ����
public class Test113
{
	public static void main(String[] args) throws IOException
	{	
		Bclass ob = new Bclass();					//-- �ڽ�Ŭ����(Bclass)�� �޸𸮿� �ۿø� �� �θ�(Aclass)�� �޸𸮿� �ۿø� �ǹ��� �ִ�.

		//ob.input();
		
		/*
		boolean resp = ob.input()
		if (resp!=true)
		{
			System.out.println("Error...");
			return;									//-- ���α׷� ����
		}
		*/
		
		/*
		boolean resp = ob.input()
		if (!resp)
		{
			System.out.println("Error...");
			return;									//-- ���α׷� ����
		}
		*/

		
		if (!ob.input())
		{
			System.out.println("Error...");
			return;									//-- ���α׷� ����
		}
		
		double result = ob.calc();

		ob.write(result);




		/*========================
		Bclass bc = new Bclass();
		bc.input();
		double a = bc.cal();
		bc.write(a);
		==========================*/
		
	}
}

// ���� ���

/*
������ �� ���� �Է�(���� ����) : 10 20
������ �Է�(+ - * /) : +

>> 10 + 20 = 30.00
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

������ �� ���� �Է�(���� ����) : 30
Error...
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

������ �� ���� �Է�(���� ����) : 45 22
������ �Է�(+ - * /) : /

>> 45 / 22 = 2.05
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

*/