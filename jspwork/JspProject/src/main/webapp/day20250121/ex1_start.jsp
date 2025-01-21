<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 이걸로 인해 자바를 사용할 수 있는 것 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 주석 : ctrl+shift+/  -->
<h3> HTML, JSP 주석 확인 </h3>
<!-- HTML 주석(소스보기로 보임) -->
<%-- JSP 주석(소스보기로는 안보임) --%>
<!--
<script type="text/javascript">
	document.write("hello");
</script>
-->

<h4>이름 : <%=name %></h4> <!--  선언문의 변수는 위치가 어디든 출력 가능 -->

<%!
	//선언문
	//이곳에 변수를 등록하면 서블릿 변환 시 멤버변수로 등록된다
	String name = "홍길동";
%>

<%
	//스크립트릿(scriptlet) : 자바 영역
	//이곳에서 선언하는 변수는 서블릿 변환 시 지역변수로 등록된다(doGet의 지역변수로 등록)
	
	//변수를 브라우저에 출력하는 방법 2가지
	//방법 1. out : 내장객체
	out.print("<h2>이름 : "+name+"</h2>");
%>

<!-- 방법 2. 표현식을 이용한 자바 영역에 있는 변수 출력 -->
<h4>이름 : <%=name %></h4>

<%
	String addr = "서울시 강남구";
	//자바 영역안에서 선언된 지역변수는 선언된곳보다 아래쪽에서만 사용 가능
%>
<h5 style="color:blue;"> 주소 : <%=addr %></h5> <!-- String addr = "서울시 강남구";보다 윗쪽으로 가있으면 안됨 -->

<!-- 
	jsp 실행 -- servlet(java파일)으로 변환 --class 파일로 컴파일 -- class파일이 실행돼서 브라우저로 나온다
	
	첫날이니까 딱 한번만 찾아가서 확인(이클립스 안의 톰켓서버 위치 그 안에 현재 프로젝트가 배포되어있는 상황)
	작업폴더 : C:\naver1210\study\jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\JspProject\org\apache\jsp 폴더 및 파일 찾기
 -->
</body>
</html>