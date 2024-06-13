<%@page import="test.frienddao.FriendDao"%>
<%@page import="test.frienddto.FriendDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String name = request.getParameter("name"); 
    	String phonenum = request.getParameter("phonenum");
    	
    	FriendDto dto = new FriendDto();
    	FriendDao dao = new FriendDao();
    	dto.setName(name);
		dto.setPhonenum(phonenum);
    	// 3. 응답한다.
    	boolean isSuccess=dao.insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h3>성공여부 확인</h3>
	<%if (isSuccess) { %>
		<p>추가하였습니다.</p>
		<a href="${pageContext.request.contextPath }/friend/list.jsp">List 확인</a>
	<%}else{ %>
		<p>실패하였습니다.</p>
		<a href="${pageContext.request.contextPath }/friend/insertform.jsp">다시 작성</a>
		<%} %>
</body>
</html>