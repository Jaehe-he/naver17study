<%@page import="sawon.data.SawonDao"%>
<%@page import="sawon.data.SawonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. 모든 폼데이터를 읽는다
	int num=Integer.parseInt(request.getParameter("num"));
	String sname = request.getParameter("sname");
	String sphoto = request.getParameter("sphoto");
	String ipsaday = request.getParameter("ipsaday");
	String sblood = request.getParameter("sblood");
	int sbirth=Integer.parseInt(request.getParameter("sbirth"));
	
	
	//2. dto 선언 후 모든 데이터를 dto에 넣는다
	SawonDto dto = new SawonDto();
	
	dto.setNum(num);
	dto.setSname(sname);
	dto.setSphoto(sphoto);
	dto.setIpsaday(ipsaday);
	dto.setSbirth(sbirth);
	dto.setSblood(sblood);
	
	//3. dao 선언
	SawonDao dao = new SawonDao();
	
	//4. 수정 메서드 호출
	dao.updateSawon(dto);
	
	//5. 상세보기 페이지로 이동
	response.sendRedirect("./sawondetail.jsp?num="+num);

%>