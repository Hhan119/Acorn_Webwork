<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.memberdto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 		// "list" 라는 키값으로 담긴  회원목록(List<MemberDto>) 를 request 객체로 부터 얻어내기 
    	List<MemberDto> list=(List<MemberDto>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
</head>
<body>
	<div class=container>
		<h3>회원목록입니다.</h3>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>팀이름</th>
					<th>국적</th>
				</tr>
			</thead>
			<tbody>
			<% for(MemberDto tmp:list){%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>