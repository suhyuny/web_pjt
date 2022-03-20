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
	
		function joinform_check(){
			var mClassC = document.getElementById("mClassC");
			var mId = document.getElementById("memberId");
			var mPw1 = document.getElementById("mPw1");
			var mPw2 = document.getElementById("mPw2");
			var mName = document.getElementById("mName");
			var mPhone1 = document.getElementById("mPhone1");
			var mPhone2 = document.getElementById("mPhone2");
			var mPhone3 = document.getElementById("mPhone3");
			var mAddr = document.getElementById("mAddr");
			var mEmail = document.getElementById("mEmail");
			var mCorNum = document.getElementById("mCorNum");
			
			if (mId.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
			    alert("아이디를 입력하세요.");
			    mId.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
			    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
			  }

			  if (mPw1.value == "") {
			    alert("비밀번호를 입력하세요.");
			    mPw1.focus();
			    return false;
			  }
			  
			  if (mPw2.value == "") {
			    alert("비밀번호를 다시 입력하세요.");
			    mPw2.focus();
			    return false;
			  }

			  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
			  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

			  if (!pwdCheck.test(mPw1.value)) {
			    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
			    mPw1.focus();
			    return false;
			  }

			  if (mPw1.value !== mPw2.value) {
			    alert("비밀번호가 일치하지 않습니다.");
			    mPw2.focus();
			    return false;
			  }

			  if (mName.value == "") {
			    alert("성함을 입력하세요.");
			    mName.focus();
			    return false;
			  }

			  var reg1 = /^[0-9]/g; //숫자만 입력하는 정규식
			  var reg2 = /^[0-9]/g;
			  var reg3 = /^[0-9]/g;
			  
			  if (!reg1.test(mPhone1.value)) {
			    alert("전화번호는 숫자만 입력할 수 있습니다.");
			    mPhone1.focus();
			    return false;
			  }
			  if (!reg2.test(mPhone2.value)) {
			    alert("전화번호는 숫자만 입력할 수 있습니다.");
			    mPhone2.focus();
			    return false;
			  }
			  if (!reg3.test(mPhone3.value)) {
			    alert("전화번호는 숫자만 입력할 수 있습니다.");
			    mPhone3.focus();
			    return false;
			  }
			  
			  if (mAddr.value == "") {
				    alert("주소를 입력하세요.");
				    mAddr.focus();
				    return false;
				  }
			  
			  var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			  if (exptext.test(mEmail.value) == false) {
			    alert("이메일 형식이 올바르지 않습니다.");
			    mEmail.focus();
			    return false;
			  }
			  
			  if(mClassC.checked){
				  if(mCorNum.value==""){
					  alert("사업자등록번호를 입력하세요.");
				  		mCorNum.focus();
				  		return false;
				  }
			  }
			  //입력 값 전송
			  document.join_form.submit(); //유효성 검사의 포인트   
			
		}
	</script>
 
<title>회원가입 :: K-농부 커뮤니티</title>
</head>
<body>
<div class="container">
<h1><a href="main.jsp">K-농부 커뮤니티</a></h1>
	<h4>회원가입</h4>
	<h5>K-농부 커뮤니티에 오신 것을 환영합니다.</h5>
	
	<p>모두 입력해주세요.</p>
	<form name="join_form" action="join_process.jsp" method="post">
	<div class="form-check form-check-inline mb-3" id="class">
		<div>
			<label for="join" class="form-label">회원 구분</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="memberClass" value="G" id="mClassG" checked>
			<label class="form-check-label" for="inlineRadio1">일반 회원</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="memberClass" value="C" id="mClassC">
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
		<input type="password" class="form-control" name="pw1" id="mPw1" placeholder="비밀번호를 입력해주세요." value="">
	</div>
	<div class="mb-3">
		<label for="join" class="form-label">비밀번호 확인</label>
		<input type="password" class="form-control" name="pw2" id="mPw2" placeholder="비밀번호를 한번 더 입력해주세요." value="">
	</div>
	<div class="mb-3">
		<label for="join" class="form-label">이름</label>
		<input type="text" class="form-control" name="memberName" id="mName" placeholder="성함을 입력해주세요." maxlength="5">
	</div>
	
	<label for="join" class="form-label">연락처</label>
	<div class="mb-3 row g-3">
		<div class="col-sm">
			<input type="text" name="phone1" id="mPhone1" class="form-control" placeholder="010" maxlength="3">
		</div>
		<div class="col-sm">
			<input type="text" name="phone2" id="mPhone2" class="form-control" maxlength="4">
		</div>
		<div class="col-sm">
			<input type="text" name="phone3" id="mPhone3" class="form-control" maxlength="4">
 		</div>
	</div>
	<div class="mb-3">
		<label for="join" class="form-label">주소</label>
		<input type="text" class="form-control" id="mAddr" name="memberAddr" placeholder="주소를 입력해주세요.">
	</div>
	<div class="mb-3">
		<label for="join" class="form-label">이메일</label>
		<input type="email" class="form-control" id="mEmail" name="memberEmail" placeholder="이메일 주소를 입력해주세요.">
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
		<input type="text" class="form-control" name="memberCorNum" id="mCorNum" placeholder="사업자등록번호를 입력해주세요. ( - 포함)" disabled>
		<button type="button" class="btn btn-outline-secondary" id="corNum_btn" onclick="corAuth()">인증하기</button>
	</div>
	
	<div class="btn-group" role="group">
		<button type="button" class="btn btn-success join_btn" onclick="joinform_check()">가입하기</button>
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