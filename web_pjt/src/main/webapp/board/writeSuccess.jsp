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
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
	<h2 style="width:500px; margin:auto;">게시글 등록이 완료되었습니다.</h2>
	<div id="a">
		<a href="main.jsp">메인으로</a> |
		<a href="freeBoard.jsp">글 목록 보기</a>
	</div>
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