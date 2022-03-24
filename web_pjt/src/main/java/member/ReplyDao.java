package member;

import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import member.BoardDto;

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
	
	public List<ReplyDto> getReply(int num){
		List<ReplyDto> replyList = null;
		String sql = "SELECT * FROM reply_tb WHERE BOARD_IDX = ? order by reply_idx";
		
		try(Connection conn = getConnection();
			PreparedStatement pstmt	= conn.prepareStatement(sql)){
			
			pstmt.setInt(1, num);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs != null) 
				replyList = new ArrayList<ReplyDto>();
			
			while(rs.next()){
				ReplyDto dto = new ReplyDto();
				
				dto.setReplyIdx(rs.getInt("reply_idx"));
				dto.setReplyContent(rs.getString("reply_content"));
				dto.setReplyWriter(rs.getString("reply_writer"));
				dto.setReplyDate(rs.getDate("reply_date"));
				dto.setReplyId(rs.getString("reply_id"));
				dto.setBoardIdx(rs.getInt("board_idx"));
				
				replyList.add(dto);
			}
			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return replyList;
	}
}
