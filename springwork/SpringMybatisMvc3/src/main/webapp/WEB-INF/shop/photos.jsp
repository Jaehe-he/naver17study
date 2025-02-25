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
        
        .photos img{
        	width: 120px;
        	height: 120px;
        	border: 1px solid black;
        	border-radius: 20px;
        	margin: 10px;
        }
        
        .photodel{
        	cursor: pointer;
        	font-size: 1.5em;
        	position: relative;
        	left:-20px;
        	top:-45px;
        	color:red;
        }
        
        .addphoto{
        	margin-left: 100px;
        	font-size: 1.3em;
        	color: red;
        	cursor: pointer;
        }
        
        #uploadphoto{
        	display: none;
        }
     </style>
</head>
<body>
<div style="margin: 30px;">
	<h4  class="alert alert-danger">사진 수정
	
	  <input type="file" id="uploadphoto" multiple="multiple">
	  <i class="bi bi-camera-fill addphoto"></i>
	</h4>
	<div class="photos">
		<c:forTokens var="onephoto" items="${sphoto}" delims=",">
			<%-- <img src="../save/${onephoto}"> --%>
			
			<!-- 120x120 사이즈의 썸네일로 이미지 출력-->
			<img src="${fronturl}/shop/${onephoto}${backurl}">
			<i class="bi bi-x-circle photodel" pname="${onephoto}"></i>
		</c:forTokens>
	</div>
</div>
<!-- 카메라 클릭시 파일 업로드 실행되도록하기 -->
<script type="text/javascript">
	$(".addphoto").click(function(){
		$("#uploadphoto").trigger("click");
	});

	//사진 추가
	$("#uploadphoto").change(function(e){
		let form=new FormData();
		for(let i=0;i<e.target.files.length;i++)
		{
			form.append("upload",e.target.files[i]);
		}
		form.append("num",${num});
		
		$.ajax({
			type:"post",
			dataType:"text",
			url:"./addphoto",
			data:form,
			processData:false,
			contentType:false,
			success:function(){
				location.reload();
			}
		});
	});
</script>


<script type="text/javascript">
	$(".photodel").click(function(){
		let num=${num};
		let pname=$(this).attr("pname");
		$.ajax({
			type:"get",
			dataType:"text",
			url:"./delphoto",
			data:{"num":num,"pname":pname},
			success:function(){
				location.reload();
			}
		})
	});
</script>

<hr>
<button type="button" class="btn btn-sm btn-outline-secondary"				
		onclick="location.href='./detail?num=${num}'">상세보기로 이동</button>
</body>
</html>