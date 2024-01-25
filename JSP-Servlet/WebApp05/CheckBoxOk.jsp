<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	
	String memo = request.getParameter("memo");
	//memo += memo.replace("\n", "<br>");
	memo = memo.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후부터 『replaceAll()』 메소드 사용 가능
	//   『replaceAll()』을 통해 처리한 결과를 다시 memo 변수에 대입
	
	
	String[] idealArr = request.getParameterValues("idealtype");
	
	// ※ 배열 데이터를 수신하여 처리할 경우...
	//    수신된 데이터가 전혀 없는 경우는
	//    배열의 값 자체가 null 이 되어버리기 때문에
	//    null 에 대한 확인(검사) 과정이 필요하다.
	String idealType = "";
	if(idealArr != null)
	{
		for (String item : idealArr)
			idealType += item;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
</head>
<body>

<p>이름 : <%=name %></p><br>
<p>메모 : <br><%=memo %></p><br>
<p>이상형 : <%=idealType %></p>

</body>
</html>