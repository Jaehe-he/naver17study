<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // 세션 초기화 (로그아웃)
    response.sendRedirect("../main.jsp"); // 메인 페이지로 이동
%>
