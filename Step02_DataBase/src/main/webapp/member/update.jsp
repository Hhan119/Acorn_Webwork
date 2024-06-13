<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    //1. 폼전송되는 수정할 회원의 번호, 이름, 주소를 추출한다. 
  	int num=Integer.parseInt(request.getParameter("num"));
  	String name=request.getParameter("name");
  	String addr=request.getParameter("addr");
  	
  	//2. DB 에 수정반영한다.
  	MemberDto dto=new MemberDto(num, name, addr);
  	boolean isSuccess = new MemberDao().update(dto);
  	//3. 응답하기
  	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		/* 
			javascript를 로딩시켜서 Redirect 응답한 것과 같은 효과 내기 
			location.href = "이동할 경로"
		*/
	</script>
		<%if (isSuccess) { %>
			<p>수정하였습니다.</p>
			<a href="${pageContext.request.contextPath }/member/list.jsp">목록 확인</a>
			location.href="${pageContext.request.contextPath }/member/list.jsp";
		<%}else{ %>
			<p>실패하였습니다.</p>
			<a href="${pageContext.request.contextPath }/member/updateform.jsp">다시 작성</a>
			location.href="${pageContext.request.contextPath }/member/updateform.jsp?num=<%=num%>";
		<%} %>
</body>
</html>