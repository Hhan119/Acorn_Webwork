<%@page import="test.frienddao.FriendDao"%>
<%@page import="test.frienddto.FriendDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 // 1. GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 알아낸다. 
  	int num=Integer.parseInt(request.getParameter("num"));

 	// 2. FriendDao 객체를 이용해서 실제 DB에서 삭제
 	new FriendDao().delete(num);
 	
 	// 3. 응답하기
  	// 특정 경로로 요청을 다시 하라는 ridirect 응답하기
  	// list.jsp -> delete.jsp -> list.jsp 이동하는 방식이기 떄문에 마치 새로고침 하는 듯한 느낌을 줄 수 있다.
 	String cPath=request.getContextPath();
  	response.sendRedirect(cPath+"/friend/list.jsp");
    %>
