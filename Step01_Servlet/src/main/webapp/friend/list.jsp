<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%
	// DB에서 불러온 친구 목록이라고 가정
	List<String> names = new ArrayList<>();
	names.add("첼시");
	names.add("레알");
	names.add("레버쿠젠");
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>friend/list.jsp</title>
</head>
<body>
	<h3>친구 목록입니다.</h3>
	<ul>
		<%for(int i=0; i<names.size(); i++){%>
			<li><%=names.get(i) %></li>
		<%} %>
	</ul>
	<ul>
		<%for(String tmp:names){ %>
			<li><%=tmp %></li>
		<%} %>
	</ul>
</body>
</html>