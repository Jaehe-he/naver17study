<%@page import="shop.data.ShopRepleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int idx=Integer.parseInt(request.getParameter("idx"));

	ShopRepleDao dao = new ShopRepleDao();
	
	dao.deleteReple(idx);

%>