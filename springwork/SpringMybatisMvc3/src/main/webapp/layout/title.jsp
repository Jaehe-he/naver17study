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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body * {
	font-family: 'Jua';
}

a:link, a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: hotpink;
}

ul.mymenu {
	list-style: none;
	margin: 10px;
	display: block;
}

ul.mymenu li {
	float: left;
	width: 100px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background-color: #ffe4e1;
	margin-right: 10px;
	border: 1px solid gray;
	border-radius: 20px;
}

ul.mymenu li:hover {
	background-color: #d3d3d3;
	box-shadow: 5px 5px 5px gray;
}

.logintab tbody th {
	background-color: #e0ffff;
}

img.profilephoto{
	width:40px;
	height: 40px;
	border: 1px solid gray;
	border-radius : 100px;
	margin-right : 10px;
	cursor : pointer;
}
</style>
</head>
<!-- 프로젝트 경로 구하기-절대경로를 위한코드 -->
<c:set var="root" value="${pageContext.request.contextPath}" />
<body>
	<!-- The Login Modal -->
	<div class="modal" id="myLoginModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원 로그인</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="loginfrm">
						<table class="logintab">
							<tbody>
								<tr>
									<th width="80">아이디</th>
									<td><input type="text" id="loginid" placeholder="아이디"
										class="form-control" required="required"></td>
								</tr>
								<tr>
									<th width="80">비밀번호</th>
									<td><input type="password" id="loginpass"
										placeholder="비밀번호" class="form-control" required="required">
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<button type="submit" class="btn btn-sm btn-success">로그인</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btnclose"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

		<div style="margin: 10px;">
			<!-- 제목 클릭시 메인 페이지로 이동 -->
			<h2 class="alert alert-success">
				<a href="${root}/"> <img src="${root}/s4.JPG" width="50">
					SpringBoot와 Mybatis 를 이용한 프로젝트
				</a> <span style="margin-left: 300px; font-size: 15px;">
				
				<c:if test="${sessionScope.loginstatus !=null}">
					<img src="${root}/save/${sessionScope.loginphoto}" class="profilephoto"
					onerror="this.src='${root}/save/noimage.png'"> <!-- controller로 온게 아니라서 model에 없고 sessionScope에 넣어놓음 -->
					<script>
						$(".profilephoto").click(function(){
							location.href=`${root}/member/mypage`;
						});
					</script>
					
					
					<b>${sessionScope.loginid}</b>님이 로그인 중입니다.
			</c:if>
				</span>
			</h2>
			<ul class="mymenu">
				<li><a href="${root}/">Home</a></li>
				<li><a href="${root}/shop/list">상품목록</a></li>
				<li><a href="${root}/member/form">회원가입</a></li>
				<c:if test="${sessionScope.loginstatus != null and sessionScope.loginid == 'admin'}">
					<li><a href="${root}/member/list">회원목록</a></li>
				</c:if>
				<li><a href="${root}/board/list">회원게시판</a></li>
				<li>
					<c:if test="${sessionScope.loginstatus==null}">
						<span data-bs-toggle="modal" data-bs-target="#myLoginModal"
							style="cursor: pointer;" id="login"> 로그인</span>
					</c:if> 
		            <c:if test="${sessionScope.loginstatus!=null}">
		                <span style="cursor: pointer" id="logout">로그아웃</span>
		            </c:if>

				</li>
			</ul>
			<script type="text/javascript">
				$("#loginfrm").submit(function(e){
					e.preventDefault(); //submit의 기본이벤트를 무효화(action 호출)
					//alert("submit");
					let loginid=$("#loginid").val();
					let loginpass=$("#loginpass").val();
					
					$.ajax({
						type:"get",
						dataType:"json",
						data:{"loginid":loginid, "loginpass":loginpass},
						url:"${root}/member/login",
						success:function(res){
							if(res.result=='success'){
								//값 초기화
								$("#loginid").val("");
								$("#loginpass").val("");
								
								//모달창 닫기
								$(".btnclose").trigger("click");
								//새로고침
								location.reload();
							}else{
								alert("아이디나 비밀번호가 맞지 않습니다.");
								$("#loginpass").val("");
								
							}
						}
					});
				});
				
				$("#logout").click(function(){
					$.ajax({
						type:"get",
						dataType:"text",
						url:"${root}/member/logout",
						success:function(res){
							//새로고침
							location.reload();
						}
					});
				});
			</script>
		</div>
		<hr style="clear: both;">
</body>
</html>