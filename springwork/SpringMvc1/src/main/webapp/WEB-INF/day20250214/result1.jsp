<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      body * {
         font-family: 'Jua';
      }
   </style>
</head>
<body>
<img src="./image/mycar/mycar11.png" width="200">
<h2> Controller 부터 Forward</h2>
<h3> 메세지 : ${message}</h3>
<h3> 오늘날짜 : ${today}</h3>
<h3>
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd Hh:mm EEEE"/>
</h3>
<hr>
<ul>
	<li>
		<a href="./board/list">./board/list</a>
	</li>
	<li>
		<a href="./board/list.do">./board/list.do</a>
	</li>
	<li>
		<a href="./shop/list">./shop/list</a>
	</li>
	<li>
		<a href="./bitcamp/study">./bitcamp/study</a>
	</li>
	<li>
		<a href="./bitcamp/study2">./bitcamp/study2</a>
	</li>
	
</ul>
</body>
</html>