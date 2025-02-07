package project1.user.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.Session;

import db.connect.MysqlConnect;

public class UserDao {
	MysqlConnect db = new MysqlConnect();
	
	public int joinUser(UserDto dto) {
		int insertCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into members (id, pw, name, phone1, phone2, phone3, gender) values (?,?,?,?,?,?,?)";
		
		conn = db.getNaverCloudConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1,  dto.getId());
			pstmt.setString(2,  dto.getPw());
			pstmt.setString(3,  dto.getName());
			pstmt.setString(4,  dto.getPhone1());
			pstmt.setString(5,  dto.getPhone2());
			pstmt.setString(6,  dto.getPhone3());
			pstmt.setString(7,  dto.getGender());
			
			//실행
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
		return insertCount;
	}
	
	public boolean loginUser(UserDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from members where id = ? AND pw = ?";
		

		boolean loginSuccess = false;
		
		conn = db.getNaverCloudConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				loginSuccess = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql 구문 오류 - isRightUser(로그인 처리)");
			e.printStackTrace();
		} finally {
			db.dbCLose(rs, pstmt, conn);
		}
		return loginSuccess;
	}
}
