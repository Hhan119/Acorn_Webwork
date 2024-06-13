<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%
List<MemberDto> members = new ArrayList<>();
members.add(new MemberDto(1, "첼시", "잉글랜드"));
members.add(new MemberDto(2, "맨시티", "잉글랜드"));
members.add(new MemberDto(3, "아스날", "잉글랜드"));
%>


<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>members/list.jsp</title>
</head>
<body>
	<h3>회원 테이블입니다.</h3>
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>주소</td>
			</tr>
		</thead>
		<tbody>
		<%for(MemberDto tmp:members){ %>
			<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
			<tr>
			<% }%>
		</tbody>
	</table>

	
</body>
</html>