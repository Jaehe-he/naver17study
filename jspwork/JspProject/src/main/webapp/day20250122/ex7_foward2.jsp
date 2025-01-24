<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
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
<body>
<%
	//request 에 저장된 list 를 얻어보자
	List<String> list=(List<String>)request.getAttribute("list");

//foward 로 이동한 경우 request 가 그대로 유지되므로
//list를 가져올수 있다

    if(list==null)    	
    	 out.print("<h1>list 가 없어요</h1>");
    else{
    	 out.print("<h1>list 가 있어요</h1>");
    	 out.print("<h1>갯수:"+list.size()+"</h1>");
    }
%>
</body>
</html>

















