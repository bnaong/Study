<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 깃허브에 업로드 X

	// 이전 페이지로(SendAndReceive06.jsp → 자기자신)부터 넘어온 데이터 수신
	
	request.setCharacterEncoding("UTF-8");
	
	int selectYear=0;
	int selectMonth=0;
	try
	{
		selectYear = Integer.parseInt(request.getParameter("sYear"));
		selectMonth = Integer.parseInt(request.getParameter("sMonth"));
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}

	
	
	//달력객체 생성 후 시스템상 현재년월 확인 후 아래에서 렌더링 하게 만들기
	
	Calendar today = Calendar.getInstance();
	
	int year = today.get(Calendar.YEAR);
	int month = today.get(Calendar.MONTH)+1;
	int nowDay = today.get(Calendar.DAY_OF_MONTH);
	
	String yearResult = "";
	String monthResult = "";
	
	String yearSelect="";
	
	if(selectYear==0)
		selectYear=year;
	if(selectMonth==0)
		selectMonth=month;
	
	for(int i=selectYear-10; i<=selectYear+10; i++)
	{
		if(i == selectYear)
			yearSelect = " selected='selected'";
		else
			yearSelect = " ";
		
		yearResult += "<option" + yearSelect + ">"+ i +"</option><br>";
	}
	
	
	String monthSelect="";
	for(int j=1; j<=12; j++)
	{
		if(j == selectMonth)
			monthSelect = " selected='selected'";
		else
			monthSelect = " ";
		monthResult += "<option" + monthSelect + ">" + j + "</option><br>";
	}
	
	// 달력 그리기
	
	int[] days = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	int nalsu, w;

	
	// 입력받은 연도에 해당하는 2월의 마지막 날 계산
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)			//-- 입력 년도가 윤년이라면..
	{
		days[1] = 29;
	}

	// 1년 1월 1일 ~ 입력받은 연도의 이전 년도 12월 31일까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;

	// 입력받은 연도(해당 연도) 1월 1일 ~ 입력한 월의 이전 월까지의 날 수 계산
	for (int i=0; i<(selectMonth-1); i++)
	{
		nalsu += days[i];
	}
	
	// 입력받은 월의 1일을 날 수 누적 연산
	nalsu += 1;
	
	//-- 입력받은 연의 입력월의 1일이 무슨요일인지 확인하기 위한 연산
	w = nalsu % 7;
	
	// 특정 요일부터 1일이 출발할 수 있도록 공백 발생(지정)
	String write="";
	write += "<tr>";
	for (int i=1; i<=w; i++)
	{
		write += "<td>" + " " + "</td>";
	}
	for (int n=1; n<=days[selectMonth-1]; n++)
	{
		write += "<td>"+ n + "</td>";
		if((n+w)%7==0)
		{
			write += "</tr>";
			write += "<tr>";
		}
	}
	write += "</tr>";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
	
	   - 달력의 출력하는 JSP 페이지를 구성한다.
	   - 페이지 레이아웃은 연도와 월을 입력받아
	     화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 스스로 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 선택 기본 구성은 현재의 연도를 기준으로
	     이전 10년, 이후 10년 으로 구성한다.
	     (기본적으로는 만년달력 형태로 구성하는데
	      현재의 연, 월은 달력 객체로부터 확인할 수 있도록 한다.)
	   - 월 선택 기본 구성은 1월 부터 12월 까지로 구성한다.
	   
	       2013			  1
	        :             :
	     [ 2023 ▼] 년 [ 12 ▼] 월
	        :
	       2033
	       
	     --------------------------
	     --------------------------
	     --------------------------
	     --------------------------
	     
	  - 연도 select 나 월 select 의 내용이 변화되면
	    해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	    
	  - 사용자 최초 요청 주소는
	    http://localhost:3306/WebApp07/SendAndReceive07.jsp
	  
	  ○ SendAndReceive07.jsp

 -->
 
 <div>
 	<form action="" method="post">
 		<select name="sYear" onchange="this.form.submit()">
			<%=yearResult %>
 		</select> 년
 		<select name="sMonth" onchange="this.form.submit()">
			<%=monthResult %>
 		</select> 월
 	</form>
 </div>
<div>
	<table border="1">
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<%=write %>
	</table>
</div>

</body>
</html>



















