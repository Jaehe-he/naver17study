<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<h2> TestServletEx1으로부터 forward</h2>

<!-- request 영역의 변수는 requestScope로 가져온다(생략 가능) -->
<h3> 오늘 날짜 : ${requestScope.today} </h3>
<h3> 오늘 날짜 : ${today} </h3>
<h3> 오늘 날짜 : ${today2} </h3>
<h3> 이름 : ${myname} </h3>
<h3> 나이 : ${myage} </h3>
<hr>
<!-- jstl로 변수 선언과 연산자 공부하기  -->
<c:set var="su1" value="7"/>
<c:set var="su2" value="4"/>

<h5> 숫자 1 : ${su1}</h5>
<h5> 숫자 2 : ${su2}</h5>
<h6> 더하기 : ${su1+su2}</h6>
<h6> 빼기 : ${su1-su2}</h6>
<h6> 곱하기 : ${su1*su2}</h6>
<h6> 나누기1 : ${su1/su2}</h6>
<h6> 나누기2 : ${su1 div su2}</h6>
<h6> 나머지1 : ${su1 % su2}</h6>
<h6> 나머지2 : ${su1 mod su2}</h6>

<!-- jstl에는 증감연산자가 없다. 그러면 su1에 1을 더해서 출력하려면 -->
<c:set var = "su1" value="${su1+1} "/>
<h6> su1에 증가 : ${su1}</h6>

<!-- 나이에 따라 성인인지 미성년자인지 출력해보자 -->
<c:if test="${myage>=30}">
	<h2 style="color:blue;">${myname}님은 성인입니다.</h2> <!-- else가 없어서 또 적어줘야함 -->
</c:if>
<c:if test="${myage<30}">
	<h2 style="color:red;">${myname}님은 미성년자입니다.</h2>
</c:if>

</body>
</html>