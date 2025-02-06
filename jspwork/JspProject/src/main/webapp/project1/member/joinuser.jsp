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
	<h2> 회원가입 </h2>
	<form action = "joinaction.jsp" method="post" id="join" name="fr">
		아이디 : <input type="text" name = "id" required="required">
		<input type="button" value="아이디 중복 확인" class="dup" id="btn">
		<br>
		비밀번호 : <input type="password" name = "pw" required = "required"><br>
		비밀번호 재확인 : <input type="password" name = "pwcheck" required = "required"><br>
		이름 : <input type="text" name= "name" required = "required"><br>
		전화번호 :
		<select name = "phone1">
			<option selected>010</option>
			<option>02</option>
			<option>031</option>
			<option>051</option>
		</select>
		- <input type="text" name="phone2" size="5" required="required">
		- <input type="text" name="phone3" size="5" required = "required">
		<br>
		<input type="radio" name="gender" value="m" checked>남자
		<input type="radio" name="gender" value="f"> 여자
		
		<input type="submit" value="가입하기">
	</form>
</body>
</html>