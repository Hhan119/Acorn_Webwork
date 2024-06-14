<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/logout.jsp]</title>
</head>
<body>
	<%
		// session scope에 "nick" 이라는 키 값으로 저장된 값 삭제하기
		session.removeAttribute("nick");
		// session scope에 저장된 모든 내용 초기화(삭제)
		session.invalidate();
	%>
	
		<p>
			로그아웃 되었습니다.
			<a href="${pageContext.request.contextPath }/index.jsp"></a>
		</p>
		
</body>
</html>