<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 방문자 수
	int n = 0;

	String count = (String)application.getAttribute("count");
	
	if (count != null)
		n = Integer.parseInt(count);
		
	n++;
	
	application.setAttribute("count", Integer.toString(n));
	
	// 웹 서버 실제 경로
	String realPath = application.getRealPath("/");
	application.log("방문자 : " + request.getRemoteAddr());
	//-- 12월 15, 2023 5:13:18 오후 org.apache.catalina.core.ApplicationContext log
	//	 정보: 접속자 : 0:0:0:0:0:0:0:1 → localhost 로 접속한 경우
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>Application 을 활용한 접속자 수 체크</h1>
	<hr>
</div>

<div>
	<h2>총 방문자 : <%=n %></h2>
	<h2>웹 서버 실제 경로 : <%=realPath %></h2>
</div>

</body>
</html>