<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 파일 시스템 상에서 webapp의 upload 폴더까지의 절대경로를 얻어낸다.
    	String realPath = application.getRealPath("/upload");
    	// 해당 경로를 access 할 수 있는 파일 객체 생성
    	File f = new File(realPath);
    	// 만약에 폴더가 존재하지 않으면 
    	if(!f.exists()){ 
    		f.mkdir(); // upload 폴더 만들기
    	}
    	
    	// 내부적으로 필요한 httpServletRequest 객체 전달, 업로드 된 파일 저장경로, 최대 업로드 사이즈 제한, 한글 파일명 꺠지지 않도록 설정, 동일한 파일이 존재하면 자동으로 파일을 rename해서 저장
    	MultipartRequest mr= new MultipartRequest(request, realPath, 1024*1024*100, "utf-8", new DefaultFileRenamePolicy());
    			
    	
    	/*
    		위의 MultipartRequest 객체가 예외가 발생하지 않고 잘 생성 되었다면 파일 업로드가 성공 된 것이다. 
    		즉, mr에 들어있는 참조값을 이용해서 폼 전송된 값을 추출해서 DB에 저장만 잘 하면 된다. 
    	*/
    	// title이라는 파라미터명으로 전달되는 파일의 제목(설명) 얻어내기
    	String title = mr.getParameter("title");
    	// 업로드 된 파일의 원본 파일명
    	String orgFileName = mr.getOriginalFileName("myFile");
    	// 업로드 된 파일이 저장된 파일명(원본 파일명이랑 다를 수 있다.)
    	String saveFileName = mr.getFilesystemName("myFile");
    	// 업로드 된 파일의 크기(다운로드 해줄 때 필요)
    	long fileSize=mr.getFile("myFile").length();
    	
    	/*
    		webapp/upload 폴더에 파일을 저장 했을때, 그 폴더가 실제 서버의 파일 시스템에 있는 파일 위치를 출력해보기
    	*/
    	//System.out.println(realPath);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fileup/upload.jsp</title>
</head>
<body>


<p>
		title : <strong><%=title %></strong> <br />
		원본 파일명 : <strong><%=orgFileName %></strong> <br />
		저장된 파일명 : <strong><%=saveFileName %></strong> <br />
		파일의 크기 : <strong><%=fileSize %></strong> byte <br />
		파일이 저장된 실제 경로 : <strong><%=realPath %></strong> <br />
		<a href="${pageContext.request.contextPath}/test/download?orgFileName=<%=orgFileName%>&saveFileName=<%=saveFileName%>&fileSize=<%=fileSize%>">다운로드</a>
	</p>


</body>
</html>