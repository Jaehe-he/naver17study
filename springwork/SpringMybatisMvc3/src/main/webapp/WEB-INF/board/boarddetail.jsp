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
      
      .profilePhoto{
      	width: 50px;
      	height : 50px;
      	border : 1px solid gray;
      	border-radius : 100px;
      	margin-right : 10px;
      }
      
      .day{
      	font-size : 13px;
      	color : gray;
      }
      
      #photoupload{
      	display:none;
      }
      
      .reple{
      	background-color : #e6e6fa;
      	width : 700px;
      	height : 250px;
      	padding : 20px;
      	margin-top : 20px;
      }
      
      .repleicon{
      	margin-left : 30px;
      }
      
      .btn{
      width : 100px;
      }
         
      #btnaddreple{
      	margin-left : 30px;
      }
      
      #btnupdreple{
      	margin-left : 10px;
      }
      
      #btndelreple{
      	margin-left : 10px;
      }
      
      .replebutton{
      	margin : 0 auto;
      	margin-top : 20px;
      }
      
      .addcamera{
      	font-size: 1.4em;
      	cursor:pointer;
      	margin-left:10px;
      }
      
      .replephoto img{
      	width : 40px;
      	height : 40px;
      	border : 1px solid black;
      	border-radius:10px;
      	margin-left : 50px;
      	
      }
      
      .replephotodel{
      	cursor:pointer;
      	top:-10px;
      	left:-10px;
      }
   </style>
<script>
   $(function(){
     		replelist();
     	});
     	
     	function replelist()
     	{
     		$.ajax({
     			type:"get",
     			dataType:"json",
     			data:{"idx":${dto.idx}},
     			url:"./replelist",
     			success:function(res){
     				let s="";
     				$.each(res,function(i,item){    					
     					s+=`
     						<img src="${naverurl}/member/\${item.profile}" class="profile">
     						<span>\${item.writer}</span><span class="day">\${item.writeday}</span>
     						<div style="margin-left:20px;">
     							<pre style="font-size:15px;">\${item.message}</pre>
     							<br>`; 
     				if(item.photo!=null)	
         						s+=`<img src="${naverurl}/board/\${item.photo}" class="photo"><br><br>`;	
     				
         			s+=`</div>`;
     					
     				});
     				$(".replelist").html(s);
     			}
     		});
     	}
     </script>
</head>
<body>
<!-- 로그인을 안할 경우 경고 후 이전페이지로 이동 -->
<c:if test="${sessionScope.loginstatus==null}">
	<script>
		alert("회원게시판입니다\n먼저 로그인을 해주세요.");
		history.back();
	</script>
</c:if>

<jsp:include page="../../layout/title.jsp"/>

<!--  The Modal -->
<div class="modal" id="myMiniPhotoModal">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">댓글 원본 사진</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
				<img src="" class="replelarge" style="width:100%;">
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>



<div style="margin: 30px;">
	<h3><b>${dto.subject}</b></h3>
	<img src="${naverurl}/${memberPhoto}" class="profilePhoto" align="left"
	onerror="this.src='../save/noimage.png'">
	
	<span>${dto.writer}</span><br>
	<span class="dat">
		<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
		&nbsp;&nbsp;
		조회 &nbsp; ${dto.readcount}
	</span>
	
	<pre style="margin-top: 30px; font-size: 15px;">${dto.content}</pre>
	<div style="margin-top:30px;">
		<c:forEach var="photo" items="${dto.photos}">
			<img src="${naverurl}/board/${photo}" style="max-width:500px;"><br>
		</c:forEach>
	</div>
	<div style="margin-top:30px;">
		<button type="button" class="btn btn-success btn-sm" style="width:80px;"
		onclick="location.href='./writeform'">
			<i class="bi bi-pencil-fill"></i>
			글쓰기
		</button>
		
		<button type="button" class="btn btn-outline-secondary btn-sm" style="width:80px;"
		onclick="location.href='./writeform?idx=${dto.idx}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&pageNum=${pageNum}'">
			답글
		</button>
		
		<c:if test="${sessionScope.loginid==dto.myid}">
			<button type="button" class="btn btn-outline-secondary btn-sm" style="width:80px;"
			onclick="location.href='./updateform?idx=${dto.idx}&pageNum=${pageNum}'">수정</button>
			
<%--  			<button type="button" class="btn btn-outline-secondary btn-sm" style="width:80px;"
			onclick="location.href='./delete?idx=${dto.idx}&pageNum=${pageNum}'">삭제</button>  --%>
			
			<button type="button" class="btn btn-outline-secondary btn-sm" style="width:80px;"
			onclick="boarddel()">삭제</button>
			
			<script type="text/javascript">
				function boarddel(){
					//삭제할지 물어보고 확인 누르면 삭제 후 목록으로 이동(페이지번호 전달)
					let ans = confirm("해당 글을 삭제하시려면 [확인]을 눌러주세요");
				
					if(ans){
						$.ajax({
							type:"get",
							dataType:"text",
							data:{"idx":${dto.idx}},
							url:"./delete",
							success:function(){
								alert("삭제되었습니다.");
								//삭제 성공 후 목록으로 이동
								location.href="./list?pageNum="+${pageNum};
							}
						});
					}
				}
			</script>
		</c:if>
		
		<button type="button" class="btn btn-outline-secondary btn-sm" style="width:80px;"
		onclick="location.href='./list?&pageNum=${pageNum}'">목록</button>
	</div>
	
	<!-- 댓글 -->
	<div class="reple">
		<table>
			<tr>
				<td width="50px;">
					<span style="margin-left: 10px; font-size: 15px;">
						<c:if test="${sessionScope.loginstatus !=null}">
							<c:set var="naverurl" value="https://kr.object.ncloudstorage.com/bitcamp-bucket-122"/>
							
							<img src="${naverurl}/member/${sessionScope.loginphoto}" class="profilephoto"
							onerror="this.src='${root}/save/noimage.png'">
							
							<script>
								$(".profilephoto").click(function(){
									location.href=`${root}/member/mypage`;
								});
							</script>
							
							<br>
							<b style="padding-left : 10px;">${sessionScope.loginid}</b>
						</c:if>
					</span>
				</td>
				<td>
					<textarea style="width: 550px;height:80px;" id="message"
					class="form-control" placeholder="댓글입력"></textarea>
				</td>
				<td width ="10px;">
					<div class="repleicon input-group" style="padding-top : 80px;">
						<input type="file" id="photoupload">
						<i class="bi bi-camera-fill addcamera"></i>
					</div>
					<div class="replelist"></div>
				</td>
			</tr>
		</table>
		<div class="replephoto" style="margin-bottom:10px; padding-left:10px;"></div>
		<table class = "replebutton">
			<tr>

				<td>
					<button type="button" class="btn" style="background-color : #fff5ee;" id="btnreplesave">댓글 등록</button>
				</td>
				
				<td>
					<button type="button" class="btn" style="background-color : #ffe4e1;" id="btnrepleupdate">댓글 수정</button>
				</td>	
				
				<td>
					<button type="button" class="btn" style="background-color : #bc8f8f;" id="btnrepledel">댓글 삭제</button>
				</td>
			</tr>
		</table>
		
		<script>
			$(".addcamera").click(function(){
				$("#photoupload").trigger("click");
			});
			
			$("#photoupload").change(function(e){
				let form=new FormData();
				form.append("upload", e.target.files[0]);
				
				$.ajax({
					type:"post",
					dataType:"text",
					data:form,
					processData:false,
					contentType:false,
					url:"./repleupload",
					success:function(res){
						$(".replephoto").html(`
								<img src="${naverurl}/board/\${res}">
								<i calss="bi bi-x-circle-fill replephotodel" fname="\${res}"></i>
								`);
					}
				});
			});
			
			$(document).on("click", ".replephotodel", function(){
				let close=$(this); //x아이콘
				let fname=close.attr("fname");
				
				$.ajax({
					type:"get",
					dataType:"text",
					data:{"fname":fname},
					url:"./replephotodel",
					success:function(){
						close.prev().remove(); //x아이콘 바로 앞의 사진 삭제
						close.remove(); //자기 자신인 x아이콘도 삭제
					}
				});
			});
			
			//댓글 저장
			$("#btnreplesave").click(function(){
				let idx=${dto.idx};
				let m=$("#message").val();
				
				$.ajax({
					type:"post",
					dataType:"text",
					data:{"idx" : idx, "message":m},
					url:"./addreple",
					success:function(){
						//댓글 추가 성공 후 초기화
						$("#message").val("");
						$(".replephoto").html("");
						
						//추가 성공 후 댓글 목록 다시 출력
						alert("댓글 저장 성공");
						replelist();
					}
				});
			});
		</script>
	</div>
</div>
</body>
</html>