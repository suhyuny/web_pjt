<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="org.json.simple.*" %>
<%   

	request.setCharacterEncoding("UTF-8");	 

	String replyContent = request.getParameter("replyContent");
	String replyWriter = request.getParameter("replyWriter");
	String replyId = request.getParameter("replyId");
	String boardIdx = request.getParameter("boardIdx");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "1234";//db와 연결

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,password);
		
		String sql = "insert into reply_tb values(reply_seq.nextval,'"+replyContent+"','"+replyWriter+"',sysdate,'"+replyId+"','"+boardIdx+"')";
    	
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		sql = "SELECT * FROM REPLY_TB WHERE reply_idx = (SELECT MAX(reply_idx) FROM REPLY_TB)";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		JSONArray jArray = new JSONArray(); //json 파일에 대괄호 입힘
		
		while(rs.next()){
			JSONObject jObj = new JSONObject();
			//키,값 쌍으로 데이터가 저장됨 -> json객체로 출력함
			jObj.put("replyWriter",rs.getString("reply_writer"));
			jObj.put("replyContent",rs.getString("reply_content"));
			jObj.put("replyDate",rs.getString("reply_date"));
			
			jArray.add(jObj);//jArray에 넣어줌
		}
		out.print(jArray.toJSONString());//화면에 출력
		
	}catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(conn != null) conn.close();
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
	}
	
%>