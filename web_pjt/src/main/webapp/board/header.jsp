<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.DBConnection, java.sql.*" %>


<%
	String id = null;
	String name = null;
	if(session.getAttribute("id") != null){ //로그인함
		id = (String)session.getAttribute("id"); 
		name = (String)session.getAttribute("name");
	}

	if(id != null){ %>
		<h3><a href='mypage.jsp'>마이페이지</a>&nbsp;&nbsp;<a href='logout_process.jsp'>로그아웃</a></h3>
		<h3><%= name%>님 환영합니다.</h3> 
		<h1><a href="main.jsp">K-농부 커뮤니티</a></h1>
<% 	}else if(id == null){ %>
		<h3><a href='login.jsp'>로그인</a>&nbsp;&nbsp;<a href='join.jsp'>회원가입</a></h3>
		<h1><a href="main.jsp">K-농부 커뮤니티</a></h1>
<%	}%>