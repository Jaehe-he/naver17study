package day0103db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ex4MysqlJoin {
	static final String MYSQL_DRIVER="com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study502?serverTimezone=Asia/Seoul"; // 추후에 프로젝트 땐 localhost가 클라우드 주소로 들어갈 것
	String username = "root";
	String password = "1234";
	
	public Ex4MysqlJoin() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(MYSQL_DRIVER);
			System.out.println("Mysql 드라이버 성공!");
		} catch (ClassNotFoundException e) {
			System.out.println("Mysql 드라이버 실패 : "+e.getMessage());
		}
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("Mysql 접속 성공");
		} catch (SQLException e) {
			System.out.println("Mysql 접속 실패 : " +e.getMessage());
		}
		return conn;
	}
	
	public void personBloodGroup() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//혈액형별 인원수랑 나이평균 구하기
		String sql = """
			select blood, count(*) count, round(avg(age),1) avgage from person
			group by blood order by count
				""";
		
		conn = this.getConnection();
		
		try {
	         stmt = conn.createStatement();
	         rs = stmt.executeQuery(sql);
	         
	         System.out.println("혈액형\t인원수\t평균나이");
	         System.out.println("=".repeat(50));
	         
	         while(rs.next())
	         {
	            String blood = rs.getString("blood");
	            int count = rs.getInt("count");
	            String avgage = rs.getString("avgage");
	            
	            System.out.println(blood+"\t"+count+"\t"+avgage);
	         }
	         
	      } catch (SQLException e) {
	         System.out.println("sql문 오류: "+e.getMessage());
	      } finally {
	         try {
	            rs.close();
	            stmt.close();
	            conn.close();
	            
	         } catch (SQLException | NullPointerException e) { // NullPinterException 필요한 이유?
	         
	            e.printStackTrace();
	         }
	      }
	   }
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	      Ex4MysqlJoin ex4 = new Ex4MysqlJoin();
	      ex4.personBloodGroup();

	}

}
