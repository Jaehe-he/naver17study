<%@page import="shop.data.ShopDao"%>
<%@page import="shop.data.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//아래 코드 맞는지 모름
	String sphoto = request.getParameter("sphoto");
	String sangpum = request.getParameter("sangpum");
	String scolor = request.getParameter("scolor");
	int sprice = Integer.parseInt(request.getParameter("sprice"));
	int scnt = Integer.parseInt(request.getParameter("scnt"));
	String ipgoday = request.getParameter("ipgoday");
	
	
	ShopDto dto = new ShopDto();
	dto.setSphoto(sphoto);
	dto.setSangpum(sangpum);
	dto.setScolor(scolor);
	dto.setSprice(sprice);
	dto.setScnt(scnt);
	dto.setIpgoday(ipgoday);
	
	ShopDao dao = new ShopDao();
	dao.insertShop(dto);
%>

<data>
	<result>
		%=sangpum %>을 추가했습니다.
	</result>
</data>

-->