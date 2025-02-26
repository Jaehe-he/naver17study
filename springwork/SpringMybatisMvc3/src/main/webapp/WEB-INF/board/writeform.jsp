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
      body * {
         font-family: 'Jua';
      }
      
      .tabform tbody th{
      	background-color : orange;
      }
   </style>
</head>
<body>
<!-- 로그인을 안할경우 경고 후 이전페이지로 이동 -->
<c:if test="${sessionScope.loginstatus==null}">
	<script>
		alert("회원게시판입니다\n 먼저 로그인을 해주세요.");
		history.back();
	</script>
</c:if>

<jsp:include page="../../layout/title.jsp"/>

<div style="margin:20px; width:600px;">
	<form action="./insert" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="idx" value="${idx}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="regroup" value="${regroup}">
		<input type="hidden" name="restep" value="${restep}">
		<input type="hidden" name="relevel" value="${relevel}">
		
		<table class="tabform table table-bordered">
			<caption align="top">
				<h5>${idx==0?"[새글쓰기]":"[답글쓰기]"}</h5>
			</caption>
			<tbody>
				<tr>
					<th width="150">제 목</th>
					<td>
						<input type="text" name="subject" class="form-control"
						required="required" autofocus="autofocus">
					</td>
				</tr>
				
				<tr>
					<th width="150">사 진</th>
					<td>
						<input type="file" name="upload" class="form-control"
						multiple="multiple">
					</td>
				</tr>
				
				<tr>
					<th width="150">내 용</th>
					<td>
						<textarea name="content" class="form-control"
						required="required" style="width:100%;height:150px;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-secondary"
						style="width:100px;">글저장</button>
						<button type="submit" class="btn btn-outline-secondary"
						style="width:100px;" onclick="history.back()">이전으로</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>