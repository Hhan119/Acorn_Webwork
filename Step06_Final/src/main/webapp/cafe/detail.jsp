<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Integer num = Integer.parseInt(request.getParameter("num"));
    	
    	CafeDto dto = CafeDao.getInstance().getData(num);
    	
    	//세션 아이디를 읽어와서
    	String sessionId=session.getId();
    	// 이미 읽었는지 여부를 알아낸다.
    	boolean isReaded = CafeDao.getInstance().isReaded(num, sessionId);
    	if(!isReaded){
    		// 글 조회수도 1 증가 
    		CafeDao.getInstance().addViewCount(num);
			// 이미 읽었다고 표시한다.    		
    		CafeDao.getInstance().insertReaded(num, sessionId);
    		
    		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>선택하신 글 정보입니다</h1>
		<table class="table table-bordered border-primary ">
				<tr>
					<th class="table-primary">번호</th>
					<td><%=dto.getNum() %></td>
				</tr>
				<tr>
					<th class="table-primary">작성자</th>
					<td><%=dto.getWriter() %></td>
				</tr>
				<tr>
					<th class="table-primary">제목</th>
					<td><%=dto.getTitle() %></td>
				</tr>
				<tr>
					<th class="table-primary">조회수</th>
					<td><%=dto.getViewcount() %></td>
				</tr>
				<tr>
					<th class="table-primary">등록일</th>
					<td><%=dto.getRegdate() %></td>
				</tr>
				
				<tr>
					<th class="table-primary table-text-align:center" >글 내용</th>
					<td colspan="2">
						<div class="d-flex justify-content-center"><%=dto.getContent() %></div>
					</td>
				</tr>
		</table>
		<%
			//로그인된 아이디가 있으면 읽어온다(null 일수도 있다)
			String id=(String)session.getAttribute("id");
		%>
		<%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
		<%if(dto.getWriter().equals(id)){ %>
			<a class="btn btn-outline-success btn-sm" href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
			<a class="btn btn-outline-danger btn-sm" href="javascript:" onclick="deleteConfirm()">삭제</a>
			<a class="btn btn-outline-info btn-sm" href="${pageContext.request.contextPath }/cafe/list.jsp">글 목록 보기</a>
			<script>
				function deleteConfirm(){
					const isDelete=confirm("이 글을 삭제 하겠습니까?");
					if(isDelete){
						//javascript 를 이용해서 페이지 이동 시키기
						location.href="private/delete.jsp?num=<%=dto.getNum()%>";
					}
				}
			</script>
		<%} %>		
		
</body>
</html>