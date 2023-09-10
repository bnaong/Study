
// 2. Sungjuk 클래스
//    - 인원수를 입력받아,
//      입력받은 인원 수 만큼 이름, 국어점수, 영어점수, 수학점수를 입력받고
//      총점과 평균을 산출하는 클래스로 설계할 것~!!!
//      - 속성 : 인원수, Record 타입의 배열
//	    - 기능 : 인원수 입력, 상세 데이터 입력, 총점 및 평균 연산, 결과 출력


import java.util.Scanner;
import java.io.IOException;
public class Sungjuk
{
	// 주요 속성 구성
	int inwon;								//-- 인원수
	Record[] rec;							//-- Record 배열(학생 한 명 당 Record 배열 방 한 개 활용)
											//	 Record 를 기반으로 생선된 객체만 담아낼 수 있는 배열
	String[] subTitle = {"국어 점수 : ", "영어 점수 : ", "수학 점수 : "};

	// 주요 기능 구성
	// ① 인원 수 입력
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("인원 수 입력(1~100) : ");
			inwon = sc.nextInt();
		}
		while (inwon<1 || inwon>100);
		
		// check~!!!
		// Record 클래스를 기반으로 생성된 객체(인스턴스)를 담을 수 있는
		// 배열방을 inwon 만큼 생성한 것 일 뿐
		// Record 클래스의 인스턴스를 생성한 것은 아니다.
		rec = new Record[inwon];
		
	}

	// ② 상세 데이터 입력 + ③ 총점 및 평균 연산
	public void input()
	{
		Scanner sc = new Scanner(System.in);

		// 인원 수 만큼 반복
		//for (int i=0; i<inwon; i++)
		for (int i=0; i<rec.length; i++)
		{
			// check~!!!
			// Record 클래스 기반의 인스턴스 생성
			//Record ob = new Record();
			//rec[i] = ob;
			rec[i] = new Record();

			System.out.printf("%d번째 학생의 이름 입력 : ",i+1);
			rec[i].name = sc.next();

			for (int j=0; j<subTitle.length; j++)
			{
				// 안내 메시지 출력
				System.out.print(subTitle[j]);
				rec[i].jumsu[j] = sc.nextInt();


				// 국어, 영어, 수학 점수 테이터를 반복적으로 입력받는 동안
				// 총점에 대한 누적 산출
				
				rec[i].tot += rec[i].jumsu[j];
			}
			System.out.println();

			// 평균 산출하기
			rec[i].avg = rec[i].tot / 3.0;
		

		}// end outer for
	}//end input

	// ④ 결과 출력
	public void print()
	{
		// 내부 석차 산출 메소드 호출
		ranking();

		// 학생 한 명 당 반복 출력 구문 구성
		//for (int i=0; i<inwon; i++)
		for (int i=0; i<rec.length; i++)
		{
			// 이름 출력
			System.out.printf("%5s", rec[i].name);

			// 성적(국어, 영어, 수학) 반복 출력
			for (int j=0; j<3; j++)
			{
				System.out.printf("%4d", rec[i].jumsu[j]);
			}

			// 총점, 평균 출력
			System.out.printf("%5d", rec[i].tot);
			System.out.printf("%8.2f", rec[i].avg);

			// 석차
			System.out.printf("%4d", rec[i].rank);

			System.out.println();				//-- 개행

		}


	}

	// + ⑤ 석차 산출
	//		- 산출 과정에서 연산에 필요한 데이터가 이미 존재하는 상황 -> 매개변수 넘겨줄 필요 없음
	//		- Record 배열의 rank 속성에 연산결과 대입 기능 수행 -> 반환 자료형 void
	//		- 클래스 내부에서 활용할 메소드로 정의 -> 접근제어 지시자 private
	private void ranking()
	{
		// 모든 학생들의 등수(석차, rank)를 1로 초기화
		for (int i=0; i<inwon; i++)
			rec[i].rank=1;
		
		// 등수 산출
		for (int i=0; i<inwon-1; i++)				// 웅 -> 비교기준 -> 0	  1   2	 3
		{
			for (int j=i+1; j<inwon; j++)			// 쑝 -> 비교대상 -> 1234 234 34 4
			{
				if (rec[i].avg < rec[j].avg)		// 비교기준의 평균이 비교대상의 평균보다 작다면
				{
					// 비교기준의 rank를 1만큼 증가
					rec[i].rank++;
				}
				else if (rec[i].avg > rec[j].avg)	// 비교대상의 평균이 비교기준의 평균보다 작다면
				{
					// 비교대상의 rank를 1만큼 증가
					rec[j].rank++;
				}

			}

		}

	}































	/*=====================================================================================================================================
	int n;

	Record[] input() throws IOException
	{	
		
		Scanner sc = new Scanner(System.in);
		Record rc = new Record();

		
		do
		{
			System.out.print("인원 수 입력(1~100) : ");
			n = sc.nextInt();
			
		}
		while (n<1 || n>100);
		


		Record[] arr = new Record[n];
		for (int i=0; i<n; i++ )
		{	
			arr[i] = new Record();

			System.out.printf("%d번째 학생의 이름 입력 : ",i+1);
			arr[i].name = sc.next();
			System.out.print("국어 점수 : ");
			arr[i].jumsu[0] = sc.nextInt();
			System.out.print("영어 점수 : ");
			arr[i].jumsu[1] = sc.nextInt();
			System.out.print("수학 점수 : ");
			arr[i].jumsu[2] = sc.nextInt();
			arr[i].tot = arr[i].jumsu[0] + arr[i].jumsu[1] + arr[i].jumsu[2];
			arr[i].avg = (arr[i].jumsu[0] + arr[i].jumsu[1] + arr[i].jumsu[2])/3.0;
			System.out.println();
		
		}

		return arr;
	}




	void print(Record[] arr)
	{
		//Record rc = new Record();
		for (int i=0; i<n; i++)
		{
			System.out.printf("%s %d %d %d %d %.2f\n",arr[i].name, arr[i].jumsu[0], arr[i].jumsu[1], arr[i].jumsu[2], arr[i].tot, arr[i].avg);
		}
	}
	=====================================================================================================================================*/


}

