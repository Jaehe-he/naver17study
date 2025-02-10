<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
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
<%
	//원래는 서블릿에서 받아와야하는데 일단 여기서 직접 List를 생성해서 출력해보자
	String []colors={"green", "red", "orange", "pink", "tomato","blue"};

	List<String> list = Arrays.asList("K-041","K-036","K-045","K-039","K-034","K-054");
%>
<!-- 자바영역의 변술르 JSTL 변수로 변환 -->
<c:set var="colors" value="<%=colors %>"/> <!-- 이름 같아도 되고 달라도 됨 -->
<c:set var="list" value="<%=list %>"/>

<body>
<h3 class="alert alert-danger">JSTL - for 문</h3>
<c:forEach var="mycolor" items="${colors}" varStatus="i">
	<h5 style="color:${mycolor}">${i.count}(${i.index}) : ${mycolor}</h5> <!-- i.count : 일련번호, i.index : 말그대로 인덱스 -->
</c:forEach>
<hr>
<c:forEach var="mycolor" items="${colors}" varStatus="i" begin="1" end="3">
	<h5 style="color:${mycolor}">${i.count}(${i.index}) : ${mycolor}</h5>
</c:forEach>
<hr>
<c:forEach var="photo" items="${list}">
	<img src="../image/photo/${photo}.png" width="100" height="100"
	border="1" hspace="5">
</c:forEach>
<hr>
<c:forEach var="carno" begin="1" end="15" step="1"> <!-- step은 1일때 생략 가능 -->
	<img src="../image/mycar/mycar${carno}.png" width="100" height="100">
</c:forEach>
<hr>
<c:set var="msg" value="장미꽃, 국화꽃, 채송화, 다알리아, 프리지아"/> <!-- 하나의 문자열인데 ,(comma)로 되어있음 -->
<!-- 문자열 msg를 ,(comma)로 분리하여 출력하기 -->
<c:forTokens var="s" items="${msg}" delims="," varStatus="i"> <!-- delims : 무엇으로 분리할 것인가. varStatus : 무엇으로 시작할것인가 -->
	<h5>${i.count} : ${s}</h5>
</c:forTokens>

<
</body>
</html>