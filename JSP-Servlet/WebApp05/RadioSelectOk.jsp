<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 스크립릿 영역
	
	// 수신할 때 request 인코딩 방식이 바뀔 수 있음
	// request, response 안에는 head, body 를 포함한 모든 정보들이 총괄적으로 들어가 있음
	// 따라서, 이 request 객체에 대해 문자에 대한 인코딩방식을 맞춰서 set 해주어야 한글이 깨지지 않음
	// get 방식은 중간에 한 번 보여주는 과정에서 UTF-8로 보여주기 때문에 한글이 깨지지 않은 것!
	request.setCharacterEncoding("UTF-8");
	

	// 이전 페이지(RadioSelect.jsp)로부터 데이터 수신
	// → name, gender, major, hobby
	String name = request.getParameter("name");				// 단일 데이터 수신(텍스트 박스)
	String genderStr = request.getParameter("gender");			// 단일 데이터 수신(라디오 버튼)
	String major = request.getParameter("major");			// 단일 데이터 수신(선택상자)
	String[] hobbyArr = request.getParameterValues("hobby");	// 다중 데이터 수신(선택상자)
	//-- 다중 선택이 가능한 선택상자일 경우...
	//   『getParameterValues()』로 데이터 수신 → 배열 반환
	
	String gender = "";
	if(genderStr.equals("M"))
		gender = "남자";
	else if(genderStr.equals("F"))
		gender = "여자";
	else
		gender = "확인불가";
	
	String hobby = "";
	if(hobbyArr != null)
	{
		for (String item : hobbyArr)
			hobby += "[" + item + "]";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelectOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 03</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelectOk.jsp</p>
</div>

<p>
이름 : <%=name %><br>
성별 : <%=gender %><br>
전공 : <%=major %><br>
취미 : <%=hobby %>
<!-- 기능이 포함되지 않은 뷰 페이지를 먼저 만들고, 확인해서 실제 데이터가 들어있는 상태로 처리함
이렇게 먼저 뷰 페이지를 만들어서 확인하지 않으면 프로젝트 때 협업하기 힘듦!! -->
</p>

</body>
</html>