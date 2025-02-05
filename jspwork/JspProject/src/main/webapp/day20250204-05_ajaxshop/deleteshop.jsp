<%@page import="shop.data.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. num 읽기
	int num = Integer.parseInt(request.getParameter("num"));
	
	//2. dao 선언
	ShopDao dao = new ShopDao();
	
	//3. 삭제메서드 호출 (deleteShop(int num))
	dao.deleteShop(num);
	
	
%>