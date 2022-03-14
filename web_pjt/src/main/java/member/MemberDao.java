package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	
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
	
	public int memberJoin(MemberDto dto) {
		int result = 0; //0:회원정보 입력 실패
		
		String sql = "insert into member_tb values(member_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		
		try(Connection conn = getConnection(); //try~with resource구문 사용
	    	PreparedStatement pstmt = conn.prepareStatement(sql)){
			
	    	pstmt.setString(1, dto.getMemberClass());
	    	pstmt.setString(2, dto.getMemberId());
	    	pstmt.setString(3, dto.getMemberPw());
	    	pstmt.setString(4, dto.getMemberName());
	    	pstmt.setString(5, dto.getMemberPhone());
	    	pstmt.setString(6, dto.getMemberAddr());
	    	pstmt.setString(7, dto.getMemberEmail());
	    	pstmt.setString(8, dto.getMemberAdagree());
	    	pstmt.setString(9, dto.getMemberCorNum());
	    
	    	pstmt.executeUpdate();
	    	
	    	result = 1; //1:회원정보 입력 성공
	    	
		}catch(Exception e) { e.printStackTrace(); }
    	
    	return result;
	}
	
	public String login(String id, String pw) {
		String result = null; //로그인 실패
		String sql = "select member_name from member_tb where member_id=? and member_pw=?";
		try(Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())  
			result = rs.getString(1); //로그인 성공
			rs.close();
			
		}catch(Exception e) { e.printStackTrace(); }
		
		return result;
	}
	
	public MemberDto mypage(String id, MemberDto dto) {
	    String sql = "select member_id, member_name, member_phone, member_addr, member_email, member_adagree, member_corNum from member_tb where member_id=?";
	    try(Connection conn = getConnection();
		    PreparedStatement pstmt = conn.prepareStatement(sql)){
		    
		    pstmt.setString(1, id);
		    ResultSet rs = pstmt.executeQuery();
		    rs.next();
		    
		    dto.setMemberId(rs.getString("member_id"));
		    dto.setMemberName(rs.getString("member_name"));
		    dto.setMemberPhone(rs.getString("member_phone"));
		    dto.setMemberAddr(rs.getString("member_addr"));
		    dto.setMemberEmail(rs.getString("member_email"));
		    dto.setMemberAdagree(rs.getString("member_adagree"));
		    dto.setMemberCorNum(rs.getString("member_corNum"));
		    
		    /* 이렇게도 쓸수있음
		    dto.setMember_id(rs.getString(1));
		    dto.setMember_pw(rs.getString(2));
		    dto.setMember_name(rs.getString(3));
		    dto.setPhone_no(rs.getString(4));*/
		    
		    rs.close();
	    }catch(Exception e) { e.printStackTrace(); }
	    
		return dto;
	}
	
	public int myedit(MemberDto dto) {
		int result = 0; //0:회원정보 수정 실패
		
		String sql ="update member_tb set member_name=?, member_phone=?, member_addr=?, member_email=?, member_adagree=? where member_id=?";
		
		try(Connection conn = getConnection(); //try~with resource구문 사용
	    	PreparedStatement pstmt = conn.prepareStatement(sql)){
			
	    	pstmt.setString(1, dto.getMemberName());
	    	pstmt.setString(2, dto.getMemberPhone());
	    	pstmt.setString(3, dto.getMemberAddr());
	    	pstmt.setString(4, dto.getMemberEmail());
	    	pstmt.setString(5, dto.getMemberAdagree());
	    	
	    	pstmt.executeUpdate();
	    	
	    	result = 1; //1:회원정보 수정 성공
	    	
		}catch(Exception e) { e.printStackTrace(); }
    	
    	return result;
	}
}
