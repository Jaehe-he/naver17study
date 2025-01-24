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
     </style>
</head>
<body>
<div style="margin: 30px">
	<form action="./ex3_action.jsp" method="get"><!--생략시 기본값은 get -->
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th width="100">페이지번호</th>
				<td>
					<input type="number" name="pagenum" value="1">
				</td>
			</tr>
			<tr>
				<th width="100">검색단어</th>
				<td>
					<input type="text" name="search">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
						<button type="submit">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>

</div>
</body>
</html>









