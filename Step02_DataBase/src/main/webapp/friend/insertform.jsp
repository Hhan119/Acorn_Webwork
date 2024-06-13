<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<div class="container bg-primary">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a class="text-muted" href="${pageContext.request.contextPath }/index.jsp">Home</a></li>
				<li class="breadcrumb-item"><a  class="text-muted" href="${pageContext.request.contextPath }/friend/list.jsp">친구목록</a></li>
				<li class="breadcrumb-item text-white active">친구등록</a></li>
			</ol>
		</nav>
		<h3 class="text-white">회원 추가 양식</h3>
		<form action="${pageContext.request.contextPath }/friend/insert.jsp" method="post">
			<div class="mb-3 row">
				<label for="name" class="form-label col-sm-2 text-white">이름</label>
				<div class="col-sm-2">
				<input type="text" name="name" class="form-control" placeholder="이름 입력.." />
				</div>
			</div>
			<div class="mb-3 row">
				<label for="name" class="form-label col-sm-2 text-white">전화번호</label>
				<div class="col-sm-5">
				<input type="text" name="phonenum" class="form-control" placeholder="전화번호 입력.." />
				</div>
			</div>
			<button type="submit" class="btn btn-success btn-lg">추가</button>
		</form>
	</div>
</body>
</html>