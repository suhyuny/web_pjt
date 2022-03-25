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
	<link rel="stylesheet" href="../css/board_css.css">
	<style>
	table{
		text-align:left;
	    margin: auto;
	}
	</style>
	<title>내 정보 수정 :: K-농부 커뮤니티</title>

</head>
<body>

<%
	String memberId = (String)session.getAttribute("id");
	
	Connection conn = DBConnection.getConnection();
    String sql = "select member_id, member_name, member_phone, member_addr, member_email, member_adagree, member_corNum from member_tb where member_id=?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, memberId);
    ResultSet rs = pstmt.executeQuery();
    rs.next();

%>

<%@ include file="../board/header.jsp" %>
<div class="container" style="width:600px;">

	<h2>내 정보 수정</h2>
	<form name="editForm" method="post" action="myEdit_process.jsp">
	<input type="hidden" name="memberId" value="<%=rs.getString("member_id") %>"> 
	<table class="table">
		<tbody>
			<tr><!-- 원래 정보가 input태그 안에 들어가있게 하기 -->
				<th scope="row" width="35%">아이디</th>
				<td><%=rs.getString("member_id") %></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td><input type="text" class="form-control form-control-sm" name="memberName" value="<%=rs.getString("member_name") %>"></td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td><input type="text" class="form-control form-control-sm" name="memberPhone" value="<%=rs.getString("member_phone") %>"></td>
			</tr> 
			<tr>
				<th scope="row">주소</th>
				<td><input type="text" class="form-control form-control-sm" name="memberAddr" value="<%=rs.getString("member_addr") %>"></td>
			</tr>   
			<tr>
				<th scope="row">이메일</th>
				<td><input type="email" class="form-control form-control-sm" name="memberEmail" value="<%=rs.getString("member_email") %>"></td>
			</tr>
			<tr>
				<th scope="row">이메일 광고 수신 동의</th>
				<td>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="memberAdagree" value="Y"
						<%if (rs.getString("member_adagree").equals("Y")){
						%>checked<%
						}%> ><label class="form-check-label">동의함
						</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="memberAdagree" value="N"
						<%if (rs.getString("member_adagree").equals("N")){
						%>checked<%
						}%> >
						<label class="form-check-label">동의하지 않음
						</label>
					</div>
				</td>
			</tr>
			
			<tr>
				
				<% 	String corNum = null;
					if(rs.getString("member_corNum") == null){
						corNum = "";
					}else{
						corNum = rs.getString("member_corNum"); %>
						<th scope="row">사업자등록번호<td><%=corNum %></td></th>
				<%	} %>
				
				
			</tr>
		</tbody>
	</table>
	<div id="write_div">
		<button type="submit" id="myedit_btn" class="btn btn-success">수정하기</button>
	</div>
	</form>

	<% pstmt.close(); rs.close(); conn.close(); %>
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