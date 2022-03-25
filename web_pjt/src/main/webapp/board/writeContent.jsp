<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/board_css.css">

	<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
	</script>
	
	<jsp:useBean id="dto" class="member.BoardDto" />
	<jsp:setProperty name="dto" property="*" />
	<jsp:useBean id="dao" class="member.BoardDao" />
 
<title>자유 게시판 :: K-농부 커뮤니티</title>

<%@ include file="header.jsp" %>
<div class="container">
<header class="d-flex justify-content-center py-3">
	<ul class="nav nav-pills">
		<li class="nav-item"><a href="freeBoard.jsp" class="nav-link active" aria-current="page">자유게시판</a></li>
		<li class="nav-item"><a href="#" class="nav-link">판매&홍보</a></li>
		<li class="nav-item"><a href="#" class="nav-link">구매요청</a></li>
		<li class="nav-item"><a href="#" class="nav-link">농부게시판</a></li>
		<li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
	</ul>
</header>
     
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<article>
		<h2>게시글 작성</h2><br>
		
		<form method="post" action="writeContent_process.jsp" enctype="multipart/form-data">
			<!--  
			select class="form-select" name="boardClass">
				<option selected hidden>게시판을 선택해주세요</option>
				<option value="1">자유게시판</option>
				<option value="2">판매&홍보</option>
				<option value="3">구매요청</option>
				<option value="4">농부게시판</option>
			</select><br-->
			<input type="hidden" name="boardId" value="<%= id%>">
			<div class="mb-3">
				<label for="subject" class="form-label">글 제목</label>
				<input type="text" class="form-control" id="subject" name="boardSbj">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">글 내용</label>
				<textarea class="form-control" id="content" name="boardContent" rows="15" style="resize:none;"></textarea>
			</div>
			<div class="mb-3">
				<label for="formFileSm" class="form-label" style="font-size:11pt;">파일 첨부하기</label>
				<input class="form-control form-control-sm" name="boardFilename" id="formFileSm" type="file">
			</div>
			<div id="write_div">
				<button type="submit" id="write_btn" class="btn btn-success">등록하기</button>
			</div>
		</form>
		</article>
<%@ include file="footer.jsp" %>
</div><!-- container 끝 -->
	
<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
</body>
</html>