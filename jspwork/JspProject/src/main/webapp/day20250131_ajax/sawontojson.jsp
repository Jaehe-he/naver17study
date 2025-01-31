<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sawon.data.SawonDto"%>
<%@page import="java.util.List"%>
<%@page import="sawon.data.SawonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SawonDao dao = new SawonDao();
	String search = request.getParameter("search");
	List<SawonDto> list = dao.getAllDatas(search);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
[
<%
	StringBuffer sb = new StringBuffer(); //기존 Buffer를 삭제하고 추가해주고 함
	for(SawonDto dto:list){
		sb.append("{");
		sb.append("\"num\":\""+dto.getNum()+"\",");
		sb.append("\"sname\":\""+dto.getSname()+"\",");
		sb.append("\"sphoto\":\""+dto.getSphoto()+"\",");
		sb.append("\"sbirth\":\""+dto.getSbirth()+"\",");
		sb.append("\"sblood\":\""+dto.getSblood()+"\",");
		sb.append("\"ipsaday\":\""+dto.getIpsaday()+"\",");
		sb.append("\"writeday\":\""+sdf.format(dto.getWriteday())+"\"");
		sb.append("},");
	}
	
	//마지막 컴마는 제거하자
	sb.deleteCharAt(sb.length()-1);
%>
<%=sb.toString() %>
]
