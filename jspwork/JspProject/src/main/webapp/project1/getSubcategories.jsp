<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="project1.posts.data.SubcategoryDto" %>
<%@ page import="project1.posts.data.SubcategoryDao" %>
<%
    String categoryId = request.getParameter("category_id");
    if (categoryId != null && !categoryId.isEmpty()) {
        SubcategoryDao subcategoryDao = new SubcategoryDao();
        List<SubcategoryDto> subcategories = subcategoryDao.getSubcategoriesByCategoryId(Integer.parseInt(categoryId));

        if (subcategories.isEmpty()) {
            out.println("<option value=''>하위 카테고리가 없습니다.</option>");
        } else {
            for (SubcategoryDto subcategory : subcategories) {
                out.println("<option value='" + subcategory.getId() + "'>" + subcategory.getName() + "</option>");
            }
        }
    } else {
        out.println("<option value=''>카테고리를 선택해주세요.</option>");
    }
%>
