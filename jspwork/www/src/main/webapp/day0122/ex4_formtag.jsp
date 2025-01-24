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
     </style>
</head>
<body>
<div style="margin: 30px">
	<form action="./ex4_action.jsp" method="post"><!--생략시 기본값은 get -->
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th width="100">아이디</th>
				<td>
					<input type="text" name="myid" class="form-control"
					required="required" value="angel">
				</td>
			</tr>
			<tr>
				<th width="100">비밀번호</th>
				<td>
					<input type="password" name="mypass" class="form-control"
					required="required" value="12345">
				</td>
			</tr>
			<tr>
				<th width="100">이름</th>
				<td>
					<input type="text" name="myname" class="form-control"
					required="required" value="한가인">
				</td>
			</tr>
			<tr>
				<th width="100">운전면허</th>
				<td>
					<label>
						<!-- checkbox:value 가 없을경우 체크시 "on",체크안하면 null
						value 지정시 체크할경우 "value값" -->
						<input type="checkbox" name="driver" value="yes">운전면허
					</label>
				</td>
			</tr>
			<tr>
				<th width="100">주거지</th>
				<td>
					<label>
						<input type="radio" name="homeaddr" value="서울"
						  checked="checked">서울
					</label>
					<label>
						<input type="radio" name="homeaddr" value="경기도">경기도
					</label>
					<br>
					<label>
						<input type="radio" name="homeaddr" value="제주도">제주도
					</label>
					<label>
						<input type="radio" name="homeaddr" value="부산">부산
					</label>
				</td>
			</tr>
			<tr>
				<th width="100">취미</th>
				<td>
					<label>
						<input type="checkbox" name="hobby" value="게임">게임 
					</label>
					<label>
						<input type="checkbox" name="hobby" value="낚시">낚시
					</label>
					<br>
					<label>
						<input type="checkbox" name="hobby" value="여행">여행 
					</label>
					<label>
						<input type="checkbox" name="hobby" value="음악감상">음악감상 
					</label>
				</td>
			</tr>
			<tr>
				<th width="100">좋아하는음식</th>
				<td>
					<select class="form-select" name="myfood">
						<option value="2.jpg">닭꼬치</option>
						<option value="4.jpg">소고기카레</option>
						<option value="11.jpg">망고빙수</option>
						<option value="10.jpg">햄마요덮밥</option>						
					</select>
				</td>
			</tr>
			<tr>
				<th width="100">글자색</th>
				<td>
					<input type="color" name="fcolor" value="#ccffcc">
				</td>
			</tr>
			<tr>
				<th width="100">생년월일</th>
				<td>
					<input type="date" name="mybirth" value="2010-01-01">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<!-- type 이 image 인 경우도 submit 에 해당 -->	
					<input type="image" value="서버에전송"
						 src="../image/mycar/mycar13.png"
						 style="width:100px;">
				</td>
			</tr>
		</table>
	</form>

</div>
</body>
</html>











