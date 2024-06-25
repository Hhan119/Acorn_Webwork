<%@page import="test.memberdto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	MemberDto dto =(MemberDto)request.getAttribute("dto");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
	<p> 번호 : <strong><%=dto.getNum() %></strong></p>
	<p> 이름 : <strong><%=dto.getName() %></strong></p>
	<p> 주소 : <strong><%=dto.getAddr() %></strong></p>
	<h2> EL을 이용하면??</h2>
	<%-- EL을 이용하면 dto의 필드에 있는 값을 편하게 출력할 수 있다.
			${dto.num } or ${dto.getNum() }
			위와 같이 필드명만 적어도 자동으로 dto의 getter 메소드를 호출해준다.
	 --%>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${dto.getNum() }</td>
				<td>${dto.name }</td>
				<td>${dto.getAddr() }</td>
			</tr>
		</tbody>
	</table>
</body>
</html>