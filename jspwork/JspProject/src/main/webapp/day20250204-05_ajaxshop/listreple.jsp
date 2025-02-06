<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="shop.data.ShopRepleDto"%>
<%@page import="java.util.List"%>
<%@page import="shop.data.ShopRepleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//num 읽기
	int num = Integer.parseInt(request.getParameter("num"));

	ShopRepleDao dao = new ShopRepleDao();
	
	List<ShopRepleDto> list = dao.getRepleByNum(num);
	
	JSONArray arr = new JSONArray();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	for(ShopRepleDto dto:list){
		JSONObject ob = new JSONObject();
		ob.put("idx", dto.getIdx());
		ob.put("num", dto.getNum());
		ob.put("star",dto.getStar());
		ob.put("message",dto.getMessage());
		ob.put("writeday",sdf.format(dto.getWriteday()));
		
		arr.add(ob);
	}
%>
<%=arr%>