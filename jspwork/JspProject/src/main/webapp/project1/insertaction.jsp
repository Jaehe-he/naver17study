<%@ page import="project1.posts.data.PostDao"%>
<%@ page import="project1.posts.data.PostDto"%>
<%@ page import="project1.posts.data.CategoryDao"%>
<%@ page import="project1.posts.data.CategoryDto"%>
<%@ page import="project1.posts.data.SubcategoryDao"%>
<%@ page import="project1.posts.data.SubcategoryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>게시물 업로드</title>
</head>
<body>
    <h2>게시물 업로드</h2>
    <%
        // 폼 데이터 처리
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String categoryIdStr = request.getParameter("category");
        String subcategoryIdStr = request.getParameter("subcategoryDto");
        
        // 카테고리와 하위 카테고리 값이 있는지 체크
        if (title != null && content != null && categoryIdStr != null && subcategoryIdStr != null) {
            int categoryId = Integer.parseInt(categoryIdStr);
            int subcategoryId = Integer.parseInt(subcategoryIdStr);

            // PostDto 객체 생성 및 값 설정
            PostDto postDto = new PostDto();
            postDto.setSubcategory_id(subcategoryId);
            postDto.setTitle(title);
            postDto.setContent(content);

            // PostDao 객체 생성 및 게시물 삽입
            PostDao postDao = new PostDao();
            postDao.insertPosts(postDto);
    %>
            <p>게시물이 성공적으로 업로드되었습니다!</p>
    <%
        } else {
    %>
            <p>모든 필드를 입력해주세요.</p>
    <%
        }
    %>
    <br>
    <a href="insertposts.jsp">게시물 업로드 페이지로 돌아가기</a>
</body>
</html>
