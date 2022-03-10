<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 :: K-농부 커뮤니티</title>
<style>
	form{
		border:1px solid gray;
		border-radius:5px;
		width:500px;
		margin:auto;
		text-align:center;
	}
	table{
		margin:auto;
		border:1px solid gray;
	}
	th{
		text-align:left;
	}
	td{
		text-align:left;
		height:30px;
	}
	span{
		color:red;
	}
	input{
		height:25px;
	}
	
</style>
</head>
<body>
	<form action="">
		<h2>회원가입</h2>
		<input type="radio" name="member_class">일반회원
		<input type="radio" name="member_class">사업자회원
		<table>
		<tbody>
			<tr>
				<th>아이디<span> *</span></th>
				<td>
					<input type="text" name="id" placeholder="아이디를 입력하세요">
					<button>ID중복확인</button>
				</td>
			</tr>
			<tr>
				<th>비밀번호<span> *</span></th>
				<td>
					<input type="password" name="pw1" placeholder="비밀번호를 입력하세요">
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인<span> *</span></th>
				<td>
					<input type="password" name="pw2" placeholder="비밀번호를 다시 입력하세요">
				</td>
			</tr>
			<tr>
				<th>이름<span> *</span></th>
				<td>
					<input type="text" name="name" placeholder="성함을 입력하세요">
				</td>
			</tr>
			<tr>
				<th>연락처<span> *</span></th>
				<td>
					<input type="text" name="phone1" size="4" maxlength="3"> - 
					<input type="text" name="phone2" size="4" maxlength="4"> - 
					<input type="text" name="phone3" size="4" maxlength="4">
				</td>
			</tr>
			<tr>
				<th>주소<span> *</span></th>
				<td>
					<input type="text" name="addr" placeholder="주소를 입력하세요">
					<button>우편번호 찾기</button>
				</td>
			</tr>
			<tr>
				<th>이메일<span> *</span></th>
				<td>
					<input type="email" name="email" placeholder="이메일을 입력하세요">
				</td>
			</tr>
			<tr>
				<th>광고 수신동의</th>
				<td>
					<input type="radio" name="ad_agree">동의함
					<input type="radio" name="ad_agree">동의하지 않음
				</td>
			</tr>
			<tr>
				<th>사업자등록번호</th>
				<td>
					<input type="text" name="corNum" placeholder="사업자등록번호를 입력하세요">
					<button>인증하기</button>
				</td>
			</tr>
		</tbody>
		</table>
		<button value="submit">가입하기</button>
		<button value="reset">취소</button>
	</form>
</body>
</html>