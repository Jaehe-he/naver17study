<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>502 jsp study</title>
	<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<style>
	body *{
		font-family: 'Jua';
	}
	</style>
</head>
<%
	//파일이 업로드되는 실제 위치, 코드가 있는 위치가 아니라
	//톰캣서버에 배포된 프로젝트의 위치 찾아야한다
	String realFolder=getServletContext().getRealPath("/upload"); //()안에 실제 업로드할 파일명 작성
	//업로드할 파일의 크기
	int uploadSize=1024*1024*3; //3MB    ... 1KB = 1024byte
	MultipartRequest multipartRequest = null;
	//Tomcat9까지는 가능했지만 Tomcat10부터는 JakartaEE가 적용되어서 오류남 (잘 안쓰는 라이브러리)
/* 	try{
		multipartRequest = new MultipartRequest(request, realFolder, uploadSize,
				"utf-8", new DefaultFileRenamePolicy());
	}catch(Exception e){
		out.print("파일 업로드 오류발생 : " +e.getMessage());
	 }*/
%>

<h5> 실제 업로드되는 위치 </h5>
<h6> <%=realFolder %></h6>
<body>

</body>
</html>