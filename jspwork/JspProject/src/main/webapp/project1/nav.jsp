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
	<nav  class="navbar navbar-expand-lg naver-light" style="background-color : #00008B" height="30px"">
		<div class="container">
			<a class="navbar-brand" style="color : #FFF;" href="../project1/main.jsp">
				<img src="../image/project1/logo1.png" alter="" width="100" height="50" class="d-inline-block align-text-center">
			</a>
		    
		 	<!-- 로그인 상태 확인 -->
		 	<%
		 		String id = (String) session.getAttribute("id");
		 		if(id != null) {
		 	%>
		 	<!-- 로그인 상태에서 사용자 이름 표시 -->
		 	<a class="nav-link active" href= "login.jsp" style="color : #FFF;"><%=id %>님</a>
		 	<%
		 		} else {
		 	%>
		 	
		 	<!-- 로그인하지 않은 상태에서 로그인 표시 -->
		 	<form method = "get" action = "../project1/member/login.jsp">
		 		<div class="d-flex">
		 			<button class="btn btn-outline-success" type="submit" style="color:#FFF;">로그인</button>
		 		</div>
		 	</form>
		 	<%
		 		}
		 	%>
		 	&nbsp;&nbsp;
		</div>
	</nav>
</body>
</html>