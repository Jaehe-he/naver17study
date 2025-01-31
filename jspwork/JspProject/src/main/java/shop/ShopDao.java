package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.connect.MysqlConnect;

public class ShopDao {
	MysqlConnect connect = new MysqlConnect();
	
	public List<ShopDto> getAllDatas(String search){
		List<ShopDto> list = new Vector<ShopDto>();
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		if(search==null || search.equals(""))
			sql = "select * from shop order by idx";
		else
			sql="select * from shop where sangpum like '%"+search+"%' order by idx";
		
		conn = connect.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ShopDto dto = new ShopDto();
				dto.setIdx(rs.getInt("idx"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setSu(rs.getInt("su"));
				dto.setDanga(rs.getInt("danga"));
				dto.setIpgoday(rs.getString("ipgoday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			connect.dbCLose(rs,  pstmt, conn);
		}
		return list;
	}
}
