<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.*" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.List" %>
<%@ page import ="member.ReplyDto"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/board_css.css">

	<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
	
		$(function(){
			
		});
		
		function regReply(){
				var replyWriter = $("#replyWriter").val();
				var replyContent = $("#replyContent").val();
				var replyId = $("replyId").val();
				var boardIdx = $("#boardIdx").val();
				
				
				$.ajax({
					type:"get",
					url:"../reply/regReply.jsp",
					data:$("form").serialize(),
					success:function(data){
						var dataJson = JSON.parse(data.trim());
						var replyWriter = dataJson[0].replyWriter;
						var replyContent = dataJson[0].replyContent;
						var replyDate = dataJson[0].replyDate;
						
						if(replyContent != null && replyContent != undefined){
							var reply = "<tr><td class='rw'>"+replyWriter+"</td><td class='rb'>";
							reply += "<button type='button' class='btn btn-sm btn-outline-secondary sbt' onclick='modifyBtn(this)'>수정</button> ";
							reply += "<button type='button' class='btn btn-sm btn-outline-secondary sbt' onclick='deleteFn(this)'>삭제</button>";
							reply += "</td><td class='rd'>"+replyDate+"</td></tr><tr><td colspan='3' class='rc'><pre>"+replyContent+"</pre></td></tr>";
							$("#replyTb").append(reply);
							
						}
						$("#replyContent").val("");
					}
				});//ajax
			}
			
			function modifyBtn(obj){
				var modifyVal = $(obj).parent().parent().next().text().trim(); //수정할 댓글내용
				var modify = "<td colspan='3'><div class='input-group mb-3'>";
				modify += "<textarea class='form-control' maxlength='500'>"+modifyVal+"</textarea>";
				modify += "<button class='btn btn-outline-secondary' type='button' onclick='modifyFn(this)'>댓글 수정</button></div></td>";
				
				$(obj).parent().parent().next().html(modify);
			}
			
			function modifyFn(obj){
				var modifyVal = $(obj).prev().val();
				var replyIdx = $(obj).parent().parent().parent().prev().children().next().children().last().val();
				$.ajax({
					type:"post",
					url:"../reply/modifyReply.jsp",
					data:"modifyVal="+modifyVal+"&replyIdx="+replyIdx,
					success:function(data){
						var newVal = "<td colspan='3' class='rc'><pre>"+data+"</pre></td>";
						$(obj).parent().parent().parent().html(newVal);
					}
				});
			}
			
			function deleteFn(obj){
				var replyIdx = $(obj).next().val();
				if (confirm("정말 삭제하시겠습니까?") == true){    //확인

				    $.ajax({
					type:"post",
					url:"../reply/deleteReply.jsp",
					data:"replyIdx="+replyIdx,
					success:function(){
						$(obj).parent().parent().next().remove();
						$(obj).parent().parent().remove();
						}
					});

				}else{   //취소
				    return;
				}
			}
		
	</script>
	<style>
		textarea{
			resize:none;
		}
		#replyTb{
			text-align:left;
			font-size:15px;
		}
		.sbt{
			height: 25px;
    		font-size: 10px!important;
		}
		.rb{ /*댓글버튼*/
			text-align:right;
			width:160px;
		}
		.rw{ /*댓글작성자*/
			font-size: 14px;
    		font-weight: bold;
		}
		.rd{ /*댓글작성일자*/
			font-size:12px;
			text-align:right;
			width:130px;
		}
		.rc, pre{ /*댓글내용*/
			font-size:10pt;
			font-family:malgun Gothic;
		}
	</style>
 
<title>자유 게시판 :: K-농부 커뮤니티</title>

<%@ include file="header.jsp" %>
<div class="container">

<header class="d-flex justify-content-center py-3">
	<ul class="nav nav-pills">
		<li class="nav-item"><a href="freeBoard.jsp" class="nav-link active" aria-current="page">자유게시판</a></li>
		<li class="nav-item"><a href="#" class="nav-link">판매&홍보</a></li>
		<li class="nav-item"><a href="#" class="nav-link">구매요청</a></li>
		<li class="nav-item"><a href="#" class="nav-link">농부게시판</a></li>
		<li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
	</ul>
</header>
<body>

<jsp:useBean id = "dao" class="member.BoardDao"/>
<jsp:useBean id = "dto" class="member.BoardDto"/>

<jsp:useBean id = "replyDao" class="member.ReplyDao"/>
<jsp:useBean id = "replyDto" class="member.ReplyDto"/>

<%
	request.setCharacterEncoding("UTF-8");

	String pageNum = request.getParameter("pageNum");
	int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
	dao.updateHits(boardIdx);
	dto = dao.getPost(boardIdx);
	
	int replyNum = 0;
	replyNum = dao.replyNum(boardIdx);
	dto.setBoardReply(replyNum);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String boardDate = sdf.format(dto.getBoardDate());
%>
	<article>
		<h2>자유 게시판</h2><br>
			
			<div class="col-sm">
				<input type="text" class="form-control" id="subject" value="<%=dto.getBoardSbj() %>" readonly>
			</div>
			<table class="table table-borderless" style="font-size: 10pt;">
				<tr>
					<td style="text-align: left;">작성자 : <%=dto.getBoardWriter() %></td>
					<td width="85px">조회수 <%=dto.getBoardHits() %></td>
					<td width="85px">댓글수 <%=dto.getBoardReply() %></td>
					<td style="text-align: right;" width="180px">작성일 : <%=boardDate %></td>
				</tr>
			</table>
			<div class="mb-3">
				<textarea class="form-control" id="content" rows="15" maxlength="1000" readonly><%=dto.getBoardContent() %></textarea>
				
<%				if(dto.getBoardFilename() != null){ %>
						<div><img src="<%=request.getContextPath()+"/image/"+dto.getBoardFilename() %>" width="300px">
				<% }
				else {%><div><%} %>
				</div>
			</div>
		<div class="container">
<%
		if(id == null){
			
		}else if(id.equals(dto.getBoardId())){
%>			<div class="d-grid gap-2 d-md-block" id="write_div">
				<button type="button" id="modify_btn" class="btn btn-success" onclick="window.location='modifyBoard.jsp?boardIdx=<%=boardIdx %>'">수정하기</button>
				<button type="button" id="delete_btn" class="btn btn-success" onclick="window.location='deleteBoard.jsp?boardIdx=<%=boardIdx %>'">삭제하기</button>
			</div>
<%		}
%>
			
		<form>
		<p id="reply">댓글</p>
			<table class="table">
				<tbody id="replyTb">
<%
				List<ReplyDto> replyList = null;
			
				replyList = replyDao.getReply(boardIdx);
				for(int i=0; i<replyList.size(); i++){
				   replyDto = (ReplyDto) replyList.get(i);
				   String replyDate = sdf.format(replyDto.getReplyDate());
%>					
					<tr>
						<td class='rw'><%= replyDto.getReplyWriter()%></td>
						
<%				if(id == null || !id.equals(replyDto.getReplyId())){
%>						<td></td>
<% 				}else if(id.equals(replyDto.getReplyId())){
%>						<td class='rb'>
							<button type="button" class="btn btn-sm btn-outline-secondary sbt" onclick='modifyBtn(this)'>수정</button>
							<button type="button" class="btn btn-sm btn-outline-secondary sbt" onclick='deleteFn(this)'>삭제</button>
							<input type="hidden" id="replyIdx" name="replyIdx" value="<%= replyDto.getReplyIdx()%>">
						</td>
<%				}
%>						<td class='rd'><%= replyDate%></td>
					</tr>
					<tr>
						<td colspan="3" class='rc'><pre><%= replyDto.getReplyContent()%></pre></td>
					</tr>
					
<%				}//for문의 닫힘 괄호	
%>
				</tbody>
			</table>
<%		if(id != null || id == "undefined"){
%>			<div class="input-group mb-3">
				<input type="hidden" id="replyWriter" name="replyWriter" value="<%= name%>">
				<input type="hidden" id="replyId" name="replyId" value="<%= id%>">
				<textarea class="form-control" id="replyContent" placeholder="댓글을 입력해주세요." name="replyContent" maxlength="500"></textarea>
				<input type="hidden" id="boardIdx" name="boardIdx" value="<%=dto.getBoardIdx()%>">
				<button class="btn btn-outline-secondary" type="button" onclick="regReply()">댓글 등록하기</button>
			</div>
			</form>
<%		}else{
%>		<div class="input-group mb-3">
				<textarea class="form-control" id="replyContent" style="resize:none;" name="replyContent" readonly>댓글을 작성하시려면 로그인해주세요.</textarea>
			</div>
<%		}
%>
	</article>
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