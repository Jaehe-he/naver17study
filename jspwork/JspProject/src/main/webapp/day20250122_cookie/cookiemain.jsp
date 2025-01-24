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
     </style>
</head>
<%

boolean blogin=false;

//현재 브라우저에 저장된 모든 쿠키값얻기, 없을경우 null 값
Cookie []cookies=request.getCookies();
if(cookies!=null)
{
	for(int i=0;i<cookies.length;i++)
	{
		//loginok 라는 쿠키가 있는지 검사
		if(cookies[i].getName().equals("loginok")){
			blogin=true;
			break;
		}
	}
}
%>
<body>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<h2><%=sdf.format(new Date()) %> : 오늘의 기사 모음</h2>
<hr>
<%
 if(blogin)
 {%>
	 <jsp:include page="./cookielogout.jsp"/>
 <%}else{%>
	 <jsp:include page="./cookielogin.jsp"/>
 <%}
%>
<hr>
<h3 class="alert alert-danger">오늘의 기사</h3>
<jsp:include page="./paper.jsp"/>
</body>
</html>


































