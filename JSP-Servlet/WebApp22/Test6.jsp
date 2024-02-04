<%@page import="com.test.MyData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// Test6.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성
	
	List<MyData> lists = new ArrayList<MyData>();

	MyData ob = new MyData("김둘리", 15);
	lists.add(ob);
	
	ob = new MyData("홍길동", 23);
	lists.add(ob);

	ob = new MyData("하하하", 24);
	lists.add(ob);
	
	ob = new MyData("김영희", 16);
	lists.add(ob);
	
	ob = new MyData("김철수", 8);
	lists.add(ob);
	
	ob = new MyData("호호호", 17);
	lists.add(ob);
	
	request.setAttribute("lists", lists);
%>
<jsp:forward page="Test6_result.jsp"></jsp:forward>
