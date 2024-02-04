<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test6_result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h2>JSTL 코어(Core) forEach문 실습</h2>
	<h3>자료구조 활용</h3>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		<!-- 컬렉션 객체 접근용(출력용) 반복문 구성 (자료구조 대상으로 jstl forEach구문 작성시
		items속성을 가장 먼저 작성하기!
		lists에서 하나 꺼낸 것을 dto 타입으로 담는다! )-->
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td style="text-align: center">${dto.name }</td>
			<td style="text-align: center">${dto.age }</td>
			<!-- 타입(dto) 지정시 알아서 getter 메소드를 호출해줌! -->
		</tr>
		</c:forEach>
		
	</table>
</div>

</body>
</html>