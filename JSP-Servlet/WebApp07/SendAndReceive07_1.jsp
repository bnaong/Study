<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 자기 자신 페이지(SendAndReceive07.jsp)로 부터 넘어온 데이터 수신
	// → year, month
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	
	
	// Calendar 객체 생성
	
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2023
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- 12
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); 	//-- 11
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우
	// → Line 6 ~ 7 을 통해 수신한 데이터로 표시할 달력의 년, 월 구성
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	
	// 테스트
	//out.print("<h1>selectYear : " + selectYear + "</h1>");
	//out.print("<h1>selectMonth : " + selectMonth + "</h1>");
	
	// 확인한 날짜로 년도 select option 구성
	String yOptions = "";
	for (int year=(selectYear-10); year<=(selectYear+10); year++)	// 2013 ~ 2033
	{
		// 관찰1.
		//yOptions += "<option value='" + year +"'>" + year + "</option>";
		
		// 관찰2.
		//if (year==nowYear)
		//	yOptions += "<option value='" + year +"' selected='selected'>" + year + "</option>";
		//else
		//	yOptions += "<option value='" + year +"'>" + year + "</option>";
		
		// 상황1. 페이지 최초 요청일 때 	 → sYear은 null / 현재 년도와 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청이 아닐 때 → sYear은 null 아님 / 선택 년도와 옵션이 같을 때 → selected(○)
		// 상황3. 나머지					 → selected(Ⅹ)
		if (sYear==null && year==nowYear)
			yOptions += yOptions += "<option value='" + year +"' selected='selected'>" + year + "</option>";
		else if (sYear!=null && year==Integer.parseInt(sYear))
			yOptions += yOptions += "<option value='" + year +"' selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value='" + year +"'>" + year + "</option>";
			
		// 달력에서 현재년도, 현재월, 현재일을 갖고 있지 않으면 오늘 날짜에 해당하는 일에 스타일을 적용할 수 없기 때문에
		// nowMonth, nowYear, nowDay 값에 담지 않는 것!
				
		
	}
	
	// 확인한 날짜로 월 select option 구성
	String mOptions = "";
	for (int month=1; month<=12; month++)			// 1 ~ 12
	{
		// 관찰1.
		//mOptions += "<option value='" + month +"'>" + month + "</option>";
		
		// 관찰2.
		//if (month==nowMonth)
		//	mOptions += "<option value='" + month +"' selected='selected'>" + month + "</option>";
		//else
		//	mOptions += "<option value='" + month +"'>" + month + "</option>";
			
		// 상황1. 페이지 최초 요청일 때 	 → sMonth 는 null / 현재 월과 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청이 아닐 때 → sMonth 는 null 아님 / 선택 월과 옵션이 같을 때 → selected(○)
		// 상황3. 나머지					 → selected(Ⅹ)
		if (sMonth==null && month==nowMonth)
			mOptions += mOptions += "<option value='" + month +"' selected='selected'>" + month + "</option>";
		else if (sMonth!=null && month==Integer.parseInt(sMonth))
			mOptions += mOptions += "<option value='" + month +"' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value='" + month +"'>" + month + "</option>";
	}
	
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요
	// (만년 달력)
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
	if (sYear != null && sMonth != null)
	{
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
	}

		

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right; width:50px;}
	td.sun {color: red;}
	td.sat {color: blue;}
	td.now {background-color: aqua; font-weight: bold;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>

<script type="text/javascript">

	function formCalendar(obj)
	{
		// 유효성 검사가 필요할 경우 삽입할 수 있는 영역~!!!
		
		obj.submit();
	}
</script>
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
 	<h1>데이터 송수신 실습 07</h1>
 	<hr>
 </div>
 
 <div>
 	<form action="" method="get">
 		<select id="year" name="year" onchange="formCalendar(this.form)">
			<%=yOptions %>
 		</select> 년도
 		<select id="month" name="month" onchange="formCalendar(this.form)">
 			<%=mOptions %>
 		</select> 월
 	</form>
 </div>
 <div>
	<%=write %>
</div>

</body>
</html>



















