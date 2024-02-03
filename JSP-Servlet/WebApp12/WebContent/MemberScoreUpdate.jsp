<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreUpdate.jsp
	
	// 이전 페이지(MemberScoreUpdateForm.jsp)로부터 넘어온 데이터 수신 → sid
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		
		score.setSid(sid);
		score.setKor(Integer.parseInt(kor));
		score.setEng(Integer.parseInt(eng));
		score.setMat(Integer.parseInt(mat));
		
		dao.modify(score);
		
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("MemberScoreSelect.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

</body>
</html>