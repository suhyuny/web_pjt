package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() {
		Connection conn = null; //데이터베이스 연결 객체 변수 선언
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 로딩 완료
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			System.out.println("DB 연결 성공");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DB 연결 실패");
		}
		
		return conn;
	}
}