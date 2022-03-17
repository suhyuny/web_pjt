<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글삭제</title>
<link type="text/css" rel="stylesheet" href="../css/bbs.css"></link>
</head>
<body>

<jsp:useBean id="dao" class="member.BoardDao"/>

<%
	request.setCharacterEncoding("UTF-8");

	try{
		String boardIdx = request.getParameter("boardIdx");
		dao.delete(Integer.parseInt(boardIdx));
	}catch(Exception e){e.printStackTrace();}
    
   pageContext.forward("free_board.jsp");
%>

</body>
</html>