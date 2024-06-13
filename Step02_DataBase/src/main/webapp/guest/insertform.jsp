<%@page import="test.guestdao.GuestDao"%>
<%@page import="test.guestdto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guest/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/index.jsp">Home</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/guest/list.jsp">방명록목록</a></li>
				<li class="breadcrumb-item active">방명록작성</a></li>
			</ol>
		</nav>
		<h1>좋은 글을 남겨 주세요.</h1>
		<form action="${pageContext.request.contextPath }/guest/insert.jsp" method="post">
			<div class="form-floating mb-3">
				<input type="text" id="writer" name="writer" class="form-control" placeholder="작성자 입력.."/>
				<label for="writer">작성자</label>
			</div>
			
			<div class="form-floating mb-3">
				<textarea id="content" name="content"  class="form-control"  placeholder="내용 입력.." style="height:200px"/></textarea>
				<label for="content" class="form-Label">내용</label>
			</div>
			
			<div class="form-floating mb-3">
				<input type="password" id="pwd" name="pwd" class="form-control" placeholder="비밀번호 입력.."/>
				<label for="pwd" class="form-Label">비밀번호</label>
			</div>
			<button type="submit" class="btn btn-outline-primary btn-md">등록</button>
		</form>
	</div>
</body>
</html>