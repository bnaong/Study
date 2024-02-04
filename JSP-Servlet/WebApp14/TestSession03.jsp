<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	session.removeAttribute("userName");
	session.removeAttribute("userTel");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>이름, 전화번호, 아이디, 패스워드 출력</h1>
	<h2>(TestSession03.jsp)</h2>
	<hr>
</div>

<div>
	<ul>
		<li><span>이름 : </span><%=userName %></li>
		<li><span>전화번호 : </span><%=userTel %></li>
		<li><span>아이디 : </span><%=userId %></li>
		<li><span>패스워드 : </span><%=userPwd %></li>
	</ul>
</div>

</body>
</html>