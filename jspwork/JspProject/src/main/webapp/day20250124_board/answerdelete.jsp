<%@page import="simpleboard.data.SimpleAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   // 1. idx, num 읽기
   int idx = Integer.parseInt(request.getParameter("idx"));
   String num = request.getParameter("num");
   // 2. adao 선언
   SimpleAnswerDao adao = new SimpleAnswerDao();
   // 3. 댓글 삭제 메서드 호출
   adao.deleteAnswer(idx);
   // 4. 상세 페이지로 이동
   response.sendRedirect("./contentdetail.jsp?num="+num);
%>