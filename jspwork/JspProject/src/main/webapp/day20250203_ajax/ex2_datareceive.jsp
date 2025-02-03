<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String myname=request.getParameter("myname");

   JSONObject ob=new JSONObject();
   ob.put("myname", myname);
   ob.put("address", "서울시 강남구");
   ob.put("hp", "010-1111-2222");
%>
<%= ob.toString()%>