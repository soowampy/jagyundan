<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
    
    <%
	 ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	
	 int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
	
	
	String searchCondition = (String)request.getAttribute("searchCondition");
  	String search = (String)request.getAttribute("search");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>자견단</title>
<style>
body{
width:100%;
}
	#test1{

	height:400px;
	}
 	#formwrap {
            border:1px solid lightgray;
            border-radius:10px;
            width:60%;
            margin:auto;
         
            margin-bottom:50px;
            padding:3%;
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
	
	#menu{
	padding-top: 10px;
	width:60%;
	height:80%;
	position:absolute;
	left:32%;
	right:32%;	
	text-align:center;
	
	
	
	
	
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


	
</style>
</head>
<body>
<header>
 	<%@ include file="../../common/menubar.jsp" %>
<img src="<%= request.getContextPath() %>/resources/board/image/mainBoardThum.png" width="100%" height="270px">
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

 	<div id="formwrap">

    <br>

 
    <table class="table table-hover" >
  
    <thead>
   
        <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일자</th>
        </tr>
        
    
       </thead>
  
     <% if(list.isEmpty()) { %>
        <tr>
          <td colspan="5">조회된 리스트가 없습니다</td>
        </tr>
       <%} else{ %>
       	<% for(Board b : list){ %> 
   	<tr>
   		<input type="hidden" value="<%=b.getBoardNo() %>">
   		<td><%=b.getBoardNo() %></td>
   		<td><%=b.getTitle() %></td>
   		<td><%=b.getUserName() %></td>
   		<td><%=b.getBoardCount() %></td>
   		<td><%=b.getEnrollDate() %></td>
   	</tr>
   	 <%} %>
   	<%} %>
   	   		
    </table>
    </div>
     

		<div class="pagingArea" align="center">
			<!--  맨 처음으로(<<) -->
			<button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=1'">&lt;&lt;</button>
			
			<!--  이전 페이지로(<) -->
			<%if (currentPage == 1){ %>
				<button class="btn btn-outline-success" disabled>&lt;</button>
			<% }else{%>
				<button class="btn btn-outline-success" onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=currentPage -1 %>'">&lt;</button>
			<%} %>
			
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage;p<=endPage;p++){ %>
				<%if(p==currentPage){ %>
						<button class="btn btn-outline-success" disabled><%=p %></button>
					<%}else{ %>
						<button class="btn btn-outline-success" onclick ="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=p %>'"><%=p %></button>
					<%} %>
			<%} %>
			
			<!--  다음 페이지로(>) -->
			<%if (currentPage == maxPage){ %>
				<button class="btn btn-outline-success" disabled>&gt;</button>
			<% }else{%>
				<button class="btn btn-outline-success" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%=currentPage +1 %>'">&gt;</button>
			<%} %>
			
			<!-- 맨 끝으로(>>) -->
			<button class="btn btn-outline-success" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%=maxPage%>'">&gt;&gt;</button>
		</div> 
		<br>
  
  
  
  <!--  검색창  -->
  	<div class="searchArea" align="center">
	<form action="<%= request.getContextPath() %>/BoardSearchServlet" method="get" onsubmit="return checkSearchCondition();">		
			<div class="input-group mb-3">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
  				<input type="search" name="search" class="form-control" aria-describedby="button-addon2">
 			 <div class="input-group-append">
    		<button class="btn btn-outline-success" id="searchBtn" name="search">검색하기</button>
  </div>
   <%--작성하기 버튼 --%>
   <% if(loginUser != null){%>
  <button id="insertBtn" onclick="location.href='<%=request.getContextPath()%>/views/board/board/boardInsertForm.jsp'" class="btn btn-outline-success">작성하기</button>
	<%} %>
  </div>
  
  </form>
  
    	<script>
					function checkSearchCondition(){
						if($("#searchCondition option:selected").val()=='----'){
							return false;
						}
						return true;
					}
				</script>
  
  
  
  
  
  
 
			
		</div>
  

	
		<script>
	// 게시판 상세보기 기능 구현
	$(function(){
		$("#formwrap td").mouseenter(function(){
			$(this).parent().css({"cursor":"pointer"})	
		}).click(function(){
			var boardNo=$(this).parent().children("input").val();
			<% if(loginUser != null){%>
		
			location.href="<%= request.getContextPath() %>/boardDetailServlet?boardNo="+boardNo;
		<%}else{%>
			alert('로그인 해야만 상세보기가 가능합니다!');
		<%}%>
		
		

		
		});
	});
	</script>



 		<%@ include file="../../common/footer.jsp" %>

</body>
</html>