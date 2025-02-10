package project1.posts.data;

import db.connect.MysqlConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {

    public List<CategoryDto> getAllCategories() {
        List<CategoryDto> categories = new ArrayList<>();
        MysqlConnect mysqlConnect = new MysqlConnect();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = mysqlConnect.getNaverCloudConnection();
            String query = "SELECT * FROM categories";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                CategoryDto category = new CategoryDto(rs.getInt("id"), rs.getString("name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            mysqlConnect.dbCLose(rs, stmt, conn);
        }

        return categories;
    }
}
