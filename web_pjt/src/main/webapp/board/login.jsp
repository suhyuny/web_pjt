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
<title>로그인 :: K-농부 커뮤니티</title> 
</head>
<body>
<div class="container">
<h1><a href="main.jsp">K-농부 커뮤니티</a></h1>
<form>
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingId" placeholder="아이디">
      <label for="floatingId">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword">비밀번호</label>
    </div>
    <button class="w-100 btn btn-lg btn-success" type="submit">로그인</button>
    <div class="login_bottom">
	    <a class="under" href="">ID 찾기</a> |
	    <a class="under" href="">비밀번호 찾기</a> |
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