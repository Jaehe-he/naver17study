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
		String idsave = (String)session.getAttribute("idsave");
		String id = (String)session.getAttribute("id");
	
	if(idsave == null)
		id="";
	%>
	<h2> 로그인 </h2>
	<form action = "loginaction.jsp" method="post" id="login" name="lo">
		아이디 : <input type="text" name = "id" required="required">
		<br>
		비밀번호 : <input type="password" name = "pw" required = "required"><br>
		<label>
			<input type="checkbox" name="idsave" <%=idsave == null?"":"checked" %>>
			아이디저장
		</label>
		
		<input type="submit" value="로그인">
	</form>
</body>
</html>