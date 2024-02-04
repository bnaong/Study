<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리) -->
<%
	String str = "";
	if (ob.getIdeal() != null)
	{
		for (String temp : ob.getIdeal())
		{
			str += temp + " ";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>등록 수신결과 확인</h1>
	<hr>
</div>

<div>
	이름 : <%=ob.getUserName() %>
	나이 : <%=ob.getAge() %>
	성별 : <%=ob.getGender() %>
	이상형 : <%=str %>
	
	<%-- 이름 : <jsp:getProperty property="userName" name="ob"/>
	나이 : <jsp:getProperty property="age" name="ob"/>
	성별 : <jsp:getProperty property="gender" name="ob"/>
	이상형 : <jsp:getProperty property="ideal" name="ob"/> --%>
	<!-- 체크박스는 여러 개의 선택이 가능하므로.. -->
</div>

</body>
</html>