<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {display: inline-block; width: 80px; margin: 5px;}
	.btn {width: 70px;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		var f = document.form02;
		
		if(!f.userId.value)
		{
			alert("아이디를 입력하세요.");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드를 입력하세요.");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>

<div>
	<h1>아이디, 패스워드 입력</h1>
	<h2>(TestSession02.jsp)</h2>
	<hr>
</div>

 <div>
 	<form action="TestSession03.jsp" method="post" name="form02">
 		<ul>
 		 	<li><span>아이디</span><input type="text" id="userId" name="userId" class="txt"></li>
 			<li><span>패스워드</span><input type="text" id="userPwd" name="userPwd" class="txt"></li>
 		</ul>
 		<button type="button" class="btn" onclick="formCheck()">입력</button>
 	</form>
 </div>

</body>
</html>