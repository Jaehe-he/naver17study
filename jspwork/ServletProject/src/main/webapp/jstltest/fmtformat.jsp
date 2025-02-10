<%@page import="java.util.Date"%>
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
<div style="margin: 20px;">
	<!--  자바코드로 날짜를 얻어서 JSTL의 today 변수에 직접 저장하려면 -->
	<c:set var="today" value="<%=new Date() %>"/>
	<h5>${today}</h5>
	<h5>
		<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
	</h5>
	<h5>
		<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss"/>
	</h5>
	<h5>
		<fmt:formatDate value="${today}" pattern="yyyy-MM-dd a hh:mm"/>
	</h5>
	<h5>
		<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm EEE"/>
	</h5>
	
	<!-- 날짜 format 양식을 지정 후 변수 day1에 저장하기 -->
	<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 HH시"
	var="day1"/>
	
	<h1>${day1}</h1>
	<hr>
	<c:set var="money" value="4567890"/>
	<c:set var="average" value="89.56789"/>
	
	<h5> 급여 : ${money}</h5>
	<h5> 평균 : ${average}</h5>
	<h5> 급여 :
		<fmt:formatNumber value="${money}" type="number"/> <!-- ,찍혀서 나옴 -->
	</h5>
	<h5>
		급여 :
		<fmt:formatNumber value="${money}" type="currency" currencySymbol="￦"
		maxFractionDigits="0"/>
	</h5>
	<h5>
		 급여:
		 <fmt:formatNumber value="${money}" type="number"/>원
	</h5>
	<h5>
		평균(소수점이하 자릿수 2자리):
		<fmt:formatNumber value="${average}" maxFractionDigits="2"/>
	</h5>
	
	<c:set var="num1" value="45.6789"/>
	<c:set var="num2" value="27.8"/>
	
	<!-- pattern="0.00" : 무조건 소수점 두자리로 맞춤 -->
	<h5>
		평균(소수점이하 자릿수 2자리):
		<fmt:formatNumber value="${num1}" pattern="0.00"/>
		,
		<fmt:formatNumber value="${num2}" pattern="0.00"/>
	</h5>
	<!-- pattern="0.##" : 두자리로 맞추지만, 값이 없을 경우엔 출력 안됨 -->
	<h5>
		평균(소수점이하 자릿수 2자리):
		<fmt:formatNumber value="${num1}" pattern="0.##"/>
		,
		<fmt:formatNumber value="${num2}" pattern="0.##"/>
	</h5>
</div>
</body>
</html>