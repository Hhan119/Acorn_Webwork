<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// GET 방식 parameter를 전송하고 입력한 닉네임을 읽어온다.
    	String nick = request.getParameter("nick");
    	String pwd2 = request.getParameter("pwd2");
    
    	// DB에 존재하는지 확인해서 사용 가능한 닉네임인지 여부를 json 문자열로 응답 해야한다.
    	boolean canUse=true;
    	if(nick.equals("chelsea")){
    		canUse=false;
    	}
    	
    %>

   { "canUse" : <%=canUse %>}
