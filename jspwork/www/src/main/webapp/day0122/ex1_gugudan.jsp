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
        	background-color: black;
        	color:yellow;
        	text-align: center;
        }
     </style>
</head>
<body>
<div style="margin: 10px;">
<table class="table table-bordered tab" style="width: 90%;">
	<caption align="top"><h3><b>[구구단]</b></h3></caption>
	<tr>
	<%
	for(int dan=2;dan<=9;dan++)
	{%>
		<th><%=dan%>단</th>
	<%}
	%>
	</tr>
	<%
	for(int i=1;i<=9;i++)
	{%>
		<tr align="center">
		<%for(int dan=2;dan<=9;dan++)
		{%>
			<td><%=dan %>X<%=i %>=<%=dan*i %></td>
		<%}%>
		</tr>
	<%}
	%>
</table>
</div>
</body>
</html>











