<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	 Integer num = Integer.parseInt(request.getParameter("num"));
 		String title = request.getParameter("title");
 		String content = request.getParameter("content");
 		
 		String writer = request.getParameter("id");
 		
 		CafeDto dto = new CafeDto();
 		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setWriter(writer);
		
		boolean isSuccess = CafeDao.getInstance().update(dto);
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/vue2/private/update.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="contrainer">
				<div class="card w-50 mt-5">
			<%if(isSuccess){ %>
				<div class="card-body">
					<h5 class="card-title">알림</h5>
					<p class="card-text"><%=dto.getNum()%>번에 글 내용을 수정했습니다. </p>
					location.href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=num %>";
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/cafe/list.jsp">확인</a>
				</div>
			<%}else{ %>
				<div class="card-body">
					<h5 class="card-title">알림</h5>
					<p class="card-text text-danger">글 수정 실패!</p>
					<a class="btn btn-warning" href="${pageContext.request.contextPath }/cafe/private/updateform.jsp?num=<%=dto.getNum()%>">다시 수정하기</a>
				</div>
			<%} %>
		</div>
	
	</div>
</body>
</html>