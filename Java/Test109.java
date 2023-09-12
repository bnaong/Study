/*===================================
 ■■■ 정렬(Sort) 알고리즘 ■■■
===================================*/

// 향상된 버블 정렬(Bubble Sort)

// ※ 앞에서 본 Selection Sort(Test107.java)나 Bubble Sort(Test108.java)의 성능은 같다.
//	  (-> 성능에 대한 추정 근거 : 반복문을 수행한 횟수)
//    하지만, 향상된 Bubble Sort는 대상 데이터의 구조에 따라서
//    일반 Bubble Sort 나 Selection Sort 에 비해 성능이 좋을 수 있다.

// 원본 데이터 : 61 15 20 22 30
//				 15 61 20 22 30
//				 15 20 61 22 30
//				 15 20 22 61 30
//				 15 20 22 30 61 --> 1회전 스왑발생 -> true  -> 다음회전 진행 O
//								--> 2회전 스왑발생 -> false -> 다음회전 진행 X

//--==>> 1회전.. 2회전 수행을 해보았더니, 2회전에서 스왑이 전혀 일어나지 않아서
//       불필요한 추가 연산은 무의미한 것으로 판단하여 수행하지 않는다.


public class Test109
{
	public static void main(String[] args)
	{
		int[] a = {10, 50, 20, 30, 40};
		/*
		10, 50, 20, 30, 40
		==  --

		10, 20, 50, 30, 40
		    ==  --		

		10, 20, 30, 50, 40
		        ==  --	

		10, 20, 30, 40, 50
		            ==  --	
		---------------------------- 웅~ 1회전 -> 스왑발생O

		10, 20, 30, 40, 50
		==  --	

		10, 20, 30, 40, 50
		    ==  --	

		10, 20, 30, 40, 50
		        ==  --	
 		---------------------------- 웅~ 2회전 -> 스왑발생X
		---------------------------- 3회전 -> X
		---------------------------- 4회전 -> X
		*/

		System.out.print("Source Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();
		
		boolean flag;
		int pass=0;

		do
		{
			flag = false;		//-- 이번 회전에서 자리바꿈이 발생하지 않을 것이다.
			pass++;

			for (int i=0; i<a.length-pass; i++)
			{
				// 테스트
				//System.out.println("쑝");

				if (a[i] > a[i+1]) // 오름차순
				{
					// 자리 바꿈
					a[i]=a[i]^a[i+1];
					a[i+1]=a[i+1]^a[i];
					a[i]=a[i]^a[i+1];

					flag = true;
					//-- 단, 한번이라도 스왑(자리바꿈)이 발생하게 되면
					//   flag 변수는 true로 변경~!!!
				}
			}
		}
		while (flag);
		// flag 변수가 false 라는 것은 회전이 구분적으로 발생하는 동안 스왑이 일어나지 않은 경우로
		// 더 이상의 반복문 수행은 무의미한 것으로 판단~!!!


		System.out.print("Sorted Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();


		/*
		System.out.print("Source Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();
			
				
		boolean result = false;

		for (int i=1; i<a.length; i++)
		{
			for (int j=0; j<a.length-i; j++)
			{
				if (a[j]>a[j+1])
				{
					// 자리바꿈
					a[j]=a[j]^a[j+1];
					a[j+1]=a[j+1]^a[j];
					a[j]=a[j]^a[j+1];

					result = true;
				}
			}

			if (result == false)
				break;
			result = false;
		}

		System.out.print("Sorted Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();
		*/
	}
}

// 실행 결과

/*
Source Data : 10 50 20 30 40
Sorted Data : 10 20 30 40 50
계속하려면 아무 키나 누르십시오 . . .
*/