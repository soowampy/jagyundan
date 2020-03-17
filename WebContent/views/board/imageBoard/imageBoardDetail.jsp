<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="board.model.vo.*,common.model.vo.*, java.util.*, java.text.SimpleDateFormat, java.util.Date"%>
   <% 
   Board b = (Board)request.getAttribute("board");
    
    Date today = new Date();
    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
    String tday = format1.format(today);
    
    ArrayList<Comment> clist = (ArrayList<Comment>)request.getAttribute("clist");
    ArrayList<IMG> flist=(ArrayList<IMG>)request.getAttribute("flist");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/mypage/report/mpReportDetail.css" />

<%--SWIPER --%>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%-- --%>
<style>
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

#imgArea{
	text-align:center;
}

#textArea{
	text-align:center;
}


#updateCommentBtn{
position:relative;
right:-65%;
width:60px;
height:35px;
}

#deleteCommentBtn{
position:relative;
right:-65%;
width:60px;
height:35px;
}

#updateBtnArea{
position:relative;
right:70%;
}
/*------------------------------*/
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

/*swiepr*/
.swiper-container {
	width: 100%;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
}

.swiper-slide {
	background-size: cover;
	background-position: center;
}

.gallery-top {
	height: 80%;
	width: 100%;
}

.gallery-thumbs {
	height: 20%;
	box-sizing: border-box;
	padding: 10px 0;
}

.gallery-thumbs .swiper-slide {
	width:25%;
	height: 100%;
	opacity: 0.4;
}


.gallery-thumbs .swiper-slide-thumb-active {
	opacity: 1;
}

#swiperArea {
	margin: auto;
	width: 800px;
	height: 600px;
}
</style>



</head>

<body>
	<%@ include file="../../common/menubar.jsp"%>
	
	<div id="tableWrapper">
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                        <div class="title">
                            <h2>
                                <font color="#000000"><%=b.getTitle() %></font>
                            </h2>
                        </div>
                    </div>
                    
	<form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post" target="_self"  enctype="multipart/form-data">
                        <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002 ">
                            <div class="boardView">
                                <table border="1" summary="">
                                    <caption>*글 제목*</caption>
                                    <tbody>
                                        
                                        <tr>
                                            <th id="writer">작성</th>
                                            <td><%=b.getUserName() %> </td>
                                        </tr>
                                         <tr>
                                            <th>작성일</th>
                                            <td><%=tday %> </td>
                                        </tr>
                                        
                                        
                                        <tr class="view">
                                    <%--swiper 넣을자리 --%>

								</div>


								<td colspan="2">
									<div id="swiperArea">
										<div class="swiper-container gallery-top">
											<div class="swiper-wrapper">
												<%
													for (int i = 0; i < flist.size(); i++) {
												%>

												<div class="swiper-slide">
													<img
														src="<%=request.getContextPath()%>/resources/board/image/<%=flist.get(i).getChangeName()%>"
														width="100%" height="100%">
												</div>

												<%
													}
												%>
											</div>
											<!-- Add Arrows -->

											<div class="swiper-button-next swiper-button-white"></div>
											<div class="swiper-button-prev swiper-button-white"></div>
										</div>
										<div class="swiper-container gallery-thumbs">
											<div class="swiper-wrapper">
												<%
													for (int i = 0; i < flist.size(); i++) {
												%>

												<div class="swiper-slide">
													<img
														src="<%=request.getContextPath()%>/resources/board/image/<%=flist.get(i).getChangeName()%>"
														width="100%" height="100%">
												</div>

												<%
													}
												%>
											</div>
										</div>
									</div>




									<div id="textArea">
										<br>
										<p>
											<%=(b.getContent()).replace("\r\n", "<br>")%></p>
									</div>
								</td>

							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
              
              	<div id="btnWrapper">
			<!--  로그인 시 나타는 버튼 -->
			<button id="listBtn" type="button" onclick='location.href="<%=request.getContextPath() %>/IMGListServlet"' class="btn btn-outline-success">목록으로</button>
			  <%if (b.getUserName().equals(loginUser.getUserName())){ %>
                <button id="updateBtn" type="button" onclick="updateBoard()" class="btn btn-outline-success">수정하기</button>
                <button id="deleteBtn" type="button" onclick="deleteBoard()" class="btn btn-outline-danger">삭제하기</button>
                 <%} %>
			
		</div>
         	 <hr>
         	      <!-- 리뷰 작성폼 -->
			<div class="ddd">
				<!-- List group -->
				<ul class="list">
				<li class="list-group-item note-item clearfix" id="note-524235">
						<div class="content-body panel-body pull-left">
							<div class='avatar avatar-medium clearfix'>
								<!-- member에서 이미지받아오면 여기서 쓰기 -->
								<img src="<%= request.getContextPath() %>/resources/userimg/<%=loginUser.getChangeName() %>" class="review userIMG" alt="">
							</div>
							<span class="nickname"><strong><%=loginUser.getUserName() %></strong></span>
							<div id="note-text-524235">
								<textarea rows="3"  id="replyContent" name="commentContent" style="resize:none"></textarea>
								<button id="CommentInsertBtn" class="btn btn-outline-success">댓글작성</button>
								
									<div class="date-created">
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

								<img src='<%=request.getContextPath()%>/resources/userimg/<%=c.getChangeName() %>' class="review">
							</div>
							<span class="nickname"><strong><%=c.getUserName() %></strong></span>
							
							
							<%--댓글 삭제를 위한 보이지 않는 form --%>
							
							<form action="<%=request.getContextPath()%>/DeleteIMGCommentServlet"  method="post" class="commentForm">	
							<input type="hidden" value="<%=c.getCommentNo()%>" class="commentNo"name="commentNo">
								<input type="hidden" value="<%=c.getBoardNo()%>" class="cBoardNo"name="cBoardNo">
								
								
							<%System.out.println("댓글삭제폼에있는 코멘트 넘버"+c.getCommentNo()); %>
						
							<div id="note-text-524235">
							
							
								<p id="commentP"><%=c.getContent() %>  </p> 
								
								  <%if (c.getUserName().equals(loginUser.getUserName())){ %>
								<button class="btn btn-outline-danger deleteCommentBtn">삭제하기</button>
								<%} %>
								</form>
									<div class="date-created">
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
			$("#detailForm").attr("action","<%=request.getContextPath()%>/IMGDeleteServlet");
			$("#detailForm").submit();
		}
	}
	
function updateBoard(){
		$("#detailForm").attr("action","<%=request.getContextPath()%>/IMGUpdateFormServlet");
		$("#detailForm").submit();
	}
   	
   	$("#CommentInsertBtn").click(function(){
   		var writer= <%=loginUser.getUserNo() %>;
   		var boardNo =<%=b.getBoardNo()  %>;
   		var content =$("#replyContent").val();
   		
   		
   		$.ajax({
   			url :"InsertCommentServlet",
   			type:"post",
   			dataType:"json",
   			data:{
   				writer:writer,
   				content:content,
   				boardNo:boardNo},
   				success:function(data){
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
   					 
   					 var $form = $("<form action='<%=request.getContextPath()%>/DeleteIMGCommentServlet' method='post' class='commentForm'>");
   					 var $commentNo=$("<input type='hidden' class='commentNo' name='commentNo'>").attr("value",value.commentNo);
   					 var $boardNo=$('<input type="hidden" class="cBoardNo"name="cBoardNo">').attr("value",value.boardNo);
   					 
   					 var $button =$("<button class='btn btn-outline-danger deleteCommentBtn'>").text("삭제하기");
   					 var $div4 =$("<div class='date-created'>");
   					 var $enrollDate =$("<span class='timeago'>").text(value.enrollDate);
   					 
   					 
   					 $div1.append($div2);
   					 $div2.append($img1);
   					 
   					 $div1.append($userName);
   					 
   					 $div1.append($div3);
   					 $div1.append($form);
   					 $form.append($boardNo);
   					 $form.append($commentNo);
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

   	
 
	
   	
   	/*swiper*/
   	
   	  <!-- Initialize Swiper -->

    var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
      slidesPerView: 4,
      freeMode: true,
      watchSlidesVisibility: true,
      watchSlidesProgress: true,
    });
    var galleryTop = new Swiper('.gallery-top', {
      spaceBetween: 10,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      thumbs: {
        swiper: galleryThumbs
      }
    });
   	
   		
   	
   </script>
	
	
	
	
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>