<%@page import="memo.data.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx=Integer.parseInt(request.getParameter("idx"));
	MemoDao dao = new MemoDao();
	dao.deleteMemo(idx);
%>