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
<div style="margin:20px; width:500px;">
	<table>
		<tr>
			<td align="center" valign="middle" width="250">
				<img src="${dto.sphoto}"
				style="width:200px;border:2px solid black;">
			</td>
			<td valign="middle">
				<h5>상품명 : ${dto.sangpum} </h5>
				<h5>색 상 : <div style="display:inline-block; background-color:${dto.scolor}">${dto.scolor}</div></h5>
				<h5>수 량 : ${dto.scnt}개 </h5>
				<h5>가 격 :
					<fmt:formatNumber value="${dto.sprice}" type="currency"
					currencySymbol="￦" maxFractionDigits="0"/>
				</h5>
				<h5>입고일 : ${dto.ipgoday}</h5>
				<h5>등록일 :
					<fmt:formatDate value="${dto.writeday}"
					pattern="yyyy-MM-dd HH:mm"/>
				</h5>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;" onclick="location.href='./addform'">상품등록</button>
				
				<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;" onclick="location.href='./list'">상품목록</button>
				
				<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;" onclick="location.href='./updateform?num=${dto.num}'">상품수정</button>
			
				<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;" onclick="location.href='./delete?num=${dto.num}'">상품삭제</button>
	</table>
</div>
</body>
</html>