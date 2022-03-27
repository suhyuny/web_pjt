<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글삭제</title>
</head>
<body>

<jsp:useBean id="dao" class="member.BoardDao"/>

<%
	request.setCharacterEncoding("UTF-8");
	
	try{
		String boardIdx = request.getParameter("boardIdx");
		dao.deleteReply(Integer.parseInt(boardIdx));
		dao.delete(Integer.parseInt(boardIdx));
	}catch(Exception e){e.printStackTrace();}
    
   pageContext.forward("freeBoard.jsp");
%>

</body>
</html>