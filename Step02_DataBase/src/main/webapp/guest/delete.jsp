<%@page import="test.guestdto.GuestDto"%>
<%@page import="test.guestdao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 // 1. GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 알아낸다. 
  	int num=Integer.parseInt(request.getParameter("num"));
    String pwd = request.getParameter("pwd");

 	GuestDao dao = GuestDao.getInstance();
 	// 삭제할 글정를 얻어와서
 	GuestDto dto = dao.getDate(num);
 	// 비밀번호가 일치하는 확인(java에서 문자열의 내용이 같은지 비교할때는 .equals() 메소드를 이용)
 	if(pwd.equals(dto.getPwd())){
 		// DB에서 실제로 삭제하고 
 		dao.delete(dto);
 		
 		// "/guest/list.jsp" 페이지로 리다일렉트 이동하라는 응답하기
 		String cPath=request.getContextPath();
 	  	response.sendRedirect(cPath+"/guest/list.jsp");
 	}
 	// 삭제 실패임을 응답한다.
 	%>
 	
 	
 <!doctype html>
 <html lang="en">
 <head>
 	<meta charset="UTF-8" />
 	<title>guest/delete.jsp</title>
 </head>
 <body>
	<script>
		alert("비밀번호가 일치하지 않습니다. ")
		location.href="${pageContext.request.contextPath }/guest/list.jsp"
	</script>
 </body>
 </html>
 	
 	
 