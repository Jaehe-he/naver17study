<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.connect.MysqlConnect" %>

<%
    String category = request.getParameter("category"); // Get selected category from query string
    JSONArray postsArray = new JSONArray();

    if (category != null && !category.isEmpty()) {
        MysqlConnect mysqlConnect = new MysqlConnect();
        Connection conn = mysqlConnect.getNaverCloudConnection(); // Get connection using Naver Cloud

        if (conn != null) {
            try {
                String sql = "SELECT * FROM posts WHERE category = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, category);
                
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
                    JSONObject post = new JSONObject();
                    post.put("id", rs.getInt("id"));
                    post.put("subcategory_id", rs.getString("subcategory_id"));
                    post.put("title", rs.getString("title"));
                    post.put("content", rs.getString("content"));
                    post.put("writeday", rs.getString("writeday"));
                    postsArray.add(post);
                }

                mysqlConnect.dbCLose(rs, stmt, conn); // Close resources
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Output the JSON response
    response.getWriter().write(postsArray.toString());
%>
