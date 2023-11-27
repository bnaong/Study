package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;
	
	public ScoreDAO()
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 기능 메소드
	public int add(ScoreDTO dto) throws SQLException
	{
		// 반환할 결과값을 담을 변수 선언
		int result = 0;
		
		// 작업 객체 선언
		Statement stmt = conn.createStatement();
		
		// 쿼리문 구성
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
		result = stmt.executeUpdate(sql);
		
		// 사용한 리소스 반납
		stmt.close();
		
		// 최종 결과값 반환
		return result;
		
	}
	
	// 전체 인원 수 확인 메소드
	public int count() throws SQLException
	{
		// 반환할 결과값을 담을 변수 선언
		int result = 0;
		
		// 작업 객체 선언
		Statement stmt = conn.createStatement();
		
		// 쿼리문 구성
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		// 사용한 리소스 반납
		stmt.close();
		
		// 최종 결과값 반환
		return result;
		
	}
	
	// 전체 리스트 조회 메소드
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		// 결과값으로 반환하게될 변수 선언 및 초기화
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 작업 객체 선언
		Statement stmt = conn.createStatement();
		
		// 쿼리문 구성
		String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("KOR") + rs.getInt("ENG") + rs.getInt("MAT"));
			dto.setAvg((rs.getInt("KOR") + rs.getInt("ENG") + rs.getInt("MAT"))/3.0);
			
			result.add(dto);
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종결과값 반환
		return result;
	}
	
	// 데이터베이스 연결 종료
	public void close()
	{
		DBConn.close();
	}

}
