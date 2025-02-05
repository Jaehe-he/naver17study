<!-- 내가 강사님께서 내준 detail 문제를 풀어본 것 -->
<%@page import="shop.data.ShopDto"%>
<%@page import="shop.data.ShopDao"%>
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
	
	.tab1 {
		width : 600px;
		margin : auto;
	}
	
	.tab1 img{
		width : 400px;
	}
	
	.btn {
		margin-top: auto;
		margin-left : 30px;
	}
	</style>
</head>
<%
	//1. num 읽기
	int num = Integer.parseInt(request.getParameter("num"));
	
	//2. dao 선언
	ShopDao dao = new ShopDao();
	
	//3. num에 해당하는 dto 얻기(dao에 메서드 추가해야함 : getSangpum(int num))
	ShopDto dto = dao.getSangpum(num);
%>
<body>
<!-- table을 이용해서 상세페이지 만들기. 맨 아래에 수정, 삭제, 목록, 상품 추가버튼 생성 -->
<div style="margin:20px;">
	<table class="table table-bordered tab1">
		<tr>
			<td> <img src = "<%=dto.getSphoto()%>"> </td>
			<td>
				<h6> 상품명 : <%=dto.getSangpum() %></h6>
				<div style = "width : 30px; height : 30px; background-color : <%=dto.getScolor() %>"> </div>
				<h6> 수량 : <%=dto.getScnt() %></h6>
				<h6> 단가 : <%=dto.getSprice() %></h6>
				<h6> 입고일 : <%=dto.getIpgoday() %></h6>
				<h6> 작성일 : <%=dto.getWriteday() %></h6>
			</td>
	</table>
	
	<div class="btn">
		<button type="button" class="btn btn-sm btn-success" onclick = "location.href='./updateshop.jsp?num=<%=dto.getNum()%>'">수정</button>
		<button type="button" class="btn btn-sm btn-danger" onclick = "location.href='./deleteshop.jsp?num=<%=dto.getNum()%>'">삭제</button>
		<button type="button" class="btn btn-sm btn-info" onclick = "location.href='./listshop.jsp?num=<%=dto.getNum()%>'">목록</button>
	</div>
</div>
</body>
</html>