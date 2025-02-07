<%@page import="java.io.File"%>
<%@page import="project1.posts.data.PostDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="project1.posts.data.PostDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String realFolder="";
	String saveFolder = "UploadFile";
	String encType="utf-8";
	int maxSize = 5*1024*1024;
	
	ServletContext context = this.getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	MultipartRequest multi = null;
	
	multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	int subcategory_id = Integer.parseInt(request.getParameter("subcategory_id"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	PostDto dto = new PostDto();
	dto.setSubcategory_id(subcategory_id);
	dto.setTitle(title);
	dto.setContent(content);
	
	PostDao dao = new PostDao();
	
	if(title != null){
		File oldFile = new File(realFolder +"\\"+title);
		File newFile = new File(realFolder+"\\"+"제목없는 사진.jpg");
		oldFile.renameTo(newFile);
	}
	
	

%> 