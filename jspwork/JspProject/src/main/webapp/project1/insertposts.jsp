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
<div class = "container">
	<%@ include file = "nav.jsp" %>
	
	<div>
		<form action = "insertaction.jsp" method="post" id="insert" name="fr">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
    <thead>
        <tr>
            <th style="background-color: #eeeee; text-align: center;">명언 만들기</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <h6>카테고리</h6>
                <select name="list1" class="form-select">
                    <option selected>사랑</option>
                    <option>친구</option>
                    <option>이별</option>
                    <option>인생</option>
                    <option>시간</option>
                    <option>성공</option>
                    <option>노력</option>
                    <option>도전</option>
                    <option>공부</option>
                    <option>자신감</option>
                    <option>희망</option>
                    <option>위로</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
        </tr>
        <tr>
            <td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:350px;"></textarea></td>
        </tr>
        <tr>
            <td><input type="file" name="image"></td>
        </tr>
    </tbody>
</table>
			<input type="submit" class="btn-primary pull-right" value="글쓰기">
		</form>
	</div>
</div>

</body>
</html>