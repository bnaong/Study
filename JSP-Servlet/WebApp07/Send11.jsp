<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<!-- ■■■ 포워딩 / 리다이렉트 관련 중요한 실습 ■■■ -->

<!-- ① 사용자 최초 요청 페이지 -->
<!--    사칙 연산 수행을 위한 정수 입력 페이지 구성 -->
<!--    연산자를 함께 입력받을 수 있도록 처리 -->
<!--    정수1 / 정수2 / 연산자 -->
<!--    http://localhost:3306/WebApp07/Send11.jsp -->
<!-- 그저 사용자가 무언가를 시각적으로 확인하기 위한 view 페이지  -->

<!-- ② 연산 전용 페이지 -->
<!--    스크립트 코드(자바코드)만 존재 (response.sendRedirect() 메소드 포함) -->
<!--    → 추후 이 코드를 독립적인 java 로 분리 → Servlet 으로 구성할 예정 -->
<!--    http://localhost:3306/WebApp07/Redirect11.jsp -->
<!-- 로직을 수행하는 영역을 분리하자!
     실무적으로 비지니스 로직이 적용, 업무규칙이 적용되는 곳. 실제 처리가 이루어지는 곳 -->

<!-- ③ 최종 결과 출력 페이지 -->
<!--    연산 전용 페이지에서 처리한 결과를 넘겨받아 클라이언트와 대면할 페이지로 구성 -->
<!--    → 추후 이 페이지는 jsp view 페이지의 역할을 수행할 예정 -->
<!--    http://localhost:3306/WebApp07/Receive11.jsp -->
<!-- 홀 직원을 만나는 곳 -->

<div>
	
	<!-- redirect 처리하는 페이지로... -->
	<form action="Redirect11.jsp" method="post">
		정수1
		<input type="text" name="num1" class="txt">
		<select name="calResult">
			<option selected="selected">연산 선택</option>
			<option value="1">더하기</option>
			<option value="2">빼기</option>
			<option value="3">곱하기</option>
			<option value="4">나누기</option>
		</select>
		정수2
		<input type="text" name="num2" class="txt">
		
		<button type="submit" class="btn control">확인</button>
	</form>
</div>




</body>
</html>