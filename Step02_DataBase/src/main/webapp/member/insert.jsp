<%@page import="test.memberdao.MemberDao"%>
<%@page import="test.memberdto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. 폼 전송되는 이름과 주소를 추출한다.
	String name = request.getParameter("name"); 
	String addr = request.getParameter("addr"); 
	
	// MemberDto 객체에 담는다.
	// 2. db에 저장한다.
	MemberDao dao = new MemberDao();
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	// 3. 응답한다.
	boolean isSuccess=dao.insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container" >
	<h3>성공여부 확인</h3>
	<%if (isSuccess) { %>
		<p class="alert alert-info" role="alert">추가하였습니다.</p>
		<a href="${pageContext.request.contextPath }/member/list.jsp">목록 확인</a>
	<%}else{ %>
		<p class="alert alert-danger" role="alert">실패하였습니다.</p>
		<a href="${pageContext.request.contextPath }/member/insertform.jsp">다시 작성</a>
	<%} %>
	</div>
</body>
</html>