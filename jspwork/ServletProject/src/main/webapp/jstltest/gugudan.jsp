<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> <!-- 이걸 import해야 c:를 사용 가능 -->
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 이걸 import해야 fmt:를 사용 가능 -->
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
<h3 class="alert alert-danger">구구단 출력</h3>
<table border = "1">
	<tr>
		<c:forEach var="dan" begin="2" end="9">
			<h5>${dan}단</h5>
		</c:forEach>
	</tr>
	<c:forEach var="gu" begin="1" end="9">
		<tr>
			<td>
				<c:forEach var="dan" begin="2" end="9">
					${dan} X ${gu} = ${dan*gu}
				</c:forEach>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>