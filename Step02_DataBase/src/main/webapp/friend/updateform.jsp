<%@page import="test.frienddto.FriendDto"%>
<%@page import="test.frienddao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    FriendDao dao = new FriendDao();
    FriendDto dto = new FriendDto();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>friend/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<div class="container bg-primary">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a class="text-muted" href="${pageContext.request.contextPath }/index.jsp">Home</a></li>
				<li class="breadcrumb-item"><a class="text-muted" href="${pageContext.request.contextPath }/friend/list.jsp">친구목록</a></li>
				<li class="breadcrumb-item text-white active">친구수정</a></li>
			</ol>
		</nav>
	<h3 class="text-white">회원 수정 양식</h3>
	<form action="${pageContext.request.contextPath }/friend/update.jsp" method="post">
		<label for="num" class="form-Label text-white">번호</label>
		<input type="text" name="num" class="form-control" placeholder="변경할 번호 입력.." /><br>
		<label for="num" class="form-Label text-white">이름</label>
		<input type="text" name="name" class="form-control" placeholder="이름 입력.." /><br>
		<label for="num" class="form-Label text-white" >휴대폰번호</label>
		<input type="text" name="phonenum" class="form-control" placeholder="휴대폰 번호 입력.." /></br>
		<button type="submit" class="btn btn-success">추가</button>
	</form>
	</div>
</body>
</html>