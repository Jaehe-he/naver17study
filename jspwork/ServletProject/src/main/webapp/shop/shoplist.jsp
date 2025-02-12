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
	
	.smallphoto{
		width : 30px;
		height : 30px;
		border : 1px solid gray;
		margin-right : 5px;
	}
	
	.box{
		width : 30px;
		height : 30px;
		border : 1px solid gray;
	}

	
	.tab thead th{
		text-align : center;
		background-color:#afeeee;
	}
	</style>
</head>
<body>
<div style="margin: 20px; width:600px;">
	<h5 class="alert alert-success">총 ${totalCount}개의 상품정보가 있습니다.
	<button type="button" class="btn btn-sm btn-info" style="float : right;"
	onclick="location.href='./addform'">상품등록</button>
	
	</h5>
	
	<table class="tab table table-bordered">
		<caption align="top"><b>전체 상품 목록</b></caption>
		<thead>
			<tr>
				<th width="50">번호</th>
				<th width="250">상품명</th>
				<th width="80">색상</th>
				<th width="120">가격</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list}" varStatus="i"> <!-- items="${list}"에 $무조건 붙여줘야함 그래야 request로 list 가져옴 -->
				<tr>
					<td align="center">${i.count}</td>
					<td>
						<img src="${dto.sphoto}" class="smallphoto">
						${dto.sangpum}
					</td>
					<td align="center">
						<div class="box" style="background-color:${dto.scolor}"></div>
					</td>
					<td align="right">
						<fmt:formatNumber value="${dto.sprice}" type="number"/>원
					</td>
					<td align="center">
						<button type="button" class="btn btn-sm btn-success"
						onclick="location.href='./detail?num=${dto.num}'">상세보기</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>