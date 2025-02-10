<%@ page import="project1.posts.data.CategoryDto"%>
<%@ page import="project1.posts.data.CategoryDao"%>
<%@ page import="project1.posts.data.SubcategoryDto"%>
<%@ page import="project1.posts.data.SubcategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 업로드</title>
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 카테고리 선택 시 하위 카테고리 로드
        function loadSubcategories() {
            var categoryId = document.getElementById("category").value;
            $.ajax({
                url: "getSubcategories.jsp",
                type: "GET",
                data: { category_id: categoryId },
                success: function(response) {
                    $("#subcategoryDto").html(response);  // 하위 카테고리 옵션을 업데이트
                },
                error: function() {
                    alert("하위 카테고리를 불러오는 데 실패했습니다.");
                }
            });
        }
    </script>
    <style>
        body * {
            font-family: 'Jua';
        }
        
        .col1{
        	width : 200px;
        }
        
        .table {
        	font-size : 20px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
	<%@ include file = "nav.jsp" %>
    <h2 class="text-center">게시물 업로드</h2>
    <form action="insertaction.jsp" method="post">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th colspan="2" class="text-center" style = "font-size : 25px;">게시물 정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class = "col1"><label for="category">카테고리:</label></td>
                    <td>
                        <select id="category" name="category" class="form-select" onchange="loadSubcategories()">
                            <option value="">상위 카테고리를 먼저 선택하세요</option>
                            <%
                                CategoryDao categoryDao = new CategoryDao();
                                List<CategoryDto> categories = categoryDao.getAllCategories();
                                for (CategoryDto category : categories) {
                            %>
                            <option value="<%= category.getId() %>"><%= category.getName() %></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class = "col1"><label for="subcategoryDto">하위 카테고리:</label></td>
                    <td>
                        <select id="subcategoryDto" name="subcategoryDto" class="form-select">
                            <option value="">하위 카테고리를 선택하세요</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="title">제목:</label></td>
                    <td><input type="text" id="title" name="title" class="form-control" required></td>
                </tr>
                <tr>
                    <td><label for="content">내용:</label></td>
                    <td><textarea id="content" name="content" class="form-control" rows="4" required></textarea></td>
                </tr>
            </tbody>
        </table>
        <div class="d-flex justify-content-end">
            <input type="submit" class="btn btn-primary" value="게시물 업로드">
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
