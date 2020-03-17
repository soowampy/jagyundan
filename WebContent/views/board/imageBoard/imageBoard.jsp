<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*, common.model.vo.*"%>
    
    <%
    ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist");
    
    
    /*썸네일*/
	ArrayList<IMG> flist = (ArrayList<IMG>)request.getAttribute("flist");
	
    PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	
	 int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>자견단</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	header{
	height:270px;
	
	
	}
	

	#menu{
	
		width:60%;
	height:80%;
	position:absolute;
	left:32%;
	right:32%;	
	text-align:center;
padding-top: 10px;
	
	
	
	
	}
	#in-nav{
		
	background:white;
	height:50px;
	
}

.innav-image{
margin:auto;
}
	
	
#navi li{

    display: inline;
}


#navi li a{
    float: left;
    font : bold 14px 굴림;
    line-height: 40px;
    color : black;
    text-decoration: none;
    margin : 0;
    padding : 0 30px;

}


   .searchArea {
		width:650px;
		margin:auto;
		margin-bottom: 50px;
		
	}
	
	#searchBtn{
	border-radius: 4px;
	margin-right:5px;
	}

#submitBtn{
position:relative;
	left:90%;
	margin-bottom:15px;
}

#titleP{
text-align:center;
}

.thumb-list:hover{
opacity:0.8;
cursor:pointer;
}

#insertBtnArea{
width:75%;
height:30px;
margin:5px;
}
#insertBtn{
position:relative;
margin:5px;
float:right;
}

	
</style>

<link	href="<%= request.getContextPath() %>/resources/market/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">
<link	href="<%= request.getContextPath() %>/resources/market/vendor/bootstrap/css/bootstrap.css"	rel="stylesheet">
<link	href="<%= request.getContextPath() %>/resources/js/jquery.slim.min.js">


</head>
<body>
 

 <%@ include file="../../common/menubar.jsp" %>
<header>
<img src="<%= request.getContextPath() %>/resources/board/image/imgBoard(img).png" width="100%" height="270px">
<!-- 이미지 위에 포토샾으로 자유게시판 - 사진게시판 - 펫시터게시판(리뷰) 등등 추가 -->



</header>
<nav id="in-nav">
<div id="menu">
            <ul id="navi">
                       <li><a href="<%=request.getContextPath()%>/NoticeListServlet"><img src="<%= request.getContextPath() %>/resources/board/image/notice.png" onmouseover="this.src='<%= request.getContextPath() %>/resources/board/image/notice(a).png'" onmouseout="this.src='<%= request.getContextPath() %>/resources/board/image/notice.png'" width="140" height="50" class="innav-image"></a></li>
                    <li><a href="<%=request.getContextPath()%>/list.bo"><img src="<%= request.getContextPath() %>/resources/board/image/board.png" onmouseover="this.src='<%= request.getContextPath() %>/resources/board/image/board(a).png'" onmouseout="this.src='<%= request.getContextPath() %>/resources/board/image/board.png'" width="140" height="50" class="innav-image"></a></li>
                      <li><a href="<%= request.getContextPath() %>/IMGListServlet"><img src="<%= request.getContextPath() %>/resources/board/image/imgBoard2.png" onmouseover="this.src='<%= request.getContextPath() %>/resources/board/image/imgBoard(a)2.png'" onmouseout="this.src='<%= request.getContextPath() %>/resources/board/image/imgBoard2.png'" width="140" height="50" class="innav-image"></a></li>
                </ul>
     </div>

</nav>
<hr>
<!-- Page Content -->

	<div class="container">
			<div class="row">
			<%for(Board b : blist){ %>

    <div class="col-lg-4 col-sm-6 mb-4">
      <div class="card h-100 thumb-list">
      <input type="hidden" value="<%=b.getBoardNo() %>">
       <%-- 이미지 받아와서 여기 출력(insert이후에 시행 요망) --%>
       <%for(IMG image : flist){ %>
       	<%if((b.getBoardNo() == image.getBoardNo()) && (image.getFileLevel()==0)){%>    	
        <img class="card-img-top" src="<%= request.getContextPath() %>/resources/board/image/<%=image.getChangeName() %>" width="538" height="307" alt="">
      
        <%} %>
          
       <%} %>
        <div class="card-body">
          <h4 class="card-title" id="titleP"> <%= b.getTitle()%> </h4>
        
        </div>
      </div>
    </div>
 <%} %>
    </div>
  </div>
    	<div class="pagingArea" align="center">
			<!--  맨 처음으로(<<) -->
			<button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath() %>/IMGListServlet?currentPage=1'">&lt;&lt;</button>
			
			<!--  이전 페이지로(<) -->
			<%if (currentPage == 1){ %>
				<button class="btn btn-outline-success" disabled>&lt;</button>
			<% }else{%>
				<button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath() %>/IMGListServlet?currentPage=<%=currentPage -1 %>'">&lt;</button>
			<%} %>
			
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage;p<=endPage;p++){ %>
				<%if(p==currentPage){ %>
						<button class="btn btn-outline-success" disabled><%=p %></button>
					<%}else{ %>
					
						<button class="btn btn-outline-success" onclick ="location.href='<%=request.getContextPath() %>/IMGListServlet?currentPage=<%=p %>'"><%=p %></button>
					<%} %>
			<%} %>
			
			<!--  다음 페이지로(>) -->
			<%if (currentPage == maxPage){ %>
				<button class="btn btn-outline-success" disabled>&gt;</button>
			<% }else{%>
				<button class="btn btn-outline-success" onclick="location.href='<%= request.getContextPath() %>/IMGListServlet?currentPage=<%=currentPage +1 %>'">&gt;</button>
			<%} %>
			
			<!-- 맨 끝으로(>>) -->
			<button class="btn btn-outline-success" onclick="location.href='<%= request.getContextPath() %>/IMGListServlet?currentPage=<%=maxPage%>'">&gt;&gt;</button>
			  
		</div> 
		
		<div id="insertBtnArea">
			  <% if(loginUser != null){%>
  <button id="insertBtn" onclick="location.href='<%=request.getContextPath()%>/views/board/imageBoard/imageInsertForm.jsp'" class="btn btn-outline-success">작성하기</button>
	<%} %>
	</div>
		<br>
	
		
		
			
	<script>
		// 상세 보기
		$(function(){
			$(".thumb-list").click(function(){
				var boardNo = $(this).children().eq(0).val();
				<% if(loginUser != null){%>
				location.href="<%= request.getContextPath() %>/IMGDetailServlet?boardNo="+boardNo;
				<%}else{%>
				alert('로그인 해야만 상세보기가 가능합니다!');
			<%}%>
			});
			
		});
		
		function checkSearchCondition(){
			if($("#searchCondition option:selected").val()=='----'){
				return false;
			}
			return true;
		}
	
	</script>
		
  

  <!-- /.row -->

   

</div>
<!-- /.container -->






</div>
</div>
</div>
</div>
</div>

<%@ include file="../../common/footer.jsp" %>
</body>
</html>