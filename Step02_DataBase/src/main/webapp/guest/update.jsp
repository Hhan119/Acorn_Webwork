<%@page import="test.guestdto.GuestDto"%>
<%@page import="test.guestdao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		// 1. 폼 전송되는 수정할 회원의 정보를 읽어온다.
		int num = Integer.parseInt(request.getParameter("num"));
    	String writer = request.getParameter("writer");
    	String content = request.getParameter("content");
    	String pwd = request.getParameter("pwd");
    	
   
    	GuestDao dao=GuestDao.getInstance();
    	// DB에 저장된 비밀번호 읽어오기
    	String savedPwd = dao.getDate(num).getPwd();
 
    	// 작업의 성공여부를 저장할 변수 만들고 false를 초기값으로 부여한다.
    	boolean isSuccess=false;
    	
     	// 비밀번호가 일치하는지 확인
    	if(pwd.equals(savedPwd)){
  			// GuestDto 에 수정할 글정보를 담고
    		GuestDto dto = new GuestDto();
    		dto.setNum(num);
    		dto.setWriter(writer);
    		dto.setContent(content);
    		dto.setPwd(pwd);
    	// GuestDao객체를 이용해서 수정 반영하고 성공여부를 리턴 받는다.
    		isSuccess=dao.update(dto);
    	}
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/guest/update.jsp</title>
</head>
<body>
	<div class="container">
		<h3>수정 성공여부</h3>
		<%if(isSuccess){ %>
			<p>
				<%=writer %>님이 작성한 글을 수정 했습니다. 
				<a href="list.jsp">목록보기</a>
			</p>
		<%}else{ %>
			<p>
				수정을 실패하였습니다.
				<a href="updateform.jsp?num=<%=num%>">다시 수정</a>
			</p>
		
		<%} %>
	</div>
</body>
</html>