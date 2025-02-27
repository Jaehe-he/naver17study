<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>502 jsp study</title>
<link
	href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body * {
	font-family: 'Jua';
}

.tabform tbody th {
	background-color: orange;
}

.photos{
	margin-bottom:10px;
}

.photos img {
	width: 40px;
	height: 40px;
	border: 1px solid gray;
	border-radius: 10px;
	margin: 5px;
}

.photos .delicon {
	position: relative;
	color: red;
}
</style>
<script type="text/javascript">
   		$(function(){
   			photolist(); //처음 로딩 시 사진들 출력
   			
   			//개별 사진 삭제
   			$(document).on("click", ".delicon", function(){
   				//아이콘에 넣어둔 num 얻기
   				let num=$(this).attr("num");
   				
   				$.ajax({
   					type:"get",
   					dataType:"text", //text : return 타입 없음
   					data : {"num" : num},
   					url:"./photodel",
   					success:function(res){
   						//사진 삭제 후 사진 목록 다시 출력
   						photolist();
   					}
   				});
   				
   			});
   			
   		});
   		function photolist(){
   			let idx = ${dto.idx};
   			let url=`${naverurl}`;
   			$.ajax({
   				type:"get",
   				dataType:"json",
   				data:{"idx":idx},
   				url:"./photolist",
   				success:function(res){
   					let s ="";
   					$.each(res,function(i,item){
   						s+=
   							`
   							<img src="\${url}/board/\${item.filename}">
   							<i class="bi bi-x-circle delicon" num="\${item.num}"></i>
   							`;
   					});
   					$(".photos").html(s);
   				}
   			});
   		}
   </script>
</head>
<body>
	<!-- 로그인을 안할경우 경고 후 이전페이지로 이동 -->
	<c:if test="${sessionScope.loginstatus==null}">
		<script>
		alert("회원게시판입니다\n 먼저 로그인을 해주세요.");
		history.back();
	</script>
	</c:if>

	<jsp:include page="../../layout/title.jsp" />

	<div style="margin: 20px; width: 600px;">
		<form action="./update" method="post" enctype="multipart/form-data">
			<!-- hidden -->
			<input type="hidden" name="idx" value="${dto.idx}">
			<input type="hidden" name="pageNum" value="${pageNum}">

			<table class="tabform table table-bordered">
				<caption align="top">
					<h5>글수정</h5>
				</caption>
				<tbody>
					<tr>
						<th width="150">제 목</th>
						<td><input type="text" name="subject" class="form-control"
							required="required" autofocus="autofocus" value="${dto.subject}">
						</td>
					</tr>

					<tr>
						<th width="150">사 진</th>
						<td>
							
							<div class="photos"></div>
							<input type="file" name="upload" class="form-control" multiple="multiple">
						</td>
					</tr>

					<tr>
						<th width="150">내 용</th>
						<td><textarea name="content" class="form-control"
								required="required" style="width: 100%; height: 150px;">${dto.content}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-outline-secondary"
								style="width: 100px;">글수정</button>
							<button type="button" class="btn btn-outline-secondary"
								style="width: 100px;" onclick="location.href='./detail?idx=${dto.idx}&pageNum=${pageNum}'">이전으로</button> <!-- history.back()은 수정한 걸 반영하지 않음 -->
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>