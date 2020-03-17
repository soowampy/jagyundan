<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.*"%>
    
    <%

    ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    
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
<img src="<%= request.getContextPath() %>/resources/board/image/noticeThum.png" width="100%" height="270px">

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
 	<h3>공지사항</h3>
    <br><br>

 
    <table class="table table-hover" >
    <thead>
        <tr>
            <th>글번호</th>
            <th>글제목</th>
       
            <th>작성일</th>
        </tr>
       </thead>
       <%if(list.isEmpty()){ %>
       <tr>
       	<td colspan="5">공지사항이 없습니다.</td>
       </tr>
       <%}else{ %>
       <%for(Notice n : list){ %>
            <tr>
          <input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>">
            <td> <%=n.getNoticeNo() %></td>
            <td><%=n.getTitle() %></td>
           
            <td><%=n.getEnrollDate() %></td>
        </tr>
        <%} %>
       <%} %>
       
   
    </table>
    </div>
  
  <!--  검색창  -->
  	<div class="searchArea" align="center">
		<form action="<%= request.getContextPath() %>/NoticeSearchServlet" method="get" onsubmit="return checkSearchCondition();">
			<div class="input-group mb-3">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" class="form-control" aria-describedby="button-addon2" name="search">
 
  			
 			 <div class="input-group-append">
    		<button class="btn btn-outline-success" id="searchBtn">검색하기</button>
  		</div> <%if(loginUser!=null && (loginUser.getUserId()).equals("adminjagyun")){ %>
  <button id="insertBtn" onclick="location.href='<%=request.getContextPath()%>/views/board/notice/noticeInsertForm.jsp'" class="btn btn-outline-success">작성하기</button>
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
			
		</div>
  
  
  <script>
	// 게시판 상세보기 기능 구현
	$(function(){
		$("#formwrap td").mouseenter(function(){
			$(this).parent().css({"cursor":"pointer"})	
		}).click(function(){
			var noticeNo=$(this).parent().children("input").val();
			<% if(loginUser != null){%>
		
			location.href="<%= request.getContextPath() %>/NoticeDetailServlet?noticeNo="+noticeNo;
		<%}else{%>
			alert('로그인 해야만 상세보기가 가능합니다!');
		<%}%>
		
		

		
		});
	});
	</script>
  

	
		



 		<%@ include file="../../common/footer.jsp" %>

</body>
</html>