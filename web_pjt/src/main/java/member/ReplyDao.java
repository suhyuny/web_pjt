package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ReplyDao {
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 로딩 완료
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			System.out.println("DB 연결 성공");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DB 연결 실패");
		}
		
		return conn;
	}
}
