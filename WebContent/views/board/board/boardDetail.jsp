<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="board.model.vo.*, java.util.*, java.text.SimpleDateFormat, java.util.Date"%>
    <%
    	Board b = (Board)request.getAttribute("board");
    
    Date today = new Date();
    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
    String tday = format1.format(today);
    
    ArrayList<Comment> clist = (ArrayList<Comment>)request.getAttribute("clist");
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/mypage/report/mpReportDetail.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/market/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/market/css/agency.min.css" rel="stylesheet">
<style>

body{
width:60%;
}
#tableWrapper{
	padding-top:5%;
	width:60%;
	height:60%;
	margin:auto;
	   margin-bottom:15px;
}

#detail{
height:300px;

}

#writer{
width:90px;
}

#btnWrapper{
position:relative;
	left:70%;
	margin-bottom:15px;
	margin-top:15px;
}

.avatar {
   display: block;
   height: 100%;
   width: 20%;
   float: left;
   text-align: center;
}

#note-text-524235 {
   display: block;
   height: 100%;
   width: 80%;
   float: left;
   font-size: 14px;
}

.review {
   border-radius: 50%;
   width: 100px;
   height: 100px;

}








/* ====================댓글달기=============== */

#replyContent{
width:80%;
}
.avatar {
	display: block;
	height: 100%;
	width: 20%;
	float: left;
	text-align: center;
}

#note-text-524235 {
	display: block;
	height: 100%;
	width: 80%;
	float: left;
	font-size: 14px;
}

.review {
	border-radius: 50%;
	width: 100px;
	height: 100px;
	
}
.accordionMenu #aco {
	padding: 0 10px;
	margin: 0;
	height: 0;
	overflow: hidden;
	transition: height 0.5s ease-in;
}

.accordionMenu :target #aco {
	overflow: auto;
	height: 80px;
}
#CommentInsertBtn{
margin-top:25px;
margin-left:20px;
}



.deleteCommentBtn{
position:relative;
float:right;
width:90px;
height:38px;
display : inline-block;
}

/*댓글부분*/
</style>



</head>

	<%@ include file="../../common/menubar.jsp"%>
	
	<div id="tableWrapper">
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                        <div class="title">
                            <h2>
                                <font color="#000000"><%=b.getTitle() %></font>
                            </h2>
                        </div>
                    </div>
                    
	<form id="BoardDelForm" name="" action="" method="post" target="_self"  enctype="multipart/form-data">
                        <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002 ">
                            <div class="boardView">
                                <table border="1" summary="">
                                    <caption></caption>
                                    <tbody>
                                        
                                        <tr>
                                            <th id="writer">작성자 </th>
                                            <td><span><%=b.getUserName() %></span> </td>
                                        </tr>
                                         <tr>
                                            <th>작성일</th>
                                            <td><span><%=b.getEnrollDate() %></span> </td>
                                        </tr>
                                        
                                        <tr class="view">
                                            <td colspan="2">
                                                <div class="detail" id="detail">
                                                   <p id="centent"><%=(b.getContent()).replace("\r\n","<br>") %></p>
                                                    
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </form>
              
              <div id="btnWrapper">
              <button id="listBtn" onclick="location.href='<%=request.getContextPath() %>/list.bo'" class="btn btn-outline-success">목록으로</button>
              <!--  로그인 시 나타는 버튼 -->
              <%if (b.getUserName().equals(loginUser.getUserName())){ %>
                <button id="updateBtn" type="button" onclick="updateBoard()" class="btn btn-outline-success">수정하기</button>
                <button id="deleteBtn" type="button" onclick="deleteBoard()" class="btn btn-outline-danger">삭제하기</button>
                 <%} %>
         	 </div>
              <hr>
              

          <!-- 댓글 작성폼 -->
			<div class="ddd">
				<ul class="list">
				<li class="list-group-item note-item clearfix" id="note-524235">
						<div class="content-body panel-body pull-left">
							<div class='avatar avatar-medium clearfix'>
							<!-- 로그인 유저에서 프로필 사진 받아와서 작성폼에 첨부 -->
								<img src="<%= request.getContextPath() %>/resources/userimg/<%=loginUser.getChangeName() %>" class="review userIMG" alt="">
							</div>
							<!-- 로그인 유저에서 유저 이름 받아와서 작성폼에 첨부 -->
							<span class="nickname"><strong><%=loginUser.getUserName() %></strong></span>
							<div id="note-text-524235">
								<textarea rows="3"  id="replyContent" name="commentContent" style="resize:none"></textarea>
								<button id="CommentInsertBtn" class="btn btn-outline-success">댓글작성</button>
								
									<div class="date-created">
									<!-- 상단 스크립트릿에서 simpleDateFormat을 통해 현재 날짜를 받아와 리뷰 작성폼에 첨부 -->
										<span class="timeago"><%= tday %></span>
									</div>
							
							</div>
						</div>
					</li>
				
				</ul>
				<ul class="list" id="commentul">				
					
					<!--  댓글목록 불러오기 -->
					<%if(clist != null){ %>
						<% for(Comment c : clist){ %>
					
					<li class="list-group-item note-item clearfix" id="note-524236">
						<div class="content-body panel-body pull-left">
							<div class='avatar avatar-medium clearfix'>
							<!-- Comment c 에 저장되어있는 유저의 프로필 사진을 받아오기 -->
								<img src='<%=request.getContextPath()%>/resources/userimg/<%=c.getChangeName() %>' class="review">
							</div>
							<!-- Comment c 에 저장되어있는 유저의 이름을 받아오기 -->
							<span class="nickname"><strong><%=c.getUserName() %></strong></span>
							
							
							<%--댓글 삭제를 위한 보이지 않는 form, commentNo와 BoardNo를 가지고 있으며 버튼을 통해 CommentDeleteServlet으로 이동한다. --%>
							
							<form action="<%=request.getContextPath()%>/DeleteCommentServlet"  method="post" class="commentForm">	
							<input type="hidden" value="<%=c.getCommentNo()%>" class="commentNo"name="commentNo">
								<input type="hidden" value="<%=c.getBoardNo()%>" class="cBoardNo"name="cBoardNo">
										
							<div id="note-text-524235">
							<!--  Comment c에 있는 댓글 내용을 불러오기 -->							
								<p id="commentP"><%=c.getContent() %>  </p> 
								
							<!--  현재 로그인 유저와 댓글을 작성한 유저가 같은 사람이면 삭제하기 버튼 보이기 -->
								  <%if (c.getUserName().equals(loginUser.getUserName())){ %>
								<button class="btn btn-outline-danger deleteCommentBtn">삭제하기</button>
								<%} %>
								</form>
									<div class="date-created">
									<!--  Comment c 에 있는 댓글 작성일 불러오기 -->
										<span class="timeago"><%=c.getEnrollDate() %></span>
									</div>
								
							</div>
						
						</div>
					</li>
					
					<%} %>
				<%} %>
					
				</ul>
			</div>
		
		</div>
          <%--댓글폼 끝 --%>
         
           	<form action="" id="detailForm" method="post">
		<input type="hidden" name="boardNo" value="<%=b.getBoardNo() %>">
	</form>
           
           <script>
           	function deleteBoard(){
           		if(confirm("해당 게시글을 삭제하시겠습니까?")){
           			$("#detailForm").attr("action","<%=request.getContextPath()%>/BoardDeleteServlet");
           			$("#detailForm").submit();
           		}
           	}
           	
           	function updateBoard(){
           		$("#detailForm").attr("action","<%=request.getContextPath()%>/BoardUpdateFormServlet");
           		$("#detailForm").submit();
           	}
           	
         
           	/*댓글 작성 버튼 클릭시 실행되는 부분*/
           	$("#CommentInsertBtn").click(function(){
           		var writer= <%=loginUser.getUserNo() %>;
           		var boardNo =<%=b.getBoardNo()  %>;
           		var content =$("#replyContent").val();
           	/* 필요한 정보들을 페이지에서 받아와 변수로 저장*/	
           		
           	/* ajax를 통해 비동기식 댓글 추가*/
           		$.ajax({
           			url :"InsertCommentServlet",
           			type:"post",
           			dataType:"json",
           			data:{
           				writer:writer,
           				content:content,
           				boardNo:boardNo},
           				success:function(data){
           					/* 동작 성공시 기존에 있던 댓글폼과 동일한 형태의 댓글 폼에 새로 작성한 댓글을 추가해 페이지에 추가*/
           				var $ul =$("#commentul")
           				 var $liStart = $("#note-524236");
           				 
           				 $ul.html("");
           				 
           				 $.each(data,function(index,value){
           					 var $li =$('<li class="list-group-item note-item clearfix" id="note-524236">');
           					 var $div1 =$('<div class="content-body panel-body pull-left">');
           					 var $div2 =$("<div class='avatar avatar-medium clearfix'>");
           					 /* 사진을 받아서 입력*/
           					 var $img1 = $("<img class='review'>").attr("src",'<%=request.getContextPath()%>/resources/userimg/'+ value.changeName);
           					 var $userName=$("<span class='nickname'>").text(value.userName);
           					 var $div3 =$("<div id='note-text-524235'>");
           					 var $content =$("<p>").text(value.content);
           					 /* 기존 댓글목록에 있는 삭제를 위한 숨겨져있는 폼 역시 추가해준다.*/
           					 var $form = $("<form action='<%=request.getContextPath()%>/DeleteCommentServlet' method='post' class='commentForm'>");
           					 var $commentNo=$("<input type='hidden' class='commentNo' name='commentNo'>").attr("value",value.commentNo);
           					 var $boardNo=$('<input type="hidden" class="cBoardNo"name="cBoardNo">').attr("value",value.boardNo);
           					 
           					 var $button =$("<button class='btn btn-outline-danger deleteCommentBtn'>").text("삭제하기");
           					 var $div4 =$("<div class='date-created'>");
           					 var $enrollDate =$("<span class='timeago'>").text(value.enrollDate);
           					 
           					 /*기존 폼과 동일한 형태로 append를 통해 댓글목록폼 작성*/
           					 $div1.append($div2);
           					 $div2.append($img1);
           					 
           					 $div1.append($userName);
           					 
           					 $div1.append($div3);
           					 $div1.append($form);
           					 $form.append($boardNo);
           					 $form.append($commentNo);
           					 /*로그인 유저가 댓글을 작성한 유저라면 삭제하기 버튼도 보이게 추가*/
           					 if(value.userName=='<%=loginUser.getUserName()%>'){
           						 $form.append($button);
           					 }
           					 $div3.append($content);
           					
           					 $div3.append($div4);
           					 $div4.append($enrollDate);
           					 
           					 $li.append($div1);
           					 $ul.append($li);     					 
           					            					 
           				 });
           				},
           				error:function(){
           					console.log('ajax 통신 실패');
           				}
           			});	
           		});
           	
           	
           	/*댓글 삭제 기능*/
        	
           		
           	
           </script>
                          
	
	
	
	
	
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>