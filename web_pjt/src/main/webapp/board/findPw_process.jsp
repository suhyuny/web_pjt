<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="org.json.simple.*" %>
<%   
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "1234";//db와 연결
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,password);
		
		String sql = "select member_pw from member_tb where member_id='"+request.getParameter("memberId")+"' and member_name='"+request.getParameter("memberName")+"' and member_email='"+request.getParameter("memberEmail")+"'";
		pstmt = conn.prepareStatement(sql);

		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			out.print(rs.getString("member_pw"));
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(conn != null) conn.close();
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
	}
%>