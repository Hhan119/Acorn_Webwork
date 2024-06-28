<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 1. GET 방식 파라미터로 전달되는 삭제 할 파일의 글 번호를 읽어오기
    	Integer num = Integer.parseInt(request.getParameter("num"));
    	// 2. 로그인 된 아이디와 글의 작성자가 일치하는지 확인해서 일치하지 않으면 에러페이지를 응답한다.
       	CafeDto dto = CafeDao.getInstance().getData(num); // 글정보
    	String id = (String)session.getAttribute("id"); // 로그인된 사용자
    	if(!dto.getWriter().equals(id)){ // 만약에 글 작성자가 로그인된 사용자와 다르면 
    		// 에러페이지를 응답
    		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일 지우면 혼난다!");
    		return; // 에러페이지를 여기서 끝낸다.
    	}
    	// 3. DB에서 삭제
    	CafeDao.getInstance().deleteRef(num);
    	boolean isSuccess = CafeDao.getInstance().delete(num);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess) {%>
			<p>삭제가 완료되었습니다. </p>
			<a href="${pageContext.request.contextPath }/cafe/list.jsp">목록 보기</a>
		<%} else { %>
				<p>삭제를 실패하였습니다.</p>
				<a href="${pageContext.request.contextPath }/cafe/detail.jsp">정보 다시보기</a>
		<%} %>
	
	</div>
</body>
</html>