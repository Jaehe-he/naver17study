package project1.posts.data;

import db.connect.MysqlConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubcategoryDao {

    public List<SubcategoryDto> getSubcategoriesByCategoryId(int categoryId) {
        List<SubcategoryDto> subcategories = new ArrayList<>();
        MysqlConnect mysqlConnect = new MysqlConnect();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = mysqlConnect.getNaverCloudConnection();
            String query = "SELECT * FROM subcategories WHERE category_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, categoryId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                SubcategoryDto subcategory = new SubcategoryDto(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name")
                );
                subcategories.add(subcategory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            mysqlConnect.dbCLose(rs, stmt, conn);
        }

        return subcategories;
    }
}
