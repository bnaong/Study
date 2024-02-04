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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.txtName {width: 100px;}
	.txtTel {width: 150px;}
	.txtAddr {width: 400px;}
	.table {width : 600px;}
	.btn {width: 100%;}
</style>
</head>
<body>

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		<table class="table">
			<tr>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			<c:forEach var="a" begin="1" end="5" step="1">
			<tr>
				<td><input type="text" name="name${a}" class="txtName"></td>
				<td><input type="text" name="tel${a}" class="txtTel"></td>
				<td><input type="text" name="addr${a}" class="txtAddr"></td>
			</tr>
			</c:forEach>
			<%-- <tr>
				<td><input type="text" name="name1" class="txtName"></td>
				<td><input type="text" name="tel1" class="txtTel"></td>
				<td><input type="text" name="addr1" class="txtAddr"></td>
			</tr>
			<tr>
				<td><input type="text" name="name2" class="txtName"></td>
				<td><input type="text" name="tel2" class="txtTel"></td>
				<td><input type="text" name="addr2" class="txtAddr"></td>
			</tr>
			<tr>
				<td><input type="text" name="name3" class="txtName"></td>
				<td><input type="text" name="tel3" class="txtTel"></td>
				<td><input type="text" name="addr3" class="txtAddr"></td>
			</tr>
			<tr>
				<td><input type="text" name="name4" class="txtName"></td>
				<td><input type="text" name="tel4" class="txtTel"></td>
				<td><input type="text" name="addr4" class="txtAddr"></td>
			</tr>
			<tr>
				<td><input type="text" name="name5" class="txtName"></td>
				<td><input type="text" name="tel5" class="txtTel"></td>
				<td><input type="text" name="addr5" class="txtAddr"></td>
			</tr> --%>
			<tr>
				<td colspan="3">
					<button type="submit" class="btn">등록</button>
				</td>
			</tr>
		</table>
		<!-- (이름, 전화번호, 주소) * 5명 분 -->
		<!-- → submit 액션 처리 -->
		
	</form>
</div>

</body>
</html>