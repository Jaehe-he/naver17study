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
        
        div.box{
        	float: left;
        	width: 150px;
        	height:auto;
        	margin: 5px;
        	border:2px solid gray;
        	border-radius: 20px;
        	text-align: center;
        	background-color: lightgray;
        	padding: 5px;
        }
        
        div.box>figure>img{
        	width: 120px;
        	height: 120px;
        	border-radius: 20px;
        }
        
        div.box>figure>figcaption{
        	text-align: center;        
        }
     </style>
</head>
<%
	FoodDataList dataList=new FoodDataList();
	List<FoodDto> list=dataList.getAllDatas();
%>
<body>
<%
	for(FoodDto dto:list)
	{%>
		<div class="box">
			<figure>
				<img src="../image/food/<%=dto.getFoodPhoto() %>">
				<figcaption>
					<b><%=dto.getFoodName() %></b><br>
					<%=dto.getFoodPrice() %>원
				</figcaption>
			</figure>
		</div>
	<%}
%>
</body>
</html>

























