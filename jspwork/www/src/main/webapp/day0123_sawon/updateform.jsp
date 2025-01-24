<%@page import="sawon.data.SawonDto"%>
<%@page import="sawon.data.SawonDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        
        .tab th{
        	background-color: lightgray;
        }
        
        .tab .photo{
        	width: 50px;
        	height: 60px;
        	border: 1px solid gray;
        	margin-right: 10px;
        }
        
        .btn{
        	width: 100px;
        }
     </style>
</head>
<%
	//1.num 읽기
	String num=request.getParameter("num");
	//2.dao 선언
	SawonDao dao=new SawonDao();
	//3.num 에 해당하는 dto 얻기
	SawonDto dto=dao.getSawon(num);
	
%>
<body>
<form action="./updateaction.jsp" method="post">
	<!-- hidden -->
	<input type="hidden" name="num" value="<%=num%>">
	
	<div style="margin: 30px;">
		<table class="tab table table-bordered" style="width: 400px;">
			<caption align="top"><b>사원정보수정</b></caption>
			<tr>
				<th width="100">사원명</th>
				<td>
					<input type="text" class="form-control"
					style="width: 150px;" required="required"
					autofocus="autofocus" name="sname"
					value="<%=dto.getSname()%>">
				</td>
			</tr>
			<tr>
				<th width="100">사진</th>
				<td class="input-group">
					<img src="" class="photo">
					
					<select class="form-select selphoto" 
					   name="sphoto">
					<%
					for(int i=1;i<=20;i++)
					{
						String s="../image/photo/"+i+".jpg";
					%>
						<option value="<%=s%>"
						<%=s.equals(dto.getSphoto())?"selected":""%>
						>사진 #<%=i%></option>
					<%}
					%>
					</select>
					<script type="text/javascript">
						//1. 선택된 옵션의 사진을 초기값으로 지정
						$("img.photo").attr("src",$(".selphoto").val());
						//2. 사진 변경시 .photo 도 변경
						$(".selphoto").change(function(){
							$("img.photo").attr("src",$(this).val());
						});
					</script>
				</td>
			</tr>
			<tr>
				<th width="100">입사일</th>
				<td>					
					<input type="date" name="ipsaday" value="<%=dto.getIpsaday()%>">
				</td>
			</tr>
			<tr>
				<th width="100">태어난년도</th>
				<td>
					<input type="number" name="sbirth"
					 max="2025" class="form-control" required="required"
					 value="<%=dto.getSbirth()%>">
				</td>
			</tr>
			<tr>
				<th width="100">혈액형</th>
				<td>
				<%
					String []blood={"A","O","B","AB"};
					for(String b:blood)
					{%>
						<label>
							<input type="radio" value="<%=b%>" name="sblood"
							<%=b.equals(dto.getSblood())?"checked":"" %>><%=b%>형
						</label>
						&nbsp;
					<%}
				%>	
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-sm btn-success">정보수정</button>
					<button type="button"  class="btn btn-sm btn-success"
					onclick="history.back()">이전으로</button>
				</td>
			</tr>
		</table>	
	</div>
	
</form>
</body>
</html>







