<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

	request.setCharacterEncoding("UTF-8");

	String modifyVal = request.getParameter("modifyVal");
	String replyIdx = request.getParameter("replyIdx");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "1234";//db와 연결
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,password);
		
		String sql = "update reply_tb set reply_content='"+modifyVal+"' where reply_idx="+replyIdx;
		pstmt = conn.prepareStatement(sql);
		
		pstmt.executeUpdate();
		
		sql = "SELECT * FROM REPLY_TB WHERE reply_idx="+replyIdx;
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			out.print(rs.getString("reply_content"));
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
	}
%>
