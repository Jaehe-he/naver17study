<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
        
        img.large{
        	width: 300px;
        	height:350px;
        	border: 2px solid black;
        }
        
        img.small{
        	cursor: pointer;
        	width: 80px;
        	height: 80px;
        	border: 1px solid gray;
        	margin: 10px;
        }
        
        .colorbox{
        	display: inline-block;
        	width:30px;
        	height: 30px;
        	border: 1px solid black;
        	border-radius: 100px;
        }
     </style>
</head>
<body>
<div style="margin: 20px;width: 500px;">
	<table>
		<tr>
			<td width="120">
				<c:forTokens var="photo" items="${dto.sphoto}" delims=",">
					<img src="../save/${photo}" class="small">
					
					<script type="text/javascript">
						$("img.small").click(function(){
							$("img.large").attr("src",$(this).attr("src"));
						});
					</script>
				</c:forTokens>
			</td>
			<td>
				<img src="../save/${dto.mainPhoto}" class="large">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div style="margin: 20px 100px;font-size: 17px;">
					<mark>상품명 : ${dto.sangpum}</mark><br>
					가 격 : <fmt:formatNumber value="${dto.sprice}" type="number"/>원<br>
					색 상 : ${dto.scolor}
					 <div class="colorbox"
					 style="background-color: ${dto.scolor}"></div>
					<br>
					입고일 : ${dto.ipgoday}<br>
					등록일 : <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
				</div>
			</td>		
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 90px;"
				onclick="location.href='./addform'">상품등록</button>
				
				<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 90px;"
				onclick="location.href='./list'">목록</button>
				
				<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 90px;"
				onclick="location.href='updateform?num=${dto.num}'">수정</button>
				
				<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 90px;"
				onclick="">삭제</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>