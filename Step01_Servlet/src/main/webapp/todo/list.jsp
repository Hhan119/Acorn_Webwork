<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%
List<String> works = new ArrayList<>();
works.add("html 공부하기");
works.add("css 공부하기");
works.add("javascript 공부하기");
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>todo/lidt.jsp</title>
</head>
<body>
	<h3>할일 목록입니다.</h3>
	<ul>
		<%for(int i=0; i<works.size(); i++) {%>
				<li><%=works.get(i) %></li>
		<% }%>
	</ul>
</body>
</html>