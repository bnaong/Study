<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터베이스의 테이블(TBL_MEMBER)에
	//   회원 데이터 추가 액션 처리 수행
	//   ... 이후...
	//   클라이언트가 다시 리스트 페이지(MemberSelect.jsp)
	//   요청할 수 있도록 안내
	
	// 이전 페이지로(MemberInsertForm.jsp)부터 넘어온 데이터 수신 → uName, uTel
	
	request.setCharacterEncoding("UTF-8");
	
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성(→ add() 메소드 호출을 위해 필요ㄴ)
		MemberDTO dto = new MemberDTO();
		
		dto.setName(uName);
		dto.setTel(uTel);
		
		dao.add(dto);
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 클라이언트가 MemberSelect.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberSelect.jsp");
	
%>