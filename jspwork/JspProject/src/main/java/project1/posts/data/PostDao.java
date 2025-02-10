package project1.posts.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.connect.MysqlConnect;
import shop.ShopDto;

public class PostDao {
    MysqlConnect db = new MysqlConnect();

    public void insertPosts(PostDto dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "insert into posts (subcategory_id, title, content, writeday) values (?,?,?,now())";
        
        conn = db.getNaverCloudConnection();
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, dto.getSubcategory_id());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbCLose(pstmt, conn);
        }
    }

    public List<PostDto> getAllPosts(){
        List<PostDto> list = new Vector<PostDto>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM posts order by id desc";
        
        conn = db.getNaverCloudConnection();
        
        try {
            pstmt=conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                PostDto dto = new PostDto();
                
                dto.setId(rs.getInt("id"));
                dto.setSubcategory_id(rs.getInt("subcategory_id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setWriteday(rs.getTimestamp("writeday"));
            
                list.add(dto);
            }
            System.out.println("Fetched Posts: " + list.size());
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbCLose(rs, pstmt, conn);
        }
        return list;
    }
    
    public List<PostDto> getPostsByCategoryId(int categoryId) {
        List<PostDto> list = new Vector<PostDto>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM posts WHERE subcategory_id IN (SELECT id FROM subcategories WHERE category_id = ?) ORDER BY id DESC";
        
        conn = db.getNaverCloudConnection();
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, categoryId); // 카테고리 ID를 바인딩
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                PostDto dto = new PostDto();
                
                dto.setId(rs.getInt("id"));
                dto.setSubcategory_id(rs.getInt("subcategory_id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setWriteday(rs.getTimestamp("writeday"));
            
                list.add(dto);
            }
            System.out.println("Fetched Posts for category: " + list.size());
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbCLose(rs, pstmt, conn);
        }
        return list;
    }

}
