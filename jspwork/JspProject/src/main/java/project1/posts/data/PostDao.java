package project1.posts.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.connect.MysqlConnect;

public class PostDao {
	MysqlConnect db = new MysqlConnect();
	
	public void insertPosts(PostDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into posts (id, subcategory_id, title, content, created_at) values (?,?,?,?,now())";
		
		conn = db.getNaverCloudConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바운딩
			pstmt.setInt(1,  dto.getId());
			pstmt.setInt(2, dto.getSubcategory_id());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setTimestamp(7, dto.getCreated_at());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
		
	}
}
