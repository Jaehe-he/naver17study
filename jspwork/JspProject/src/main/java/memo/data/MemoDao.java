package memo.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.connect.MysqlConnect;

public class MemoDao {
	MysqlConnect db = new MysqlConnect();
	
	public void insertMemo(MemoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into ajaxmemo (nickname,avata,message,writeday) values (?,?,?,now())";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getNickName());
			pstmt.setString(2, dto.getAvata());
			pstmt.setString(3,  dto.getMessage());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
			}
	
	public void deleteMemo(int idx) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql="delete from ajaxmemo where idx=?";
		
		conn = db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, idx);
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
	}
	
	public void UpdateMemo(MemoDto dto) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql="update ajaxmemo nickname=?, avata=?, message=? where idx=?";
		
		conn = db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getNickName());
			pstmt.setString(2,  dto.getAvata());
			pstmt.setString(3,  dto.getMessage());
			pstmt.setInt(4,  dto.getIdx());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(pstmt, conn);
		}
	}
	
	public List<MemoDto> getAllMemos(){
		List<MemoDto> list = new Vector<MemoDto>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from ajaxmemo order by idx desc";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemoDto dto = new MemoDto();
				dto.setIdx(rs.getInt("idx"));
				dto.setAvata(rs.getString("avata"));
				dto.setNickName(rs.getString("nickname"));
				dto.setMessage(rs.getString("message"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public List<MemoDto> getSearchMemos(String nickname){
		List<MemoDto> list = new Vector<MemoDto>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from ajaxmemo where nockname like ? order by idx desc";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1,  "%"+nickname+"%");
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemoDto dto = new MemoDto();
				dto.setIdx(rs.getInt("idx"));
				dto.setAvata(rs.getString("avata"));
				dto.setNickName(rs.getString("nickname"));
				dto.setMessage(rs.getString("message"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbCLose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public MemoDto getOneMemo(int idx){ // 반환 타입을 List<MemoDto>에서 MemoDto로 변경
	    MemoDto dto = null; // 기본값을 null로 설정
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    String sql = "select * from ajaxmemo where idx = ?"; // SQL 문법 오류 수정

	    conn = db.getConnection();
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, idx); // 바인딩 추가

	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            dto = new MemoDto(); // dto 객체 생성
	            dto.setIdx(rs.getInt("idx"));
	            dto.setAvata(rs.getString("avata"));
	            dto.setNickName(rs.getString("nickname"));
	            dto.setMessage(rs.getString("message"));
	            dto.setWriteday(rs.getTimestamp("writeday"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        db.dbCLose(rs, pstmt, conn);
	    }

	    return dto; // MemoDto 객체 반환
	}



}
