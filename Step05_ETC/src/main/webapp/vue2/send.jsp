<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    		String msg = request.getParameter("msg");
    %>
{"toClient":"클라이언트에게 메세지를 정상적으로 잘 받았습니다", "msg" : "<%=msg %>"}