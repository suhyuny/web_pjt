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
	<style>
	table{
		text-align:left;
	    margin: auto;
	}
	</style>
	<title>마이페이지 :: K-농부 커뮤니티</title>

</head>
<body>

	<jsp:useBean id="dto" class="member.MemberDto" />
	<jsp:useBean id="dao" class="member.MemberDao" />

<%@ include file="../board/header.jsp" %>
<div class="container" style="width:600px;">


<%
	/*session객체의 속성으로 저장해둔 id값을 가져와서 쿼리문 작성*/
	id = (String)session.getAttribute("id");
	dto	= dao.mypage(id, dto);
%>
	<h2 style="margin-top:50px;">마이 페이지</h2>
	<table class="table">
		<tbody>
			<tr>
				<th scope="row" width="35%">회원구분</th>
				<td>
<% 				String mc = dto.getMemberClass();
				if(mc.equals("G")){
%>					일반회원
<% 				}else if(mc.equals("C")){
%>					사업자회원
<%				}else if(mc.equals("M")){
%>					관리자
<%				}
%>				
				</td>
			</tr>
			<tr>
				<th scope="row">아이디</th>
				<td><%=dto.getMemberId() %></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td><%=dto.getMemberName() %></td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td><%=dto.getMemberPhone() %></td>
			</tr> 
			<tr>
				<th scope="row">주소</th>
				<td><%=dto.getMemberAddr() %></td>
			</tr>   
			<tr>
				<th scope="row">이메일</th>
				<td><%=dto.getMemberEmail() %></td>
			</tr>
			<tr>
				<th scope="row">이메일 광고 수신 동의</th>
					<td><input type="radio" name="memberAdagree" value="Y" onclick="return false"
					<%if (dto.getMemberAdagree().equals("Y")){
						%>checked<%
					}%> >동의함
					
					<input type="radio" name="memberAdagree" value="N" onclick="return false"
					<%if (dto.getMemberAdagree().equals("N")){
						%>checked<%
					}%> >동의하지 않음
					
				</td>
			</tr>
			<tr>
				
				<% 	String corNum = null;
					if(dto.getMemberCorNum() == null){
						corNum = "";
					}else{
						corNum = dto.getMemberCorNum(); %>
						<th scope="row">사업자등록번호<td><%=corNum %></td></th>
				<%	} %>
				
				
			</tr>
		</tbody>
	</table>
	<div class="d-grid gap-2 d-md-block" id="write_div">
		<button type="button" id="withdraw_btn" class="btn btn-outline-secondary btn-sm" onclick="location.href='.jsp'">회원탈퇴</button>
		<button type="button" id="pwchange_btn" class="btn btn-success" onclick="location.href='pwEdit.jsp'">비밀번호 변경</button>
		<button type="button" id="myedit_btn" class="btn btn-success" onclick="location.href='myEdit.jsp'">내 정보 수정</button>
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
<%@ include file="../board/footer.jsp" %>
</div><!-- container -->
</body>
</html>