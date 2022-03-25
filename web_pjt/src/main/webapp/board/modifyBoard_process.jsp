<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글수정 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String boardIdx = request.getParameter("boardIdx");
%>

<jsp:useBean id="dto" class="member.BoardDto"/>
<jsp:setProperty name="dto" property="*"/>
<jsp:useBean id="dao" class="member.BoardDao"/>

<% 
   try{
	   dao.update(dto); 
   }catch(Exception e){e.printStackTrace();}
    
	String url ="viewContent.jsp?boardIdx="+boardIdx;
	pageContext.forward(url);
%>

</body>
</html>