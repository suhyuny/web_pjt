<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jdbc.DBConnection" %>  
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
	<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		var flag;
		var realPw = "";
		var nowPw = "";
		
		$("#nowPw").blur(function(){
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
			
		$("#pwedit_btn").click(function(){
			var newPw1 = $("#newPw1").val();
			var newPw2 = $("#newPw2").val();
			var newPw = "";
			
			var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
			  
			if((realPw == nowPw) && (newPw1 == newPw2)){
				newPw = newPw1;
				if (!pwdCheck.test(newPw)) {
					alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
				    return false;
				}
				$.ajax({
					type:"get",
					url:"pwedit_process.jsp",
					data:$("form").serialize(),
					success:function(data){
						alert(data);
						location.href="logout_process.jsp";
					}
				});//ajax
				
			}else if(realPw != nowPw){
				alert('현재 비밀번호가 일치하지 않습니다.');
			}else if(newPw1 != newPw2){
				alert('변경할 비밀번호가 일치하지 않습니다.');
			}
		});
		
	});//jQuery
	</script>
	
	<title>비밀번호 변경 :: K-농부 커뮤니티</title>

</head>
<body>

<div class="container" style="width:600px;">
<%@ include file="header.jsp" %>
	<h2>비밀번호 변경</h2>
	<form method="post" action="pwedit_process.jsp">
	<p>비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.</p>
	<table class="table">
		<tbody>
			<tr>
				<th scope="row">현재 비밀번호</th>
				<td><input type="password" class="form-control form-control-sm" id="nowPw" name="nowPw"></td>
			</tr>
			<tr>
				<th scope="row">변경할 비밀번호</th>
				<td><input type="password" class="form-control form-control-sm" id="newPw1" name="newPw1"></td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인</th>
				<td><input type="password" class="form-control form-control-sm" id="newPw2" name="newPw2"></td>
			</tr>
		</tbody>
	</table>
	<div id="write_div">
		<button type="button" id="pwedit_btn" class="btn btn-success">수정하기</button>
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
<%@ include file="footer.jsp" %>
</div><!-- container -->
</body>
</html>