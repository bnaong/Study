/*======================
	DBConn.java
======================*/

// ※ 싱글톤(singleton) 디자인 패턴(어떤 프로그램을 만드려고 할 때 공식화된 패턴(코드레벨 : 알고리즘 / 계층구조(설계) : 디자인패턴))을 이용한 Database 연결 객체 생성 전용 클래스
//		-> DB 연결 과정이 부하가 매우 크기 때문에 한 번 연결된 객체를 계속 사용하는 것이 좋겠다..

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
// -> ojdbc 파일을 담아놔서 사용할 수 있음!

public class DBConn
{
	// 변수 선언(연결 객체)		--	static - 공유의 개념
	private static Connection dbConn;
	
	// 메소드 정의 -> 연결
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		// 한 번 연결된 객체를 계속 사용(즉, 연결되지 않은 경우에만 연결을 시도하겠다는 의미)
		// 기존에 만들어 놓은 연결객체가 존재하지 않을 경우에만... DB 연결 객체 생성
		if (dbConn == null)
		{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			//-- thin driver url format
			//-- 『localhost』는 오라클 서버의 ip 주소를 기재하는 부분, xe : sid
			//	  "jdbc:oracle:thin:@211.238.142.164:1521:xe"
			//	  "jdbc:oracle:thin:@127.0.0.1:1521:xe"				-- 자가진단 유틸리티(자신을 지칭할 때 사용)
			//	  『1521』는 오라클 SID(Express Editiond 의 SID 는 xe)
						
			String user = "scott";
			//-- 오라클 사용자 계정 이름
			
			String pwd = "tiger";
			//-- 오라클 사용자 계정 암호
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//-- OracleDriver 클래스에 대한 객체 생성(클래스 찾아줘~!!!)
			//-- forName : 이름으로 뭔가를 찾아줌(이런이름의 클래스를 찾아줘!)
			
			dbConn = DriverManager.getConnection(url, user, pwd);
			//-- 오라클 서버 실제 연결
			//   갖고 있는 인자값(매개변수)은 오라클주소, 계정명, 패스워드
		}
		
		// 존재하면 기존에 연결되어 있는 것을 반환해줘
		return dbConn;
		//-- 구성된 연결 객체 반환
	}
	
	// 만약 외부에서 DB.Conn
	
	// 메소드 정의 → 오버로딩 → 연결
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{	
		// 한 번 연결된 객체를 계속 사용(즉, 연결되지 않은 경우에만 연결을 시도하겠다는 의미)
		// 기존에 만들어 놓은 연결객체가 존재하지 않을 경우에만... DB 연결 객체 생성
		// -> 싱글톤 (디자인 패턴)
		
		if (dbConn == null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
			
		}
		
		return dbConn;
		//-- 구성된 연결 객체 반환
	}
	
	
	// 메소드 정의 → 연결 종료(연결되어 있는 상황에서만 종료하겠다~!)
	public static void close() throws SQLException
	{
		// dbConn 변수(멤버 변수)는
		// Database 가 연결된 상태일 경우 Connection 을 갖는다.
		// 연결되지 않은 상태라면.. null 인 상태가 된다.
		if (dbConn != null)
		{
			// 연결 객체(dbConn)의 isClosed() 메소드를 통해 연결 상태 확인
			//-- 연결이 닫혀있는 경우 true 반환
			//	 연결이 닫혀있지 않은 경우 false 반환
			if (!dbConn.isClosed())		// is~() 메소드는 리턴자료형이 boolean이고, ~인지 아닌지를 반환하는 메소드
			{
				dbConn.close();
				//-- 연결 객체의 close() 메소드 호출을 통해 연결 종료~!!!
			}
		}
		
		
		//check~!!!
		dbConn = null;
	}
}


















