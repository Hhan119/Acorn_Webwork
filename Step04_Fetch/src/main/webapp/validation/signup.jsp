<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/validation/form2.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>폼 유효성 검증 style 테스트</h1>
		<form action="signup.jsp" method="post">
			<div>
				<label class="form-label" for="nick">닉네임</label>
				<input class="form-control" type="text" name="nick" id="nick"/>
				<div class="invalid-feedback">이미 존재하는 닉네임 입니다!</div>
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="password" class="form-control" name="pwd" id="pwd"/>
				<div class="invalid-feedback">비밀 번호를 확인하세요</div>
			</div>
			<div>
				<label for="pwd2">비밀번호 확인</label>
				<input type="password" class="form-control" id="pwd2"/>
			</div>
			<button class="btn btn-primary" type="submit" disabled>가입</button>
		</form>
	</div>	
	<script>
		//닉네임을 입력했을때 실행할 함수 등록
		document.querySelector("#nick").addEventListener("input", (e)=>{
			//현재까지 입력한 닉네임을 읽어온다.
			const inputNick = e.target.value;
			//닉네임 사용가능 여부
			let canUse=false;
			if(inputNick != "gura"){
				canUse=true;
			}
			//일단 2개의 클래스를 모두 제거후 
			e.target.classList.remove("is-valid", "is-invalid");
			
			//만일 사용가능 하다면 
			if(canUse){
				//is-valid 클래스를 추가
				e.target.classList.add("is-valid");	
			}else{//그렇지 않다면
				//is-invalid 클래스를 추가 
				e.target.classList.add("is-invalid");
			}
		});
	</script>
</body>
</html>







