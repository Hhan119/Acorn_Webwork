<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/index.jsp">Home</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a></li>
				<li class="breadcrumb-item active">회원수정</a></li>
			</ol>
		</nav>
		<h3>회원 수정 양식</h3>
		<form action="${pageContext.request.contextPath }/member/update.jsp" method="post">
			<div class="form-floating mb-3">
			<input type="text" name="num" class="form-control" placeholder="번호 입력.." style="height:100px"/>
			<label for="num" class="form-Label">번호</label>
			</div>
			
			<div class="form-floating mb-3">
			<input type="text" name="name" class="form-control" placeholder="이름 입력.." style="height:100px"/>
			<label for="name" class="form-Label">이름</label>
			</div>
			
			<div class="form-floating mb-3">
			<input type="text" name="addr" class="form-control" placeholder="주소 입력.." style="height:100px"/>
			<label for="addr" class="form-Label">주소</label>
			
			<button type="submit" class="btn btn-outline-success btn-sm">추가</button>
			<button type="submit" class="btn btn-outline-danger btn-sm">삭제</button>
		</form>
	</div>
</body>
</html>