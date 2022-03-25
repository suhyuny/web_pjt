<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.DBConnection, java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정 페이지</title>
</head>
<body>

<% 
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="dto" class="member.MemberDto" />
	<jsp:setProperty name="dto" property="*" />
	<jsp:useBean id="dao" class="member.MemberDao" />
	
<%
	int result = dao.myedit(dto);
	if(result == 1){
		out.println("<script>alert('정보수정이 완료되었습니다. 다시 로그인해주세요.')</script>");
		out.println("<script>location.href='logout_process.jsp'</script>");
		
	}else{
		out.println("<script>alert('정보수정을 실패하였습니다.')</script>");
		out.println("<script> history.back(); </script>");
	}
%>	


</body>
</html>