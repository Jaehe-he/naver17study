package shop.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.connect.MysqlConnect;

public class ShopRepleDao {
	MysqlConnect db = new MysqlConnect();
	
	public void insertReple(ShopRepleDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into shopreple values (null, ?,?,?,now())"; //values 앞에 컬럼명 안적을경우 순서대로 값을 지정해주면 됨. num은 auto_increment로 줬기 때문에 null로 선언
		conn=db.getNaverCloudConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1,  dto.getNum());
			pstmt.setInt(2,  dto.getStar());
			pstmt.setString(3,  dto.getMessage());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
		
	}
	
	public void deleteReple(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from shopreple where idx=?";
		conn=db.getNaverCloudConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, idx);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
	}
	
	public List<ShopRepleDto> getRepleByNum(int num){
		List<ShopRepleDto> list = new Vector<ShopRepleDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from shopreple where num=? order by idx desc";
		conn=db.getNaverCloudConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, num);
			
			//실행
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ShopRepleDto dto = new ShopRepleDto();
				dto.setIdx(rs.getInt("idx"));
				dto.setNum(rs.getInt("num"));
				dto.setStar(rs.getInt("star"));
				dto.setMessage(rs.getString("message"));
				dto.setWrieday(rs.getTimestamp("writeday"));
				
				list.add(dto); //***중요!!! 데이터를 넘기기 위함
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
		
		return list;
	}
}
