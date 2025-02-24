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
      
      .profilelargephoto{
      	width:200px;
      	height : 200px;
      	border:1px solid gray;
      	border-radius: 100px;
      }
      
      .changecamera{
      	position: relative;
      	cursor : pointer;
      	font-size : 1.5em;
      	left : -30px;
      	top : 50px;
      }
   </style>
</head>
<body>
<jsp:include page="../../layout/title.jsp"/>
<div style="margin: 30px 100px;">
	<img src="../save/${dto.mphoto}" class="profilelargephoto"
	onerror="this.src='../save/noimage.png'">
	
	<input type="file" id="fileupload" style="display: none">
	
	<i class="bi bi-camera-fill changecamera"></i>
	<script>
		$(".changecamera").click(function(){
			$("#fileupload").trigger("click");
		});
		
		//사진변경 이벤트
		$("#fileupload").change(function(e){
			let form = new FormData();
			form.append("upload",e.target.files[0]);
			form.append("num",${dto.num});
			
			$.ajax({
				type:"post",
				dataType:"text",
				data:form,
				url:"./changephoto",
				processData : false,
				contentType:false,
				success:function(){
					location.reload();
				}
			})
		});
	</script>
	<div style="display: inline-block; margin : 20px 50px; float : right; width : 500px;">
		<h6> 회원명 : ${dto.mname}</h6>
		<h6> 아이디 : ${dto.myid}</h6>
		<h6> 핸드폰 : ${dto.mhp}</h6>
		<h6> 주 소 : ${dto.maddr}</h6>
		<h6> 가입일 :
			<fmt:formatDate value="${dto.gaipday}" pattern="yyyy-MM-dd HH:mm"/>	
		</h6>
		<br><br>
		<button type="button" class="btn btn-sm btn-danger"
		onclick="memberdel(${dto.num})"> 회원탈퇴</button>
		
		<script>
			function memberdel(num){
				let ans=confirm("정말 탈퇴하시겠습니까?");
				if(ans){
					$.ajax({
						type:"get",
						dataType:"text",
						data:{"num":num},
						url:"./mypagedel",
						success:function(){
							location.href='../';
						}
					});
				}
			}
		</script>
		
		<!-- 문제 : 아이디를 제외한 나머지 정보(mname, mhp, maddr) 수정(모달)
			수정 후 reload할거니까 @ResponseBody로 메서드 구현
		-->
		
		
		<button type="button" class="btn btn-sm btn-success" onclick="location.href='/member/updateform.jsp'">회원 정보 수정</button>
	</div>
</div>
</body>
</html>