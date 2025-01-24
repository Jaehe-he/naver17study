<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.removeAttribute("loginok");
   
    //메인 페이지로 이동
    response.sendRedirect("./sessionmain.jsp");
%>