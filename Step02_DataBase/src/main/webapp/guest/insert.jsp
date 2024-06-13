<%@page import="test.guestdto.GuestDto"%>
<%@page import="test.guestdao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  
	// 1. 폼 전송되는 writer, content, pwd를 추출한다.
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	// 2. DB에 저장한다.
	// 글정보를 GuestDto에 담는다.
	GuestDto dto = new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	// GusetDao 객체의 참조값 얻어오기
	GuestDao dao=GuestDao.getInstance();
	boolean isSuccess=dao.insert(dto);

	
	// 3. 응답한다. 
	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<div class="container">
		<h3>알림</h3>
		<%if(isSuccess){ %>
			<p>
				<%=writer %>님이 작성한 글을 성공적으로 저장 했습니다. 
				<a href="list.jsp">목록보기</a>
			</p>
		<%}else{ %>
			<p>
				저장을 실패하였습니다.
				<a href="insertform.jsp">다시 작성</a>
			</p>
		
		<%} %>
	</div>
</body>
</html>