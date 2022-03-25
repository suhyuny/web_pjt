<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.DBConnection, java.sql.*" %>

<style>
	#headerBody{
		max-width: 1000px;
		margin:auto;
		margin-top: 30px;
    	height: 140px;
	}
</style>
<div id="headerBody">
<%
	String id = null;
	String name = null;
	if(session.getAttribute("id") != null){ //로그인함
		id = (String)session.getAttribute("id"); 
		name = (String)session.getAttribute("name");
	}

	if(id != null){ %>
		<h3><a href='../member/mypage.jsp'>마이페이지</a>&nbsp;&nbsp;<a href='../member/logout_process.jsp'>로그아웃</a></h3>
		<h3 id="welcome"><%= name%>님 환영합니다.</h3> 
		<h1 id="header"><a href="../board/main.jsp"><img src="../image/logo.png"></a></h1>
<% 	}else if(id == null){ %>
		<h3 style="margin-bottom:30.4px;"><a href='../member/login.jsp'>로그인</a>&nbsp;&nbsp;<a href='../member/join.jsp'>회원가입</a></h3>
		<h1 id="header"><a href="../board/main.jsp"><img src="../image/logo.png"></a></h1>
<%	}%>
</div>