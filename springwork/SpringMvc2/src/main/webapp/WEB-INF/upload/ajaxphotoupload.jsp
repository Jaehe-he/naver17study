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
      
      #photoupload{ 
      	display : none; /*안보이게 처리 + 자리차지안하게*/
      }
      
      #myphoto {
      	width : 200px;
      	height : 200px;
      	border : 1px solid gray;
      	border-radius : 100%;
      }
      
      .mycamera {
      	font-size : 1.5em;
      	cursor : pointer;
      	border : 1px solid #000;
      	border-radius : 100%;
      	padding : 5px;
      	background-color : #ddd;
      	
      	position : relative;
      	left : -50px;
      	top : 70px;
      }
   </style>
</head>
<body>
<div style="margin: 50px;">
	<input type="file" id="photoupload">
	
	<img src="" id="myphoto" onerror="this.src='./image/noimage.png'">
	
	<i class="bi bi-camera2 mycamera"></i>
	<!-- 카메라 사진 누르면 업로드 창 나오도록 설정 -->
	<script type="text/javascript">
		$(".mycamera").click(function(){
			$("#photoupload").trigger("click");
		});
		
		$("#photoupload").change(function(e){
			let form=new FormData();
			
			//form.append("upload"가 PhotoUploadController.java의 @RequestParam("upload")의 이름과 동일해야함
			//0번 파일 태그의 0번 파일이다.
			form.append("upload",$("#photoupload")[0].files[0]); //선택한 파일 1개
			
			/*
			processData : false - 서버에 전달하는 데이터는 query string이라는 형태로 전달된다
			파일 전송의 경우 이를 하지 않아야하는데 그 설정이 false
			contentType : false - enctype이 원래 기본값이 application/x-www....이거인데
			multipart/form-data로 변경해준다.
			*/
			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"./oneupload",
				processData:false,
				contentType:false,
				data:form,
				success:function(res){
					$("#myphoto").attr("src", "./save/"+res.photo);
				}
			});
		});
	</script>
</div>
</body>
</html>