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
<%
	//세션에 저장된 아이디(sId) 가져와서 변수에 저장
	String sId = (String)session.getAttribute("sId");
	out.println(sId); //확인
%>

<script>
	function confirm_logout(){
		let result = "confirm("로그아웃 하시겠습니까?");
		
		if(result){
			location.href="../member/logout.jsp";
		}
	}
</script>

	if(sId == null || sId.equals("")) {
		<a href="../member/login.jsp">login</a> | <a href="./member/join.jsp">join</a>
	} else{
		<a href="../member/memberInfo.jsp?id=<%=sId%>"><%=sId%>님</a> | <a href="javascript:confirm_logout()">logout</a>
		
		if(sId.equals("admin"){
		<a href="../admin/admin_info.jsp">관리자 페이지</a>
		}
	}

</body>
</html>