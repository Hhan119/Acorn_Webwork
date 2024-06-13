<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<div class="container bg-dark">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a class="text-primary" href="${pageContext.request.contextPath }/index.jsp">Home</a></li>
				<li class="breadcrumb-item"><a class="text-primary" href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a></li>
				<li class="breadcrumb-item text-white active">회원추가</a></li>
			</ol>
		</nav>
	<h3 class="text-white">회원 추가 양식</h3>
	<form action="${pageContext.request.contextPath }/member/insert.jsp" method="post">
		<div class="mb-3 row">
			<label for="name" class="col-form-label col-sm-2 text-white" >이름</label>
			<div class="col-sm-10">
				<input type="text" name="name" class="form-control" placeholder="이름 입력.." />
			</div>
		</div>
	 	
		<div class="mb-3 row">
			<label for="name" class="col-form-label col-sm-2 text-white" >주소</label>
			<div class="col-sm-10">
				<input type="text" name="addr" class="form-control" placeholder="주소 입력.." />
			</div>
		</div>
		<button type="submit" class="btn btn-primary btn-lg">추가</button>
		<button type="submit" class="btn btn-danger btn-lg"><a class="text-white" href="${pageContext.request.contextPath }/member/list.jsp"> 취소</a></button>
	</form>
	</div>
</body>
</html>