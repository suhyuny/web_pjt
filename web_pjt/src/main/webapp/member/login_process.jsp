<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.DBConnection, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 페이지</title>
</head>
<body>

	<jsp:useBean id="dao" class="member.MemberDao" />

<%
	request.setCharacterEncoding("UTF-8");
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberIdx = request.getParameter("memberIdx");
	
	String result = dao.login(memberId, memberPw);
	
	if(result != null){//회원인 경우
	   //회원정보를 유지하기 위해 session객체 이용
	   session.setAttribute("id", memberId);
	   session.setAttribute("name", result);
	   session.setAttribute("memberIdx", memberIdx);
	   //main.jsp페이지로 이동
	   response.sendRedirect("../board/main.jsp");
   	}else{
	   out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.')</script>");
	   out.println("<script>location.href='login.jsp'</script>");
  	}

%>

</body>
</html>