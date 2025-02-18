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
        body *{
            font-family: 'Jua';
        }
     </style>
</head>
<body>
<form action="./process3" method="post">
	사원명 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>
	성별 : 
		<input type="radio" name="gender" value="남자" checked="checked">남자
		&nbsp;
		<input type="radio" name="gender" value="여자">여자
		<br>
	주소 : <input type="text" name="addr"><br>
	<button  type="submit">전송</button>
</form>
</body>
</html>