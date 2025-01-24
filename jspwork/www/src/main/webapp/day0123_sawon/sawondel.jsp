<%@page import="sawon.data.SawonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. num 을 읽는다
	String num=request.getParameter("num");
	//2. dao 선언
	SawonDao dao=new SawonDao();
	//3. 삭제 메서드 호출
	dao.deleteSawon(num);
	//4. 목록으로 이동
	response.sendRedirect("./sawonlist.jsp");
%>