<%@page import="project1.user.data.UserDao"%>
<%@page import="project1.user.data.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	out.println(id + "," + pw);
	
	UserDto dto = new UserDto();
	dto.setId(id);
	dto.setPw(pw);
		
	UserDao dao = new UserDao();
	boolean loginSuccess = dao.loginUser(dto);

		
	if(loginSuccess){
		//로그인 성공 시 세션에 sId라는 이름으로 id값 저장
		session.setAttribute("sId", id);
		//세션에 아이디 저장 후 메인 페이지로 이동
		response.sendRedirect("../main.jsp");
	} else{
	%>
	<script>
		alert("아이디 또는 비밀번호를 잘못 입력했습니다!");
		//로그인 실패 시 알림창 띄우고 이전 페이지로 이동
		history.back();
	</script>
	<%
	}

%>