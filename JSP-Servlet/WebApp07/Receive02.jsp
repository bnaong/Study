<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 스크립릿 영역
	
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(Send02.html)로부터 넘어온 데이터 수신 → name, kor, eng, mat
	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor, eng, mat;
	kor=eng=mat=0;
	
	int tot=0;
	double avg=0;
	
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		avg = Math.round((tot/3.0)*10)/10.0;
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}

	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>

<div>
	<p><%=name %>님, 성적 처리가 완료되었습니다.<br>
	   회원님의 점수는 국어:<%=kor %>점, 영어:<%=eng %>점, 수학:<%=mat %>점 입니다.<br>
	   총점은 <%=tot %>점, 평균은 <%=avg %>점 입니다.</p>
	   <!-- Math.round 로 사용할 수 있지만, String.format("%.1f",avg) 도 사용가능!
	        모델 / 뷰 / 컨트롤러 계층이 유지보수(변동) 주기가 다름(뷰가 가장 변동주기가 짧음)
	         → 일부만 골라서 따로 추출 후 변동되므로 분리해두는 것이 좋음
	         ▶ 원본 데이터를 변동시키지 않는 것이 이후에 뷰가 변동될 때 업무 로직을 바꾸지 않아도 될 것 -->
</div>

</body>
</html>