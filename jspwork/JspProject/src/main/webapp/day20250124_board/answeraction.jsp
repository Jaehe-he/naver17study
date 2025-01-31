<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adao" class="simpleboard.data.SimpleAnswerDao"/>
<jsp:useBean id="adto" class="simpleboard.data.SimpleAnswerDto"/>
<jsp:setProperty property="*" name="adto"/>

<%
	//insert댓글
	adao.insertAnswer(adto);
	//상세보기 페이지로 이동
	response.sendRedirect("./contentdetail.jsp?num="+adto.getNum());
%>