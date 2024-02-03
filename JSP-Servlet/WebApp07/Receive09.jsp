<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(Send09_re.jsp 또는 Send09_for.jsp)부터 넘어온 데이터 수신 → userName, message
	
	//-- 이미 Send09_re.jsp의 userName, message 는 소멸되었음
	//-- Send09_for.jsp 로부터 넘어온 데이터가 userName, message에 담김
	//   (해당 페이지가 Receive09.jsp 라는 것을 클라이언트는 알 수 없음)
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("userName");
	
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09_for.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive09.jsp)</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<p>내용 : <%=message %></p>
</div>

</body>
</html>