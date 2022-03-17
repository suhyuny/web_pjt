<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest, java.io.*, java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="member.BoardDto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 처리</title>
</head>
<body>
	<jsp:useBean id="dao" class="member.BoardDao" />
	
<%
	request.setCharacterEncoding("UTF-8");

	String uploadPath = request.getServletContext().getRealPath("image");//이미지경로
	
	int maxSize = 10*1024*1024;
	MultipartRequest mr = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	Enumeration<?> fileTypeNames = mr.getFileNames();
	
	String fileName = (String)fileTypeNames.nextElement();
	
	String systemFileName = mr.getFilesystemName(fileName);
	String originalFileName = mr.getOriginalFileName(fileName);
	
	
	BoardDto dto = new BoardDto();
	
	dto.setBoardSbj(mr.getParameter("boardSbj"));
	dto.setBoardContent(mr.getParameter("boardContent"));
	dto.setBoardWriter((String)session.getAttribute("name"));
	dto.setBoardFilename(systemFileName);
	dto.setBoardId(mr.getParameter("boardId"));
	
	int result = dao.writeContent(dto);

	if(result == 1){
		out.println("<script>alert('게시글이 등록되었습니다.')</script>");
		out.println("<script>location.href='free_board.jsp'</script>");
	}else{
		out.println("<script>alert('게시글이 정상적으로 입력되지 않았습니다.')</script>");
     	out.println("<script> history.back(); </script>");
	}

%>
</body>
</html>