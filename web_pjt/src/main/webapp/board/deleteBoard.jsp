<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		  rel="stylesheet" 
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		  crossorigin="anonymous">
	<link rel="stylesheet" href="../css/board_css.css">
	<title>K-농부 커뮤니티</title>
	<style>
		.container{
			text-align:center;
		}
		#a{
			margin-top:30px;
		}
	</style>

<jsp:useBean id ="dao" class="member.BoardDao"/>
<jsp:useBean id ="dto" class="member.BoardDto"/>

<%	
	String boardIdx = request.getParameter("boardIdx");
   	dto = dao.getPost(Integer.parseInt(boardIdx));
%>

</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">


<% 	
	if(id.equals(dto.getBoardId())){
%>
	<h2 style="width:500px; margin:auto;">정말 게시글을 삭제하시겠습니까?</h2>
	<form method="post" action="deleteBoard_process.jsp">
	<input type="hidden" name="boardIdx" value="<%=request.getParameter("boardIdx") %>"/>
		<div class="gap-2 d-md-block" style="margin-top:30px;">
			<button type="submit" class="btn btn-success">삭제하기</button>
			<button type="button" class="btn btn-success" onclick="location.href='freeBoard.jsp'">돌아가기</button>
		</div>
	</form>
	
<%	}else{
		 out.println("<script>alert('권한이 없습니다.');</script>");
		 out.println("<script> history.back(); </script>");
	}
%>	
	<!-- Optional JavaScript; choose one of the two! -->
	
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
			crossorigin="anonymous">
	</script>
	
	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
			integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" 
			crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" 
			integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" 
			crossorigin="anonymous"></script>
	-->
<%@ include file="footer.jsp" %>
</div><!-- container -->
</body>
</html>