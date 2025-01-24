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
        	background-color: orange;
        }
     </style>
</head>
<body>
<h5 class="alert alert-danger">자바영역의 배열 출력하기</h5>
<%
	//이곳은 자바영역
	String []arr={"red","green","orange","blue","gray","magenta"};
%>
<table class="table table-bordered tab" style="width:200px;">
	<caption align="top"><b>배열 출력</b></caption>
	<tr>
		<th width="100">인덱스</th>
		<th width="100">색상</th>	
	</tr>
	<%
		for(int i=0;i<arr.length;i++)
		{%>
			<tr>
				<td align="center"><%=i+1%></td>
				<td style="color:<%=arr[i]%>">
					<%=arr[i]%>
				</td>
			</tr>
		<%}
	%>
</table>
<hr>
<table class="tab table table-striped" style="width:200px;">
	<tr>
		<th>번호</th><th>색상</th>
	</tr>
	<%
	int n=0;
	for(String s:arr)
	{%>
		<tr>
			<td align="center"><%= ++n%></td>
			<td style="background-color:<%=s%>"><%=s%></td>
		</tr>
	<%}
	%>
</table>
</body>
</html>















