package member;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BoardDao {
	
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
	
	public int writeContent(BoardDto dto){
		int result = 0;//0:게시글 입력 실패, 1:게시글 입력 성공
		String sql = "insert into board_tb(board_idx, board_sbj, board_content, board_writer, board_date, board_filename, board_id) values(board_seq.nextval,?,?,?,sysdate,?,?)";
		try(Connection conn = getConnection();
			PreparedStatement pstmt	=conn.prepareStatement(sql)){
			
			pstmt.setString(1, dto.getBoardSbj());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setString(3, dto.getBoardWriter());
			pstmt.setString(4, dto.getBoardFilename());
			pstmt.setString(5, dto.getBoardId());
			
			pstmt.executeUpdate();
			
			result = 1;//입력성공
     
		}catch(Exception e){ e.printStackTrace(); }
		
        return result;
	}
	
	public int countHits(){
		int count = 0;
		String sql = "select count(board_idx) from board_tb";
		
		try(Connection con = getConnection();
			PreparedStatement pstmt	=con.prepareStatement(sql);
			ResultSet rs= pstmt.executeQuery()){
			
			if(rs != null) 
				rs.next();

			count=rs.getInt(1);
			
		}catch(Exception e){ e.printStackTrace(); }
		
		return count;
	}
	
	public void updateHits(int num) {
		String sql = "update board_tb set board_hits=(board_hits+1) where board_idx=?";
		try(Connection conn = getConnection();
			PreparedStatement pstmt	=conn.prepareStatement(sql)){
		
		pstmt.setInt(1, num);
		
        pstmt.executeUpdate();
        
		}catch(Exception e){e.printStackTrace();}
	}
	
	public List<BoardDto> getPost(int start, int end){
		List<BoardDto> articleList = null;
		String sql = "SELECT * FROM ("
				+ "	select ROWNUM r, board_idx, board_sbj, board_content, board_writer, board_date, board_hits, board_reply, board_filename, board_id"
				+ "	from board_tb order by board_idx DESC)"
				+ " where r >= ?  and r <= ? ";
		try(Connection conn = getConnection();
			PreparedStatement pstmt	=conn.prepareStatement(sql)){
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs= pstmt.executeQuery();
			
			if(rs != null) 
				articleList = new ArrayList<BoardDto>();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();

				dto.setBoardIdx(rs.getInt("board_idx"));
				dto.setBoardSbj(rs.getString("board_sbj"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardWriter(rs.getString("board_writer"));
				dto.setBoardDate(rs.getDate("board_date"));
				dto.setBoardHits(rs.getInt("board_hits"));
				dto.setBoardReply(rs.getInt("board_reply"));
				dto.setBoardFilename(rs.getString("board_filename"));
				dto.setBoardId(rs.getString("board_id"));
				
				articleList.add(dto);
			}
			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return articleList;
	}
	
	public BoardDto getPost(int num){
		BoardDto dto = null;
		String sql = "select * from board_tb where board_idx=?";
			try(Connection conn = getConnection();
			PreparedStatement pstmt	=conn.prepareStatement(sql)){

			pstmt.setInt(1, num);
			ResultSet rs= pstmt.executeQuery();
						
			while(rs.next()){
				
				dto = new BoardDto();
				
				dto.setBoardIdx(rs.getInt("board_idx"));
				dto.setBoardSbj(rs.getString("board_sbj"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardWriter(rs.getString("board_writer"));
				dto.setBoardDate(rs.getDate("board_date"));
				dto.setBoardHits(rs.getInt("board_hits"));
				dto.setBoardReply(rs.getInt("board_reply"));
				dto.setBoardFilename(rs.getString("board_filename"));
				dto.setBoardId(rs.getString("board_id"));
				
			}
			
			rs.close();
		}catch(Exception e){e.printStackTrace();}
		
		return dto;
	}
	
	public void update(BoardDto dto){
		String sql = "update board_tb set board_sbj=?,board_content=? where board_idx=?";//글번호에 대한 게시글을 업데이트하는 SQL문을 작성하시오.
		try(Connection conn = getConnection();
			PreparedStatement pstmt	=conn.prepareStatement(sql)){
		
			/* 구현하시오. */
			pstmt.setString(1, dto.getBoardSbj());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setInt(3, dto.getBoardIdx());
			
			pstmt.executeUpdate();
        
		}catch(Exception e){e.printStackTrace();}
	}
	
	
	public void delete(int boardIdx){
		String sql = "delete from board_tb where board_idx=?";
		try(Connection conn = getConnection();
			PreparedStatement pstmt	=conn.prepareStatement(sql)){
		
		pstmt.setInt(1, boardIdx);
	
        pstmt.executeUpdate();
        
		}catch(Exception e){e.printStackTrace();}
	}
	
}
