<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="shop.data.ShopDao"/>
<jsp:useBean id="dto" class="shop.data.ShopDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dao.updateShop(dto);
%>