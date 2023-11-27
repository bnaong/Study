/*====================
 	ScoreMain.java
=====================*/

/*
○ 성적 처리 프로그램 구현 → 데이터베이스 연동 → ScoreDAO, ScoreDTO 클래스 활용
 
	여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	총점, 평균을 연산하여 내용을 출력하는 프로그램을 구현한다.
	
실행 예)

1번째 학생 성적 입력(이름 국어 영어 수학) : 강혜성 80 75 60
2번째 학생 성적 입력(이름 국어 영어 수학) : 김동민 100 90 80
3번째 학생 성적 입력(이름 국어 영어 수학) : 이주형 80 85 80
4번째 학생 성적 입력(이름 국어 영어 수학) : .

-----------------------------------------------------
 번호   이름   국어   영어   수학   총점   평균
-----------------------------------------------------
  1	   강혜성   80     75     60    xxx    xx.x
  2    김동민  100     90     80    xxx    xx.x
  3	   이주형   80     85     80    xxx    xx.x
-----------------------------------------------------

*/

package com.test;

import java.util.Scanner;

import com.util.DBConn;

public class ScoreMain
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			ScoreDAO dao = new ScoreDAO();
			int count = dao.count();
			
			do
			{
				System.out.printf("%d번째 학생 성적 입력(이름 국어 영어 수학) : ", ++count);
				String name = sc.next();
				
				// 반복의 조건을 무너뜨리는 코드 구성
				if (name.equals("."))
					break;
				int kor = sc.nextInt();
				int eng = sc.nextInt();
				int mat = sc.nextInt();
				
				// ScoreDTO 객체 생성
				ScoreDTO dto = new ScoreDTO();
				
				// 속성값 구성
				dto.setName(name);
				dto.setKor(kor);
				dto.setEng(eng);
				dto.setMat(mat);
				
				// 데이터베이스에 데이터 입력하는 메소드 호출 → add()
				
				int result = dao.add(dto);
				
				
			} while (true);
			
			System.out.println();
			System.out.println("-----------------------------------------------------");
			System.out.println(" 번호   이름   국어   영어   수학   총점   평균      ");
			System.out.println("-----------------------------------------------------");
			// 전체 목록 가져와 출력
			for (ScoreDTO obj : dao.lists())
			{
				System.out.printf("%3s %6s %4d %6d %6d %6d %7.1f\n", obj.getSid(),obj.getName(), obj.getKor(), obj.getEng(), obj.getMat(), obj.getTot(), obj.getAvg());
			}
			System.out.println("-----------------------------------------------------");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				DBConn.close();
				System.out.println(">> 데이터베이스 연결 닫힘~!!!");
				System.out.println(">> 프로그램 종료됨~!!!");
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
	}
}

// 실행 결과
/*
1번째 학생 성적 입력(이름 국어 영어 수학) : 강혜성 80 75 60
2번째 학생 성적 입력(이름 국어 영어 수학) : 김동민 100 90 80
3번째 학생 성적 입력(이름 국어 영어 수학) : 이주형 80 85 80
4번째 학생 성적 입력(이름 국어 영어 수학) : .

-----------------------------------------------------
 번호   이름   국어   영어   수학   총점   평균      
-----------------------------------------------------
  1    강혜성   80     75     60    215    71.7
  2    김동민  100     90     80    270    90.0
  3    이주형   80     85     80    245    81.7
-----------------------------------------------------
>> 데이터베이스 연결 닫힘~!!!
>> 프로그램 종료됨~!!! 
*/





































