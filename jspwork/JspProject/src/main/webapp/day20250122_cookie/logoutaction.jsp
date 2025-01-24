<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//현재 브라우저에 저장된 모든 쿠키값얻기, 없을경우 null 값
	Cookie []cookies=request.getCookies();
	if(cookies!=null)
	{
		for(int i=0;i<cookies.length;i++)
		{
			String name=cookies[i].getName();
			if(name.equals("loginok")){
				Cookie loginCookie=cookies[i];
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);//쿠키 유지시간을 0으로 만든후 다시 브라우저에 저장,loginok 쿠키는 바로 사라짐
				response.addCookie(loginCookie);
				break;
			}
		}
	}
	//메인 페이지로 이동
	response.sendRedirect("./cookiemain.jsp");
%>