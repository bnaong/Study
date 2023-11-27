/*===============================
	Test003.java
	- 데이터베이스 연결 실습
	- 데이터 입력 실습
=================================*/

package com.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.util.DBConn;

public class Test003
{
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		// 연결 객체 생성(구성)
		Connection conn = DBConn.getConnection();
		
		if (conn == null)
		{
			System.out.println("데이터베이스 연결 실패~!!!");
			System.exit(0);
			
		}
		//System.out.println("데이터베이스 연결 성공~!!!");
		
		try
		{
			// 작업 객체 구성(작업을 수행하기 위한 준비)
			Statement stmt = conn.createStatement();	//-- 연결선로에 파란바구니 매달기
			
			
			// ※ 데이터 입력 쿼리 실행 과정
			//    한 번 실행하면 다시 실행하지 못하는 상황이다.
			//    기본 키 제약조건이 설정되어 있으므로
			//    동일한 키 값이 중복될 수 있기 때문이다.
			
			// 쿼리문 준비
			String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(2, '고길동', '010-2222-2222')";
			//-- 주의① 쿼리문 끝에 『;』를 붙이지 않는다.
			//-- 주의② 자바에서 실행한 DML 구문은 내부적으로 자동 COMMIT 된다.
			//-- 주의③ 오라클에서 트랜잭션 처리(COMMIT,ROLLBACK)가 끝나지 않은 상태면
			//			데이터 액션 처리가 이루어지지 않는다.
			
			//----------------------- 여기까지 준비 끝!
			
			// stmt.executeUpdate();
			// stmt.executeQuery();
			
			// 쿼리문 전달(실행)
			int result = stmt.executeUpdate(sql);
			//-- 적용된 행의 갯수 반환
			
			if (result > 0)
			{
				System.out.println("데이터 입력 성공~!!!");
			}
			else {
				System.out.println("입력 실패~ ㅠ_ㅠ");
			}
					
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		DBConn.close();
		//-- 리소스 반납(연결 종료)
	}
}

// 실행 결과
/*
데이터 입력 성공~!!!
*/

//--==>> 다시 실행할 경우
// 에러 발생 (ORA-00001: unique constraint (SCOTT.MEMBER_SID_PK) violated)


















