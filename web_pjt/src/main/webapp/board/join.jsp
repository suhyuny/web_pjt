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
		width:500px;
	}
	h1{
		text-align:center;
		margin-top:40px;
		margin-bottom:30px;
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
	h4{
		margin-top:50px;
		font-size:23pt;
	}
	h5{
		margin-bottom:50px;
		font-size:14pt;
	}
	p{
		color:#CA264C;
	}
	.btn-group{
		margin:50px 0px;
	}
	#class, #ad_agree{
	    padding-left: 0px;
	}
	.footer{ 
		text-align:center;
		font-size:8pt;
	}
	#result{
		font-size:10pt;
	}
	</style>
	
	<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			
			$("#idCheck").click(function(){
				$.ajax({
					type:"get",
					url:"idcheck.jsp",
					success:function(data){
						var dataJson = JSON.parse(data.trim());
						var existId = ""; //기존 memberId
						var checkId = $("#memberId").val();
						var flag = false;
						
						for(var i=0; i<dataJson.length; i++){
							existId = dataJson[i].memberId;
							if(checkId == existId){
								$("#result").html("&nbsp;이미 사용중인 아이디입니다.");break;
							}
							else if(checkId != existId){
								$("#result").html("&nbsp;사용 가능한 아이디입니다.");
								flag = true;
							}
						}if(checkId == ""){
							$("#result").html("&nbsp;아이디를 입력해주세요.");
						}console.log(flag);
					}
				});//idCheck
			});//jQuery
			
			/*일반회원에 체크-사업자등록번호 비활성화*/
			$("input:radio[name=memberClass]").click(function(){

			if($("input[name=memberClass]:checked").val() == "G"){
				$("input:text[name=memberCorNum]").attr("disabled",true);
			}else if($("input[name=memberClass]:checked").val() == "C"){
				$("input:text[name=memberCorNum]").attr("disabled",false);
				}
			});
		});

	</script>
 
<title>회원가입 :: K-농부 커뮤니티</title>
</head>
<body>
<div class="container">
<h1><a href="main.jsp">K-농부 커뮤니티</a></h1>
	<h4>회원가입</h4>
	<h5>K-농부 커뮤니티에 오신 것을 환영합니다.</h5>
	
	<p>모두 입력해주세요.</p>
	<form action="join_process.jsp" method="post">
	<div class="form-check form-check-inline mb-3" id="class">
		<div>
			<label for="join" class="form-label">회원 구분</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="memberClass" value="G" checked>
			<label class="form-check-label" for="inlineRadio1">일반 회원</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="memberClass" value="C">
			<label class="form-check-label" for="inlineRadio2">사업자 회원</label>
		</div>
	</div>

	<div class="mb-0">
		<label for="join" class="form-label">아이디<span id="result"></span></label>
	</div>
	<div class="input-group mb-3">
		<input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력해주세요.">
		<button class="btn btn-outline-secondary" type="button" id="idCheck">ID중복확인</button>
	</div>
	
	<div class="mb-3">
		<label for="join" class="form-label">비밀번호</label>
		<input type="password" class="form-control" name="pw1" placeholder="비밀번호를 입력해주세요." value="">
	</div>
	<div class="mb-3">
		<label for="join" class="form-label">비밀번호 확인</label>
		<input type="password" class="form-control" name="pw2" placeholder="비밀번호를 한번 더 입력해주세요." value="">
	</div>
	<div class="mb-3">
		<label for="join" class="form-label">이름</label>
		<input type="text" class="form-control" name="memberName" placeholder="성함을 입력해주세요." maxlength="5">
	</div>
	
	<label for="join" class="form-label">연락처</label>
	<div class="mb-3 row g-3">
		<div class="col-sm">
			<input type="text" name="phone1" class="form-control" placeholder="010" maxlength="3">
		</div>
		<div class="col-sm">
			<input type="text" name="phone2" class="form-control" maxlength="4">
		</div>
		<div class="col-sm">
			<input type="text" name="phone3" class="form-control" maxlength="4">
 		</div>
	</div>
	<div class="mb-3">
		<label for="join" class="form-label">주소</label>
		<input type="text" class="form-control" name="memberAddr" placeholder="주소를 입력해주세요.">
	</div>
	<div class="mb-3">
		<label for="join" class="form-label">이메일</label>
		<input type="email" class="form-control" name="memberEmail" placeholder="이메일 주소를 입력해주세요.">
	</div>
	
		<div class="form-check form-check-inline mb-3" id="ad_agree">
		<div>
			<label for="join" class="form-label">이메일 광고 수신 동의</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="memberAdagree" value="Y" checked>
			<label class="form-check-label">동의함</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="memberAdagree" value="N">
			<label class="form-check-label">동의하지 않음</label>
		</div>
	</div>
	
	<div class="mb-0">
		<label for="join" class="form-label">사업자등록번호</label>
	</div>
	<div class="input-group mb-3">
		<input type="text" class="form-control" name="memberCorNum" placeholder="사업자등록번호를 입력해주세요. ( - 포함)" disabled>
		<!-- button type="button" class="btn btn-outline-secondary" id="corNum_btn" onclick="corAuth('this')">인증하기</button-->
	</div>
	
	<div class="btn-group" role="group">
		<button type="submit" class="btn btn-success join_btn">가입하기</button>
		<button type="button" class="btn btn-outline-success join_btn">취소하기</button>
	</div>
	</form>
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