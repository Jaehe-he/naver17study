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
     </style>
</head>
<body>
<jsp:include page="../../layout/title.jsp"/>
<div style="margin: 10px 30px;width: 500px;">
	<form action="./insert" method="post" enctype="multipart/form-data"
	onsubmit="return check()">
		<table class="table table-bordered tab1">
			<tbody>
				<tr>
					<td width="150" rowspan="4">
						<input type="file" name="upload" style="width: 100px;"
						onchange="preview(this)" value = "${dto.mphoto}">
						<br>
						<img src="" id="showimg" onerror="this.src='../save/noimage.png'">
						
						<!-- 파일 선택시 제이쿼리로 미리보기 코드 -->
						<script>
							function preview(tag)
							{
								let f=tag.files[0];
								if(!f.type.match("image.*")){
									alert("이미지 파일만 가능합니다");
									return;
								}
								
								if(f){
									let reader=new FileReader();
									reader.onload=function(e){
										$("#showimg").attr("src",e.target.result);
									}
									reader.readAsDataURL(f);
								}
							}
						</script>
					</td>
					<th width="70">이름</th>
					<td>
						<input type="text" name="mname" class="form-control"
						required="required" value="${dto.mname}">
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td class="input-group">
						<input type="text" name="myid" id="myid" class="form-control"
						required="required">
						<button type="button" class="btn btn-sm btn-danger"
						id="btnidcheck">중복체크</button>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="input-group">
						<input type="password" name="mpass" id="mpass" class="form-control"
						placeholder="비밀번호1" required="required">
						<input type="password" name="mpass2" id="mpass2" class="form-control"
						placeholder="비밀번호2" required="required">
						
					</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td class="input-group">
						<input type="text" name="mhp" class="form-control"
						required="required" value="${dto.mhp}">					
					</td>
				</tr>
				<tr>
					<th>주 소</th>
					<td colspan="2">
						<input type="text" name="maddr" class="form-control" value="${dto.maddr}">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<button type="submit" class="btn btn-sm btn-success">회원수정</button>
						<button type="submit" class="btn btn-sm btn-success" onclick="location.reload()">이전으로</button>
					</td>
				</tr>
			</tbody>		
		</table>
	</form>
</div>
</body>
</html>