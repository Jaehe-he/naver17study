<%@page import="project1.user.data.UserDao"%>
<%@page import="project1.user.data.UserDto"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	
	/*
	//변수선언
	String url = "jdbc:mysql://db-324oat-kr.vpc-pub-cdb.ntruss.com:3306/studydb?serverTimezone=Asia/Seoul";
	String uid = "study";
    String upw ="bitcamp!@#123";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    String sql = "insert into members values (?,?,?,?,?,?,?)";
    
    //드라이버 로드
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    //conn 생성
    conn = DriverManager.getConnection(url, uid, upw);
    */
    
    //pstmt 생성
    UserDto dto = new UserDto();
    dto.setId(id);
    dto.setPw(pw);
    dto.setName(name);
    dto.setPhone1(phone1);
    dto.setPhone2(phone2);
    dto.setPhone3(phone3);
    dto.setGender(gender);
    
    UserDao dao = new UserDao();
    int insertCount = dao.joinUser(dto);
	
    if(insertCount > 0){
%>

<script>
	alert("회원가입을 축하합니다!");
	location.href = "./login.jsp";
</script>
<%
    } else { %>
    <script>
    	alert("회원가입을 실패했습니다!");
    	history.back();
    </script>
<%}%>

