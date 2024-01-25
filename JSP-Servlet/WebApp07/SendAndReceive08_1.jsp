<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(SendAndReceive08.jsp)로부터 넘어온 데이터 수신 값 받아오기
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// 달력 객체 구성
	Calendar cal = Calendar.getInstance();
	
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 최초요청시
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);	
	}
	
	// 이전과 이후 구성
	int preYear = selectYear;
	int preMonth = selectMonth-1;
	
	if (preMonth < 1)
	{
		preYear = selectYear -1;
		preMonth = 12;
	}
	
	int nextYear = selectYear;
	int nextMonth = selectMonth+1;
	
	if (preMonth > 12)
	{
		preYear = selectYear +1;
		preMonth = 1;
	}
	
	
	
	// 만년 달력 그리기
	
	int[] days = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	int nalsu, week;
	
	String[] weekNames = {"일", "월", "화", "수", "목", "금", "토"};
	
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
	week = nalsu % 7;
	
	// 특정 요일부터 1일이 출발할 수 있도록 공백 발생(지정)
	String write="";

	write += "<table border='1'>";
	write += "<tr>";
	for(int k=0; k<weekNames.length; k++)
	{
		if (k==0)
			write += "<th style='color:red;'>" + weekNames[k] + "</th>";
		else if (k==6)
			write += "<th style='color:blue;'>" + weekNames[k] + "</th>";
		else
			write += "<th>" + weekNames[k] + "</th>";
	}
	write += "</tr><tr>";
	for (int i=1; i<=week; i++)
	{
		write += "<td></td>";
	}
	for (int n=1; n<=days[selectMonth-1]; n++)
	{
		week++;
		if(selectYear==nowYear && selectMonth==nowMonth && n==nowDay && (week)%7==0)
		{
			// 오늘이 토요일 일 때
			write += "<td class='nowSat'>" + n + "</td>";
		}
		else if (selectYear==nowYear && selectMonth==nowMonth && n==nowDay && (week)%7==1)
		{
			// 오늘이 일요일 일 때
			write += "<td class='nowSun'>" + n + "</td>";
		}
		else if (selectYear==nowYear && selectMonth==nowMonth && n==nowDay)
		{
			// 오늘이 평일 일 때
			write += "<td class='now'>" + n + "</td>";
		}
		else if ((week)%7==0)
		{
			// 오늘이 아닌 토요일
			write += "<td class='sat'>" + n + "</td>";
		}
		else if ((week)%7==1)
		{
			// 오늘이 아닌 일요일
			write += "<td class='sun'>" + n + "</td>";
		}
		else
		{
			// 오늘이 아닌 평일
			write += "<td>"+ n + "</td>";
		}
		
		if((week)%7==0)
		{
			write += "</tr>";
			write += "<tr>";
		}
	}
	// 빈칸 공백 td 발생
	for(int l=0; l<week; week++)
	{
		if(week%7==0)
			break;
		write += "<td></td>";
	}
	
	if ((week)%7!=0)
		write += "</tr>";
	write += "</table>";

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
	td {text-align: right; width:50px;}
	td.sun {color: red;}
	td.sat {color: blue;}
	td.now {background-color: aqua; font-weight: bold;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지를 구성한다.
	   - submit 버튼 없이 이벤트 처리를 한다.
	   
	   ◀ 2023년 12월 ▶
	   
	   ------------------------------------------
	   ------------------------------------------
	   ------------------------------------------
	   ------------------------------------------
	   ------------------------------------------
	   
	   - 『◀』 이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
	     
	   - 사용자 최초 요청 주소는
	     http://localhost:3306/WebApp07/SendAndReceive08.jsp 로 한다
	     
	○ SendAndReceive08.jsp
 -->

<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>

<div>
	<form action="" method="get">
		<!-- GET 방식의 페이지 요청과 데이터 전송할 때 갖는 유일한 장점 -->
		<a href="SendAndReceive08.jsp?year=<%=preYear %>&month=<%=preMonth%>">◀</a>
		<%=selectYear %>년 <%=selectMonth %>월
		<a href="SendAndReceive08.jsp?year=<%=nextYear %>&month=<%=nextMonth%>">▶</a>
	</form>
</div>

<div>
	<%=write %>
</div>

</body>
</html>