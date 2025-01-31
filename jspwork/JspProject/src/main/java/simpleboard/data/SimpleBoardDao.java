package simpleboard.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.connect.MysqlConnect;

public class SimpleBoardDao {

	MysqlConnect db=new MysqlConnect();
	
	public List<SimpleBoardDto> getAllDatas()
	{
		List<SimpleBoardDto> list=new Vector<SimpleBoardDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from simpleboard order by num desc";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				SimpleBoardDto dto=new SimpleBoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				//list 에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbCLose(rs, pstmt, conn);
		}
		return list;
	}
	
	public void insertBoard(SimpleBoardDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into simpleboard (writer,subject,content,writeday) values (?,?,?,now())";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbCLose(pstmt, conn);
		}
	}
	
	public SimpleBoardDto getData(int num)
	{
		SimpleBoardDto dto=new SimpleBoardDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from simpleboard where num=?";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbCLose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public void updateReadCount(int num)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update simpleboard set readcount=readcount+1 where num=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, num);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbCLose(pstmt, conn);
		}
	}
	
	public void deleteBoard(int num)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from simpleboard where num=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, num);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbCLose(pstmt, conn);
		}
	}
	
	public void updateBoard(SimpleBoardDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update simpleboard set writer=?,subject=?,content=? where num=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbCLose(pstmt, conn);
		}
	}
}








