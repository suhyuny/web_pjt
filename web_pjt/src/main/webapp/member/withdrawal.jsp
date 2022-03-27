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
	<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		var flag;
		var realPw = "";
		var nowPw = "";
		
		$("#confirm").click(function(){
			$.ajax({
				type:"get",
				url:"nowPw.jsp",
				data:$("form").serialize(),
				success:function(data){
					realPw = data.trim();
					nowPw = $("#nowPw").val();
					
					if(realPw == nowPw){
						$("#nowPw").css("borderColor","green");
						flag = true;
					}else if(realPw != nowPw){
						$("#nowPw").css("borderColor","red");
						flag = false;
					}
				}
			});//ajax
		});//nowPw
		
		$("#withdraw").click(function(){
			if(flag){
				if (confirm("정말 탈퇴하시겠습니까? \n회원탈퇴 후 작성하신 글과 댓글은 삭제하실 수 없습니다.") == true){
					$.ajax({
						type:"get",
						url:"withdrawal_process.jsp",
						data:$("form").serialize(),
						success:function(){
							alert('회원탈퇴가 완료되었습니다.');
							location.href="logout_process.jsp";
						}
					});//ajax
				}else{
					return;
				}
			}else{
				alert('비밀번호가 일치하지 않습니다.');
			}
		});
		
	});//jQuery
	</script>
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
<%@ include file="../board/header.jsp" %>
<div class="container">
	<form style="width:500px; margin:auto;">
		<h2 style="width:500px; text-align:left; margin-bottom:30px;">회원탈퇴</h2>
		<h6 style="text-align:left;">회원탈퇴를 하시려면 비밀번호를 입력해주세요.</h6>
			<div class="input-group mb-3">
				<input type="password" class="form-control form-control-sm" id="nowPw" name="memberName">
				<button class="btn btn-outline-secondary" type="button" id="confirm">확인</button>
			</div>
			<div class="gap-2 d-md-block" style="margin-top:30px;">
				<button type="button" id="withdraw" class="btn btn-success">탈퇴하기</button>
				<button type="button" class="btn btn-success" onclick="location.href='freeBoard.jsp'">돌아가기</button>
			</div>
	</form>
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
<%@ include file="../board/footer.jsp" %>
</div><!-- container -->
</body>
</html>