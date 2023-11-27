/*=======================================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 클래스
=========================================*/

package com.test;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG)"
				+ " VALUES (EMPSEQ.NEXTVAL, '%s', '%s', '%s', (SELECT CITY_ID FROM TBL_CITY WHERE CITY_NAME = '%s')"
				+ ", '%s', (SELECT BUSEO_ID FROM TBL_BUSEO WHERE BUSEO_NAME = '%s')"
				+ ", (SELECT JIKWI_ID FROM TBL_JIKWI WHERE JIKWI_NAME = '%s'), %d , %d)"
				,dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName(), dto.getBasicPay()
				,dto.getSudang());
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
				
		return result;
	}
	
	// 지역 출력 담당 메소드
	public ArrayList<String> cityLists() throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT CITY_NAME FROM TBL_CITY";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result.add(rs.getString("CITY_NAME"));
		}
		
		rs.close();
		stmt.close();
		
		return result;
		
	}
	
	// 부서 출력 담당 메소드
	public ArrayList<String> buseoLists() throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT BUSEO_NAME FROM TBL_BUSEO";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result.add(rs.getString("BUSEO_NAME"));
		}
		
		rs.close();
		stmt.close();
		
		return result;
		
	}
	
	// 직위 출력 담당 메소드
	public ArrayList<String> jikwiLists() throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT JIKWI_NAME FROM TBL_JIKWI";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result.add(rs.getString("JIKWI_NAME"));
		}
		
		rs.close();
		stmt.close();
		
		return result;
		
	}
	
	// 최소 기본급 출력 담당 메소드
	public int minBasicPay(String jikwiName) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT MIN_BASICPAY FROM TBL_JIKWI WHERE JIKWI_NAME = '%s'", jikwiName);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next())
			result = rs.getInt("MIN_BASICPAY");
		
		rs.close();
		stmt.close();
		
		return result;
		
	}
	
	// 전체 리스트 출력 담당 메소드
	public ArrayList<MemberDTO> lists(int sel) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "";
		
		switch (sel)
		{
		case 1:
			// 1. 사번 정렬
			sql = "SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL FROM TBL_EMP E JOIN TBL_CITY C ON E.CITY_ID = C.CITY_ID JOIN TBL_BUSEO B ON E.BUSEO_ID = B.BUSEO_ID JOIN TBL_JIKWI J ON E.JIKWI_ID = J.JIKWI_ID ORDER BY EMP_ID";
			break;
			
		case 2:
			// 2. 이름 정렬
			sql = "SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL FROM TBL_EMP E JOIN TBL_CITY C ON E.CITY_ID = C.CITY_ID JOIN TBL_BUSEO B ON E.BUSEO_ID = B.BUSEO_ID JOIN TBL_JIKWI J ON E.JIKWI_ID = J.JIKWI_ID ORDER BY EMP_NAME";
			break;

		case 3:
			// 3. 부서 정렬
			sql = "SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL FROM TBL_EMP E JOIN TBL_CITY C ON E.CITY_ID = C.CITY_ID JOIN TBL_BUSEO B ON E.BUSEO_ID = B.BUSEO_ID JOIN TBL_JIKWI J ON E.JIKWI_ID = J.JIKWI_ID ORDER BY BUSEO_NAME";
			break;
			
		case 4:
			// 4. 직위 정렬
			sql = "SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL FROM TBL_EMP E JOIN TBL_CITY C ON E.CITY_ID = C.CITY_ID JOIN TBL_BUSEO B ON E.BUSEO_ID = B.BUSEO_ID JOIN TBL_JIKWI J ON E.JIKWI_ID = J.JIKWI_ID ORDER BY JIKWI_NAME";
			break;
		
		case 5:
			// 5. 급여 내림차순 정렬
			sql = "SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL FROM TBL_EMP E JOIN TBL_CITY C ON E.CITY_ID = C.CITY_ID JOIN TBL_BUSEO B ON E.BUSEO_ID = B.BUSEO_ID JOIN TBL_JIKWI J ON E.JIKWI_ID = J.JIKWI_ID ORDER BY BASICPAY+SUDANG DESC";
			break;

		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpId(rs.getString("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsadate(rs.getString("IBSADATE"));
			dto.setCityName(rs.getString("CITY_NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setSal(rs.getInt("SAL"));
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 사번 검색 담당 메소드
	public ArrayList<MemberDTO> idLists(String empId) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();

		String sql = String.format("SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL"
				+ " FROM TBL_EMP E JOIN TBL_CITY C"
				+ " ON E.CITY_ID = C.CITY_ID"
				+ " JOIN TBL_BUSEO B"
				+ " ON E.BUSEO_ID = B.BUSEO_ID"
				+ " JOIN TBL_JIKWI J"
				+ " ON E.JIKWI_ID = J.JIKWI_ID"
				+ " WHERE EMP_ID = %s", empId);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpId(rs.getString("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsadate(rs.getString("IBSADATE"));
			dto.setCityName(rs.getString("CITY_NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setSal(rs.getInt("SAL"));
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
		
	}
	
	// 이름 검색 담당 메소드
	public ArrayList<MemberDTO> nameLists(String empName) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL"
				+ " FROM TBL_EMP E JOIN TBL_CITY C"
				+ " ON E.CITY_ID = C.CITY_ID"
				+ " JOIN TBL_BUSEO B"
				+ " ON E.BUSEO_ID = B.BUSEO_ID"
				+ " JOIN TBL_JIKWI J"
				+ " ON E.JIKWI_ID = J.JIKWI_ID"
				+ " WHERE EMP_NAME = '%s'", empName);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpId(rs.getString("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsadate(rs.getString("IBSADATE"));
			dto.setCityName(rs.getString("CITY_NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setSal(rs.getInt("SAL"));
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;		
	}
	
	
	// 부서 검색 담당 메소드
	public ArrayList<MemberDTO> buseoLists(String buseoName) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL"
				+ " FROM TBL_EMP E JOIN TBL_CITY C"
				+ " ON E.CITY_ID = C.CITY_ID"
				+ " JOIN TBL_BUSEO B"
				+ " ON E.BUSEO_ID = B.BUSEO_ID"
				+ " JOIN TBL_JIKWI J"
				+ " ON E.JIKWI_ID = J.JIKWI_ID"
				+ " WHERE BUSEO_NAME = '%s'", buseoName);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpId(rs.getString("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsadate(rs.getString("IBSADATE"));
			dto.setCityName(rs.getString("CITY_NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setSal(rs.getInt("SAL"));
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;		
		
	}
	
	// 직위 검색 담당 메소드
	public ArrayList<MemberDTO> jikwiLists(String jikwiName) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE, C.CITY_NAME, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, E.BASICPAY, E.SUDANG, BASICPAY+SUDANG AS SAL"
				+ " FROM TBL_EMP E JOIN TBL_CITY C"
				+ " ON E.CITY_ID = C.CITY_ID"
				+ " JOIN TBL_BUSEO B"
				+ " ON E.BUSEO_ID = B.BUSEO_ID"
				+ " JOIN TBL_JIKWI J"
				+ " ON E.JIKWI_ID = J.JIKWI_ID"
				+ " WHERE JIKWI_NAME = '%s'", jikwiName);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpId(rs.getString("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsadate(rs.getString("IBSADATE"));
			dto.setCityName(rs.getString("CITY_NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setSal(rs.getInt("SAL"));
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;	
	}
	
	
	// 인원수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_EMP";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	// 데이터 수정 담당 메소드
	public int modify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("UPDATE TBL_EMP SET EMP_NAME = '%s', SSN = '%s'"
				+ ", IBSADATE = '%s', CITY_ID = (SELECT CITY_ID FROM TBL_CITY WHERE CITY_NAME = '%s')"
				+ ", TEL = '%s', BUSEO_ID = (SELECT BUSEO_ID FROM TBL_BUSEO WHERE BUSEO_NAME = '%s')"
				+ ", JIKWI_ID = (SELECT JIKWI_ID FROM TBL_JIKWI WHERE JIKWI_NAME = '%s'), BASICPAY = %d"
				+ ", SUDANG = %d"
				+ " WHERE EMP_ID = %s"
				, dto.getEmpName(), dto.getSsn(), dto.getIbsadate(), dto.getCityName(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
				, dto.getBasicPay(), dto.getSudang(), dto.getEmpId());
		
		result = stmt.executeUpdate(sql);
		
		System.out.println(result);
		
		stmt.close();
		
		return result;
		
	}
	
	// 데이터 삭제 담당 메소드
	public int remove(String empId) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("DELETE FROM TBL_EMP WHERE EMP_ID = %s", empId);
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
}










































