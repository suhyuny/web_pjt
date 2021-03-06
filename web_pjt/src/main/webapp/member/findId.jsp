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

	<style>
	.container{
		width:350px;
		text-align:center;
	}
	h1{
		text-align:center;
		margin-top:40px;
		margin-bottom:60px;
	}
	a{ 
		text-decoration:none;
	}
	a:link{
		color:#198754;
	}
	a:visited{
		color:#198754;
	}
	
	button{
		margin-top:20px;
	}
	.login_bottom{
		margin-top: 30px;
		color:#6c757d;
	}
	.under:link{
		color:#6c757d;
	}
	.under:visited{
		color:#6c757d;
	}
	</style>
	
	<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		
		$("#findId").click(function(){
			$.ajax({
				type:"get",
				url:"findId_process.jsp",
				data:$("form").serialize(),
				success:function(data){
					var memberId = data.trim();
					
					if(memberId == ""){
						//$("#id").html("성함과 이메일과 일치하는 아이디가 없습니다.");
						alert('일치하는 아이디가 없습니다.');
					}else{
						//$("#id").html("찾으신 아이디는 "+memberId+"입니다.");
						alert('찾으신 아이디는 ['+memberId+']입니다.');
					}
					
				}
			});
		});
	});
	</script>
	
<title>아이디 찾기 :: K-농부 커뮤니티</title> 
</head>
<body>
<div class="container">
<h1 id="header"><a href="../board/main.jsp"><img src="../image/logo.png" width="330"></a></h1>
<h2 style="text-align:left; font-size:17pt;">아이디 찾기</h2>
<form>
    <div class="form-floating">
      <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름">
      <label>이름</label>
    </div>
    <div class="form-floating">
      <input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일">
      <label>이메일</label>
    </div>
    <button class="w-100 btn btn-lg btn-success" type="button" id="findId">아이디 찾기</button>
    <span id="id"></span>
    <div class="login_bottom">
	    <a class="under" href="findPw.jsp">비밀번호 찾기</a> |
	    <a class="under" href="login.jsp">로그인</a> |
	    <a class="under" href="join.jsp">회원가입</a>
    </div>
    
    <p class="mt-5 mb-3 text-muted">© K-농부 커뮤니티</p>
  </form>
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