package shop.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.connect.MysqlConnect;
import shop.data.ShopDto;

public class ShopDao {
	MysqlConnect db = new MysqlConnect();
	
	public void insertShop(ShopDto dto) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql = "insert into shop (sangpum, scolor, scnt, sprice, sphoto, ipgoday, writeday) values (?,?,?,?,?,?, now())";
		
		conn = db.getNaverCloudConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2,  dto.getScolor());
			pstmt.setInt(3,  dto.getScnt());
			pstmt.setInt(4,  dto.getSprice());
			pstmt.setString(5, dto.getSphoto());
			pstmt.setString(6,  dto.getIpgoday());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbCLose(pstmt, conn);
		}
	}
	
	//order : 1. 등록순 2. 높은 가격순 3. 낮은가격순 4. 상품명순
	public List<ShopDto> getAllSangpums(int order){
		List<ShopDto> list = new Vector<ShopDto>();
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		if(order == 1)
			sql = "select * from shop order by num";
		else if(order == 2)
			sql = "select * from shop order by sprice desc";
		else if(order == 3)
				sql = "select * from shop order by num asc"; //asc는 생략 가능
		else if(order == 4)
			sql = "select * from shop order by sangpum asc";

		conn = db.getNaverCloudConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ShopDto dto = new ShopDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setScolor(rs.getString("scolor"));
				dto.setScnt(rs.getInt("scnt"));
				dto.setSprice(rs.getInt("sprice"));
				dto.setSphoto(rs.getString("sphoto"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(rs,  pstmt, conn);
		}
		return list;
	}
}
