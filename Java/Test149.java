/*============================================
 ■■■ 예외 처리(Excepiton Handling) ■■■
 ============================================*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test149
{
	private String[] data = new String[3];

	public void proc() //throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String str;
		int n=0;

		try
		{
			System.out.print("이름 입력(종료 : Ctrl+z) : ");
			while ((str=br.readLine()) != null)					
			{
				data[n++] = str;
				System.out.print("이름 입력(종료 : Ctrl+z) : ");
			}

			System.out.println("입력된 내용 .................");
			for (String s : data)
			{
				if (s !=null)
				{
					System.out.println(s);
				}
			}
			
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
			System.out.println("-> checked exception 에 대한 처리");
		}
		catch (ArrayIndexOutOfBoundsException e)
		{
			System.out.println("배열 인덱스 관련 예외 발생~!!!");
			System.out.println("e.getMessage() : " + e.getMessage());
			System.out.println("e.toString() : " + e.toString());
			System.out.println("printStackTrace................");
			e.printStackTrace();
		}

	}

	public static void main(String[] args)		// proc 메소드에서 던졌던 걸 잡아서 throws Exception하지 않아도 됨
	{
		Test149 ob = new Test149();
		ob.proc();		
	}
}
