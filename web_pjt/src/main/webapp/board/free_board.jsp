<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.List, member.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="board_css.css">

	<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("td:nth-child(4n+1)").css("text-align","left");
		});
	</script>
 
<title>자유 게시판 :: K-농부 커뮤니티</title>

<div class="container">
<%@ include file="header.jsp" %>
<header class="d-flex justify-content-center py-3">
	<ul class="nav nav-pills">
		<li class="nav-item"><a href="free_board.jsp" class="nav-link active" aria-current="page">자유게시판</a></li>
		<li class="nav-item"><a href="sell_board.jsp" class="nav-link">판매&홍보</a></li>
		<li class="nav-item"><a href="buy_board.jsp" class="nav-link">구매요청</a></li>
		<li class="nav-item"><a href="seller_board.jsp" class="nav-link">농부게시판</a></li>
		<li class="nav-item"><a href="notice.jsp" class="nav-link">공지사항</a></li>
	</ul>
</header>
     
<body>
<jsp:useBean id="dao" class="member.BoardDao" />
<%
	request.setCharacterEncoding("utf-8");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    
    int listSize = 10;//화면에 표시할 게시글 숫자
    int totalNum = dao.countHits();//DB에 저장된 총 게시글 숫자
    
    int currPageNum = Integer.parseInt(pageNum);//현재 페이지의 네비게이션 번호
	int startRow = (currPageNum - 1) * listSize + 1;//게시글 출력시 시작번호
    int endRow = currPageNum * listSize;//게시글 출력시 끝번호
    int number = 0;//화면에 표시할 글번호
    
    List<BoardDto> articleList = null;
    
    if (totalNum > 0) {
        articleList = dao.getPosts(startRow, listSize * currPageNum);
    }
    
    number = totalNum - (currPageNum - 1) * listSize;
%>
	<article>
		<h2>자유 게시판</h2>
		<form>
			<div id="search">
				<select id="searchsel">
					<option>전체</option>
					<option>작성자</option>
				</select>
				<input type="text" id="searchbar" placeholder="검색어 입력">
				<button type="submit" class="btn btn-outline-success btn-sm" id="searchbtn">검색</button>
			</div><br>
			<table class="table table-hover">
				<thead id="main_thead">
					<tr>
						<th scope="col" style="text-align:left;">내용</th>
						<th scope="col" width="100px">작성자</th>
						<th scope="col" width="70px">조회수</th>
						<th scope="col" width="120px">작성일</th>
					</tr>
				</thead>
				<tbody>
				
				<jsp:useBean id="dto" class="member.BoardDto"/>
<%

				if(articleList == null){
%>	
					<tr>
						<td colspan="4">게시판에 올린 글이 없습니다. 글을 올려 주세요.</td>
					</tr>

<%
				}else{
	
	
				for(int i=0; i<articleList.size(); i++){
				   dto = (BoardDto) articleList.get(i);
				   String boardDate = sdf.format(dto.getBoardDate());
%>
					<tr>
						<td><a href="view_content.jsp?boardIdx=<%=dto.getBoardIdx() %>"><%=dto.getBoardSbj() %></a></td>
						<td><%=dto.getBoardWriter() %></td>
						<td><%=dto.getBoardHits() %></td>
						<td><%=dto.getBoardDate() %></td>
					</tr>
<%
				}//for문의 닫힘 괄호
%>
				</tbody>
			</table>

<div id="paging" style="text-align:center;">
<%
	int navSize = 5;//화면에 표시할 페이지 네비게이션 숫자
	int startNum = (currPageNum/navSize)*navSize + 1;//페이지 네비게이션 시작 번호 
	int endNum = 5;//페이지 네비게이션 끝 번호
	int totalNavNum = ((totalNum % listSize) == 0)? (totalNum/listSize):(totalNum/listSize)+1;//총 네비게이션 번호
	
    if(totalNavNum < 6){//총 네비게이션 번호가 5이하인 경우
        for (int i = startNum; i <= totalNavNum; i++){
%>
        <a href="free_board.jsp?pageNum=<%=i%>"> <%=i%> </a>&nbsp;
<%
        }
    }else{//총 네비게이션 번호가 6 이상인 경우

    	if((startNum + navSize) <= totalNavNum){//네비게이션 시작번호와 네비게이션 표시 개수를 더한 값이 네비게이션 총 개수보다 작거나 같은 경우 
    		endNum = startNum + navSize-1;
    	}else{ endNum = totalNavNum; }	
    	
        if(startNum > navSize){
%>
        	<a href="free_board.jsp?pageNum=<%= (startNum-navSize) %>"> &lt;이전&nbsp;</a> 
<%   
        }
        
		for (int i = startNum; i <= endNum; i++){
%>        
           <a href="free_board.jsp?pageNum=<%= i %>"> <%= i %> </a>&nbsp;
<%
        }
        
        if(endNum < totalNavNum){
%>
            <a href="free_board.jsp?pageNum=<%= (endNum+1) %>"> 다음&gt; </a>
<% 
         }
    }
}//else문의 닫힘 괄호
%>
</div>

<%
		if(id != null){ %>
			<div id="write_div">
				<button type="button" id="write_btn" class="btn btn-success" onclick="location.href='write_content.jsp'">글쓰기</button>
			</div>
<% 		}%>
		
			
		</form>
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