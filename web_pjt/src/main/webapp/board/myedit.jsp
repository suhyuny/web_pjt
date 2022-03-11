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
	<link rel="stylesheet" href="board_css.css">
	<style>
	table{
		text-align:left;
	    margin: auto;
	}
	</style>
	<title>내 정보 수정 :: K-농부 커뮤니티</title>

</head>
<body>
<div class="container" style="width:600px;">
<%@ include file="header.jsp" %>
	<h2>내 정보 수정</h2>
	<table class="table">
		<tbody>
			<tr><!-- 원래 정보가 input태그 안에 들어가있게 하기 -->
				<th scope="row" width="35%">아이디</th>
				<td>josw</td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password"></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td><input type="text"></td>
			</tr> 
			<tr>
				<th scope="row">주소</th>
				<td><input type="text"></td>
			</tr>   
			<tr>
				<th scope="row">이메일</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th scope="row">이메일 광고 수신 동의</th>
				<td>
					<input type="radio" name="ad_agree" value="Y" checked>동의함
					<input type="radio" name="ad_agree" value="N">동의하지 않음
				</td>
			</tr>
			<tr>
				<th scope="row">사업자등록번호</th>
				<td>123-45-67890</td>
			</tr>
		</tbody>
	</table>
	<div id="write_div">
		<button type="button" id="myedit_btn" class="btn btn-success" onclick="location.href='myedit.jsp'">수정하기</button>
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