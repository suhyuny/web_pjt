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
    <link rel="stylesheet" href="board_css.css">

	<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("td:nth-child(3n+2)").css("text-align","left");
		});
	</script>
 
<title>자유 게시판 :: K-농부 커뮤니티</title>

<div class="container">
<%@ include file="header.jsp" %>
<header class="d-flex justify-content-center py-3">
	<ul class="nav nav-pills">
		<li class="nav-item"><a href="free_board.jsp" class="nav-link active" aria-current="page">자유게시판</a></li>
		<li class="nav-item"><a href="sell_board.jsp" class="nav-link">판매&홍보</a></li>
		<li class="nav-item"><a href="buy_board.jsp" class="nav-link">구매요청</a></li>
		<li class="nav-item"><a href="seller_board.jsp" class="nav-link">농부게시판</a></li>
		<li class="nav-item"><a href="notice.jsp" class="nav-link">공지사항</a></li>
	</ul>
</header>
     
<body>
	<article>
		<h2>자유게시판</h2><br>
		<form action="#" method="#">
			<div class="mb-3 row g-3">
				<div class="col-sm-8">
					<input type="text" class="form-control" id="subject" value="글 제목" readonly>
				</div>
				<div class="col-sm">
					<input type="text" class="form-control" value="조회수 100">
				</div>
				<div class="col-sm">
					<input type="text" class="form-control" value="2022-01-01">
				</div>
			</div>
			<div class="mb-3">
				<textarea class="form-control" id="content" rows="15" style="resize:none;" readonly>
				공지사항입니다.
				.
				.
				.
				.
				.
				</textarea>
			</div>
			<div class="d-grid gap-2 d-md-block" id="write_div">
				<button type="button" id="modify_btn" class="btn btn-success" onclick="location.href='modify.jsp'">수정하기</button>
				<button type="button" id="delete_btn" class="btn btn-success">삭제하기</button>
			</div>
		</form>
		<form action="#" method="#">
		<p id="reply">댓글</p>
			<table class="table">
				<thead>
					<tr>
						<th scope="col" width="10%">닉네임</th>
						<th scope="col" width="75%">내용</th>
						<th scope="col" width="15%">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>닉네임</th>
						<td>감사합니다 안녕하세요 공지사항이네요
						<button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
						<button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
						</td>
						<td>2022-01-01</td>
					</tr>
					<tr>
						<td>닉네임</th>
						<td>감사합니다 안녕하세요 공지사항이네요</td>
						<td>2022-01-01</td>
					</tr>
				</tbody>
			</table>
		<div class="input-group mb-3">
			<textarea class="form-control" placeholder="댓글을 입력해주세요." style="resize:none;"></textarea>
			<button class="btn btn-outline-secondary" type="button" id="button-addon2">댓글 등록하기</button>
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