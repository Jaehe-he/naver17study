<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="sawon.data.SawonDto"%>
<%@page import="sawon.data.SawonDao"%>
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
        
        .btn{
        	width: 90px;
        }
        
        .photo{
        	width: 250px;
        }
     </style>
</head>
<%
	String num=request.getParameter("num");
	//dao 선언
	SawonDao dao=new SawonDao();
	//num 에 해당하는 dto얻기
	SawonDto dto=dao.getSawon(num);
%>
<body>
<div style="margin: 20px;">
	<h3><b>[<%=dto.getSname()%>] 사원 정보</b></h3>
	<img src="<%=dto.getSphoto() %>" class="photo"
	align="left" hspace="10" border="2">
	
	<br><br><br>
	<h5>입사일 : <%=dto.getIpsaday() %></h5>
	<br>
	<%
		//현재 년도 구하기
		int curYear=new Date().getYear()+1900;
	%>
	<h5>나 이 : <%=curYear-dto.getSbirth()%>세(<%=dto.getSbirth()%>년생)</h5>
	<br>
	<h5>혈액형 : <%=dto.getSblood() %>형</h5>
	<br>
	<%
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
	<h5>등록일 : <%=sdf.format(dto.getWriteday()) %></h5>
	<br><br><br><br>
</div>
<div style="margin-left: 50px;">
	<button type="button" class="btn btn-sm btn-outline-secondary"
	onclick="location.href='./sawonform.jsp'">사원등록</button>
	
	<button type="button" class="btn btn-sm btn-outline-secondary"
	onclick="location.href='./sawonlist.jsp'">사원목록</button>
	
	<button type="button" class="btn btn-sm btn-outline-secondary"
	onclick="location.href='./updateform.jsp?num=<%=dto.getNum()%>'">정보수정</button>

	<%-- <button type="button" class="btn btn-sm btn-outline-secondary"
	onclick="location.href='./sawondel.jsp?num=<%=dto.getNum()%>'">사원삭제</button> --%>

	<button type="button" class="btn btn-sm btn-outline-secondary"
	onclick="delfunc(<%=dto.getNum()%>)">사원삭제</button>
	
	<script type="text/javascript">
		function  delfunc(num) {
			//alert(num);
			let ans=confirm("현재 사원을 DB에서 삭제합니다");
			if(ans){
				location.href="./sawondel.jsp?num="+num;//파일 이동
			}
		}
	</script>
</div>
</body>
</html>
















