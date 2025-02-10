<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="project1.posts.data.PostDto"%>
<%@page import="project1.posts.data.PostDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
PostDao dao = new PostDao();
List<PostDto> list = null;
String categoryIdStr = request.getParameter("categoryId");

if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
    int categoryId = Integer.parseInt(categoryIdStr);
    list = dao.getPostsByCategoryId(categoryId); // 카테고리 ID에 맞는 게시물 조회
} else {
    list = dao.getAllPosts(); // 카테고리 선택되지 않으면 모든 게시물 조회
}

JSONArray arr = new JSONArray();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

for (PostDto dto : list) {
    JSONObject ob = new JSONObject();
    ob.put("id", dto.getId());
    ob.put("subcategory_id", dto.getSubcategory_id());
    ob.put("title", dto.getTitle());
    ob.put("content", dto.getContent());
    ob.put("writeday", sdf.format(dto.getWriteday()));

    arr.add(ob);
}

out.print(arr); // JSON 데이터 출력
%>
