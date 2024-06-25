
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/validation/form.jsp</title>
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
		// 닉네임 유효성 여부를 관리할 변수만들고 초기값 부여
		let isNickvalid = false;
		// 비밀번호 유효성 여부를 관리할 변수 만들고 초기값 부여
		let isPwdvalid = false;
		
		// 닉네임과 비밀번호의 유효성 여부를 이용해서 버튼에 disabled 속성을 추가 혹은 제거하는 함수 
		const checkForm = ()=>{
			// 만일 닉네임도 유효하고 그리고 비밀번호도 유효 하다면
			if(isNickvalid && isPwdvalid){
				document.querySelector("[type=submit]").removeAttribute("disabled");
			} else {
				document.querySelector("[type=submit]").setAttribute("disabled", "");
			}
		};
		
		
		
	
		// 닉네임을 입력했을때 실행할 함수 등록
		document.querySelector("#nick").addEventListener("input", (e)=>{
			// 현재까지 입력한 닉네임을 읽어온다.
			const inputNick = e.target.value;
			
			// fetch() 함수를 이용해서 get 방식으로 입력한 닉네임을 보내고 사용가능 여부를 json 으로 응답받는다.
			fetch("check_nick.jsp?nick="+inputNick)
				.then(res=>res.json())
				// data 는 {canUse:true} or {canUse:false} 형태의 object 이다. 
				.then(data=>{
					// 일단 2개의 클래스를 모두 제거후 
					e.target.classList.remove("is-valid", "is-invalid");
				
					// 사용이 가능 하다면 
					if(data.canUse){
						// is-valid 클래스를 추가
						e.target.classList.add("is-valid");	
						isNickvalid=true;
					}else{//그렇지 않다면
						// is-invalid 클래스를 추가 
						e.target.classList.add("is-invalid");
						isNickvalid=false;
				}
					checkForm();
			});
		});
		
		// 함수를 미리 만든다.
		const checkPwd = ()=>{
			// 양쪽에 입력한 비밀번호를 읽어와서
			let pwd =document.querySelector("#pwd").value;
			let pwd2 =document.querySelector("#pwd2").value;
			
			// 일단 클래스를 제거하고 
			document.querySelector("#pwd").classList.remove("is-valid", "is-invalid");
			if(pwd == pwd2){
				document.querySelector("#pwd").classList.add("is-valid");
				isPwdvalid = true;
			}else{
				document.querySelector("#pwd").classList.add("is-invalid");
				isPwdvalid = false;
			}
			checkForm();
	};
		//미리 만든 함수를 이벤트 리스너 함수로 등록을 해준다. 
		document.querySelector("#pwd").addEventListener("input", checkPwd);
		document.querySelector("#pwd2").addEventListener("input", checkPwd);
			
			
			
	</script>
</body>
</html>







