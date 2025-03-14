package day0103db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ex1OracleConnect {

	static final String ORACLE_DRIVER = "oracle.jdbc.OracleDriver"; // oracle.jdbc에 있는 OracleDriver 클래스
	// db에 접근하려면 url과 id, password가 필요하다
	String url = "jdbc:oracle:thin:@localhost:1521/xe"; //127.0.0.1 (localhost) //Oracle은 1521 , MySQL은 3306
	String username = "angel";
	String password = "pw1234";
	
	
	public Ex1OracleConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(ORACLE_DRIVER);
			System.out.println("오라클 드라이버 성공!");
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 실패 : " +e.getMessage());
		}
	}
	
	//db 연결 성공 후 Connection을 반환하는 메서드
	public Connection getConnection() {
		Connection conn = null; //try-catch 해야하기 때문에 변수 따로 선언
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("오라클 접속 성공");
		} catch (SQLException e) {
			System.out.println("오라클 접속 실패 : " +e.getMessage());
		}
		return conn;
	}
	
	public void shopWriteData() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null; // DB로부터 타입별로 가져오는 데이터를 담고 있는 것
		String sql = "select * from shop"; // "" 안에 내용 띄어쓰기 주의
		
		conn = this.getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql); //select sql문은 ResultSet이 반환되는 executeQuery만 가능
			// 여러개인 경우 while문으로 rs.next()가 true인 동안만 반복
			System.out.println("상품코드\t상품명\t상품단가");
			System.out.println("=".repeat(30));
			while(rs.next()) {
				//컬럼명으로 가져와도 되고 인덱스로 가져와도된다. (인덱스는 1번부터)
//				String code = rs.getString("sangcode");
//				String sname = rs.getString("sangname");
//				int sprice = rs.getInt("sangprice");
				
				String code = rs.getString(1);
				String sname = rs.getString(2);
				int sprice = rs.getInt(3);
				
				System.out.println(code+"\t"+sname+"\t"+sprice);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류 : " + e.getMessage());
		}finally {
			try {
				rs.close();
			} catch (SQLException|NullPointerException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex1OracleConnect ex1 = new Ex1OracleConnect(); //생성자 호출
		ex1.shopWriteData();
	}

}
