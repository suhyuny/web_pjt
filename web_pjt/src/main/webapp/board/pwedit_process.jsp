<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="org.json.simple.*" %>
<%   

	request.setCharacterEncoding("UTF-8");	 

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "1234";//db와 연결

	String pw1 = request.getParameter("newPw1");
	String pw2 = request.getParameter("newPw2");
	String newPw = "";
	
	if(pw1.equals(pw2)){
		newPw = pw1;
	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,user,password);
			
			String sql = "update member_tb set member_pw='"+newPw+"' where member_id='"+session.getAttribute("id")+"'";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			out.print("비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
	
	}else{
		out.print("비밀번호가 일치하지 않습니다.");
	}

%>