<%@page import="java.net.URLEncoder"%>
<%@page import="test.user.dao.UserDao"%>
<%@page import="test.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		// 1. 폼 전송되는 id, pwd 값을 읽어와서
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		// 2. id에 해당하는 회원정보를 UserDao객체를 이용해서 얻어오기
		UserDto dto = UserDao.getInstance().getData(id);
		// 3. 실제 존재하는 아이디이고 아이디가 존재하면 비밀번호도 일치하는지 비교 한다.
		boolean isLoginSuccess = false;
		if(dto != null){
			if(dto.getPwd().equals(pwd)){
				// 로그인 처리하기
				session.setAttribute("id", id);
				isLoginSuccess = true;
			}
		}
		// 로그인 후 가야할 목적지 정보
		String url = request.getParameter("url");
		// 로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비한다.
		String encodedUrl=URLEncoder.encode(url);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/login.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isLoginSuccess) { %>
			<p>
				<strong><%=dto.getId() %></strong> 님 로그인 되었습니다. 
				<a href="<%=url %>">확인</a>
			</p>
		<%} else{%>
			<p>
					아이디 or 비밀번호가 틀렸습니다. 
					<a href="${pageContext.request.contextPath}/user/loginform.jsp?url=<%=encodedUrl %>">다시 로그인</a>
			</p>
		
		<%} %>
	</div>
</body>
</html>