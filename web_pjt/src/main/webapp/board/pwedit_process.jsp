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
	String nowSessionPw = dto.getMemberPw(); //현재 저장된 비번
	
	String nowPw = request.getParameter("nowPw");//현재비번창에 입력한비번
	String Pw1 = request.getParameter("newPw1");
	String Pw2 = request.getParameter("newPw2"); //새로입력한 비번
	String newPw = null; 
	
	
	
	if(nowPw.equals(nowSessionPw)){
		if(Pw1.equals(Pw2)){ //새로입력한 비번이 서로 같으면 newPw안에 넣어줌
			newPw = Pw1;
			out.println(newPw);
			dto.setMemberPw(newPw);
		}else{
			out.println("<script>alert('새로운 비밀번호가 일치하지 않습니다.')</script>");
			out.println("<script>history.back();</script>");
		}
	}else{
		out.println("<script>alert('현재 비밀번호가 틀렸습니다.')</script>");
	   	out.println("<script> history.back(); </script>");
	}

	int result = dao.pwedit(dto);
	if(result == 1){
		out.println("<script>alert('비밀번호 변경이 완료되었습니다.')</script>");
		out.println("<script>location.href='mypage.jsp'</script>");
		
	}else{
		out.println("<script>alert('비밀번호 변경을 실패하였습니다.')</script>");
		out.println("<script>history.back();</script>");
	}
%>	


</body>
</html>