<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.DBConnection, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 페이지</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="dto" class="member.MemberDto" />
	<jsp:setProperty name="dto" property="*" />
	<jsp:useBean id="dao" class="member.MemberDao" />

<%
	
	

    String Pw1 = request.getParameter("pw1");
    String Pw2 = request.getParameter("pw2");
    
    String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	
	dto.setMemberPhone(phone1+"-"+phone2+"-"+phone3);
    
	if(Pw1.equals(Pw2)){
		dto.setMemberPw(Pw1);
		
		int result = dao.memberJoin(dto);
		if(result == 1){
			response.sendRedirect("joinSuccess.jsp");
		}else{
			out.println("<script>alert('회원정보 입력 실패')</script>");
			out.println("<script> history.back(); </script>");
		}
		
	}else{
   	 out.println("<script>alert('비밀번호가 일치하지 않습니다.')</script>");
   	 out.println("<script> history.back(); </script>");
    }
     
	
	
	
%>

</body>
</html>