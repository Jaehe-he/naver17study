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
	
	.nara1{
		background-color : yellow;
		color : blue;
	}
	
	.nara2{
		background-color : pink;
		color : gray;
	}
	
	.nara3{
		background-color : black;
		color : yellow;
	}
	
	.nonara{
		background-color : green;
		color : puple;
	}
	</style>
</head>
<body>
<div style="margin : 20px;">
	<form action="./form_choose.jsp" method="post">
		이름 입력 : <input type="text" name="myname"></br>
		가고싶은 나라 입력 : <input type="text" name="mynara"><br>
		<button type="submit">결과 확인</button>
	</form>

	<!-- JSTL로 폼태그에 입력한 값을 바로 읽어오기 -->
	<!-- param.myname과 param.mynara가 있을때만 출력 -->
	<c:if test="${!empty param.myname && !empty param.mynara}"> <!-- and라고 적어도 되고 &&라고 적어도 됨 -->
		<div style="margin:20px;">
			<h5> 이름 : ${param.myname} </h5>
			<h5> 가고싶은 나라 : ${param.mynara} </h5>
			
			<hr>
			<c:set var="nara" value="${param.mynara}"/>
			
			<c:choose>
				<c:when test="${nara=='프랑스'}">
					<h2 class="nara1">프랑스는 에펠탑이 아름답습니다.</h2>
				</c:when>
				<c:when test="${nara=='미국'}">
					<h2 class="nara2">미국은 자유의 여신상이 아름답습니다.</h2>
				</c:when>
				<c:when test="${nara=='한국'}">
					<h2 class="nara3">한국은 비빔밥이 매우 맛있습니다. </h2>
				</c:when>
				<c:otherwise>
					<h2 class="nonara">${nara} 나라는 무엇이 아름다울까요? </h2>
				</c:otherwise>
			</c:choose>
			
		</div>
	</c:if>
	
	<!-- 이름과 나라명 중 하나라도 값이 없을 경우 h2태그로
	"두 데이터를 모두 입력해주세요"라고 출력 -->
	<c:if test="${!empty param.myname || !empty param.mynara}"> <!-- or라고 적어도 되고, ||라고 적어도 됨 -->
		<h6> 두 데이터를 모두 입력해주세요. </h6>
	</c:if>
</div>

</body>
</html>