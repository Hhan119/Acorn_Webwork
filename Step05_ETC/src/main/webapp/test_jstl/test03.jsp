<%@page import="test.memberdto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// Servlet 단에서 담은 sample  데이터라고 가정하자
	MemberDto dto1=new MemberDto();
	dto1.setNum(1);
	dto1.setName("김구라");
	dto1.setAddr("제목1");
	
	MemberDto dto2=new MemberDto();
	dto2.setNum(2);
	dto2.setName("해골");
	dto2.setAddr("제목2");
	
	MemberDto dto3=new MemberDto();
	dto3.setNum(3);
	dto3.setName("원숭이");
	dto3.setAddr("제목3");
	
	List<MemberDto> list = new ArrayList<>();
	list.add(dto1);
	list.add(dto2);
	list.add(dto3);
	
	// 위의 데이터는 DB에서 읽어온 sample 데이터라고 가정 
	// EL 로 추출할수 있도록 request  영역에 담는다. 
	request.setAttribute("list", list);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/test03.jsp</title>
</head>
<body>
	<h1>파일 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.name }</td>
					<td>${tmp.addr }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>















