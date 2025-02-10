<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.connect.MysqlConnect" %>

<%
    String category = request.getParameter("category"); // Get selected category from query string
    JSONArray postsArray = new JSONArray();
    ResultSet rs = null;
    PreparedStatement stmt = null;

    if (category != null && !category.isEmpty()) {
        MysqlConnect mysqlConnect = new MysqlConnect();
        Connection conn = mysqlConnect.getNaverCloudConnection(); // Get connection using Naver Cloud

        if (conn != null) {
            try {
                // Step 1: Get all subcategories for the selected category
                String subcategorySql = "SELECT id FROM subcategories WHERE category_id = ?";
                stmt = conn.prepareStatement(subcategorySql);
                stmt.setString(1, category); // Bind category parameter
                rs = stmt.executeQuery();
                
                // Collect all subcategory IDs
                List<Integer> subcategoryIds = new ArrayList<>();
                while (rs.next()) {
                    subcategoryIds.add(rs.getInt("id"));
                }

                // Step 2: Get all posts for the selected subcategories
                if (!subcategoryIds.isEmpty()) {
                    StringBuilder subcategoryPlaceholders = new StringBuilder();
                    for (int i = 0; i < subcategoryIds.size(); i++) {
                        subcategoryPlaceholders.append("?");
                        if (i < subcategoryIds.size() - 1) {
                            subcategoryPlaceholders.append(",");
                        }
                    }

                    String postSql = "SELECT * FROM posts WHERE subcategory_id IN (" + subcategoryPlaceholders.toString() + ") ORDER BY writeday DESC";
                    stmt = conn.prepareStatement(postSql);

                    // Set the subcategory IDs as parameters
                    for (int i = 0; i < subcategoryIds.size(); i++) {
                        stmt.setInt(i + 1, subcategoryIds.get(i));
                    }

                    rs = stmt.executeQuery();

                    // Add posts to JSON array
                    while (rs.next()) {
                        JSONObject post = new JSONObject();
                        post.put("id", rs.getInt("id"));
                        post.put("subcategory_id", rs.getInt("subcategory_id"));
                        post.put("title", rs.getString("title"));
                        post.put("content", rs.getString("content"));
                        post.put("writeday", rs.getString("writeday"));
                        postsArray.add(post);
                    }
                } else {
                    out.println("<p>No subcategories found for the selected category.</p>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                mysqlConnect.dbCLose(rs, stmt, conn); // Close resources
            }
        }
    }

    // Output the JSON response
    response.getWriter().write(postsArray.toString());
%>

<%
    // Here we display the posts in a table format if the category has been selected.
    if (category != null && !category.isEmpty()) {
        // Fetch posts again using the connection and display in HTML table
        MysqlConnect mysqlConnect = new MysqlConnect();
        Connection conn = mysqlConnect.getNaverCloudConnection();
        if (conn != null) {
            try {
                // Step 1: Get all subcategories for the selected category
                String subcategorySql = "SELECT id FROM subcategories WHERE category_id = ?";
                stmt = conn.prepareStatement(subcategorySql);
                stmt.setString(1, category); // Bind category parameter
                rs = stmt.executeQuery();
                
                // Collect all subcategory IDs
                List<Integer> subcategoryIds = new ArrayList<>();
                while (rs.next()) {
                    subcategoryIds.add(rs.getInt("id"));
                }

                // Step 2: Get all posts for the selected subcategories
                if (!subcategoryIds.isEmpty()) {
                    StringBuilder subcategoryPlaceholders = new StringBuilder();
                    for (int i = 0; i < subcategoryIds.size(); i++) {
                        subcategoryPlaceholders.append("?");
                        if (i < subcategoryIds.size() - 1) {
                            subcategoryPlaceholders.append(",");
                        }
                    }

                    String postSql = "SELECT * FROM posts WHERE subcategory_id IN (" + subcategoryPlaceholders.toString() + ") ORDER BY writeday DESC";
                    stmt = conn.prepareStatement(postSql);

                    // Set the subcategory IDs as parameters
                    for (int i = 0; i < subcategoryIds.size(); i++) {
                        stmt.setInt(i + 1, subcategoryIds.get(i));
                    }

                    rs = stmt.executeQuery();

                    if (rs != null) {
%>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Subcategory ID</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Write Day</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getInt("subcategory_id") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("content") %></td>
                        <td><%= rs.getString("writeday") %></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
<%
                    } else {
                        out.println("<p>No posts found for the selected category.</p>");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                mysqlConnect.dbCLose(rs, stmt, conn);
            }
        }
    }

%>
