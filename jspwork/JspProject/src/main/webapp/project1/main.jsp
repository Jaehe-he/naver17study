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
	#button1 {
		margin-left : 25px;
		border:0;
		background : #F0F8FF;
		padding-right : 100px;
	}
	
	#button2 {
		margin-left : 26px;
		border : 0;
		background : #F0F8FF;
		padding-right : 105px;
	}
	
	#button3 {
		margin-left : 35px;
		border : 0;
		background : #F0F8FF;
		padding-right : 120px;
	}
	#button {
		border : 0;
		background : #F0F8FF;
	}
	
	#insertbtn {
		background : #F0F8FF;
		height : 30px;
		margin-left : 700px;
	}
	</style>
	<script>
		$(document).ready(function(){
			$(".list2").hide(); //페이지 로드 시 모든 서브 카테고리가 숨겨짐
		    $(".list1 > input").click(function(){
		        $(this).next(".list2").slideToggle("fast"); // 클릭하면 하위 버튼들이 토글됨
		    });
		});
	</script>
</head>
<body>
<div class = "container">
	<%@ include file = "nav.jsp" %>
	<div class="text-center mb-5">
		<div class="container" style="background-color:#F0F8FF;">
		
		<h3> 오늘 하루는 어떠셨나요? </h3>
		<h5> 행복한 하루 였나요? 아니면 조금 슬펐던 하루였나요? 어떤 하루였든 중요하지 않습니다. <br>
			 행복했다면 그 기분을 쭉 가져가시고, 조금 슬펐다면 이 또한 지나가리라라고 생각하고 넘겼으면 좋겠습니다:)
		</h5>
		</div>
	</div>

<!-- //select 방법 
	<div>
		<div class="container" style="background-color:#F0F8FF;">
			<select id = "sellist" style="width : 100px; height : 40px; margin-left : 20px; class="form-select">
				<option value="1"> 행복 </option>
				<option value="2"> 긍정 </option>
				<option value="3"> 위로 </option>
			</select>
		</div>
	</div>
-->

	<div>
		<div class= "input-group">
			<h4> 카테고리 </h4>
			<form action = "insertposts.jsp">
				<input type="submit" id="insertbtn" name="insertbtn" value="명언 등록"> 
			</form>
		</div>
		<div class="container input-group" style="background-color:#F0F8FF;">
			<div class="list1" style = "padding-left : 65px">
				<input type="button" id="button1" name="button" value="인간관계">
				<div class="list2 input-group">
					<input type = "button" id="button" name="button" value="사랑">
					<input type = "button" id="button" name="button" value="친구">
					<input type = "button" id="button" name="button" value="이별">
				</div>
			</div>
			<div class="list1">
				<input type="button" id="button2" name="button" value="삶">
				<div class="list2 input-group">
					<input type = "button" id="button" name="button" value="인생">
					<input type = "button" id="button" name="button" value="시간">
				</div>
			</div>
			<div class="list1">
				<input type="button" id="button3" name="button" value="성취">
				<div class="list2 input-group">
					<input type="button" id="button" name="button" value="성공">
					<input type="button" id="button" name="button" value="노력">
					<input type="button" id="button" name="button" value="도전">
				</div>
			</div>
			<div class="list1">
				<input type="button" id="button2" name="button" value="성장">
				<div class="list2 input-group">
					<input type="button" id="button" name="button" value="공부">
					<input type="button" id="button" name="button" value="자신감">
				</div>
			</div>
			<div class="list1">
				<input type="button" id="button2" name="button" value="용기">
				<div class="list2 input-group">
					<input type="button" id="button" name="button" value="희망">
					<input type="button" id="button" name="button" value="위로">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>