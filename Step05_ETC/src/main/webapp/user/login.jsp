<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 폼 전송되는 id, pwd를 읽어와서
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	
    	// 로그인 성공 여부를 담을 변수 선언하고 초기값 false 부여
    	boolean isLoginSuccess = false;
    	// 가상으로 로그인 처리
    	if(id.equals("gura") && pwd.equals("1234")){
    		//로그인 처리하기(session 영역에 id라는 키값으로 로그인 된 아이디를 담는다.)
    		session.setAttribute("id", id);
    		// 로그인 성공이라고 표시
    		isLoginSuccess = true;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/login.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isLoginSuccess){ %>
			<p><strong>id</strong>님 로그인이 되었습니다.
			<a href="${pageContext.request.contextPath }/">확인</a>
			</p>
		<%}else{ %>
			<p>
				아이디 or 비밀번호가 틀렸습니다.
				<a href="${pageContext.request.contextPath }/user/loginform.jsp">다시 로그인</a>
			</p>
			<%} %>
	</div>
</body>
</html>