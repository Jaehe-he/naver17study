<%@page import="test.data.FoodDto"%>
<%@page import="java.util.List"%>
<%@page import="test.day0121.FoodDataList"%>
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
        
        .tab th{
        	background-color: pink;
        }
     </style>
</head>
<%
  //FoodDataList 생성
  FoodDataList dataList=new FoodDataList();
  //list 전체 데이타 반환받기
  List<FoodDto> list=dataList.getAllDatas();
%>
<body>
<div style="margin: 20px">
	<table class="tab table table-bordered" style="width:550px;">
		<caption align="top">
			<h3><b>배달 음식 목록</b></h3>
		</caption>
		<tr>
			<th width="50">번호</th>
			<th width="200">메뉴</th>
			<th width="60">수량</th>
			<th width="100">가격</th>
			<th>배달일</th>
		</tr>
		<%
		int no=0;
		for(FoodDto dto:list)
		{%>
		<tr>
			<td align="center"><%=++no %></td>
			<td>
				<img src="../image/food/<%=dto.getFoodPhoto() %>"
				  width="50" height="50" border="1"
				  class="rounded-circle" hspace="10">
				 <b><%=dto.getFoodName() %></b>
			</td>
			<td align="right"><%=dto.getSu()%>개</td>
			<td align="right"><%=dto.getFoodPrice()%>원</td>
			<td><%=dto.getFoodDay() %></td>

		</tr>
		<%}
		%>
	</table>
</div>
</body>
</html>


















