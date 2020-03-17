<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="productBoard.model.vo.* , common.model.vo.*, board.model.vo.*, java.util.* , java.text.SimpleDateFormat"%>
	<%
	ProductBoard pb = (ProductBoard)request.getAttribute("productBoard");
	
	ArrayList<IMG> fileList = (ArrayList<IMG>)request.getAttribute("fileList");
	
	IMG titleImg = fileList.get(0);
	
	Date today = new Date();
    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
    String tday = format1.format(today);
    
    ArrayList<pComment> clist = (ArrayList<pComment>)request.getAttribute("clist");
	
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="<%=request.getContextPath()%>/resources/market/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/market/css/agency.min.css"
	rel="stylesheet">
<style>
.ps-img {
	height: 100%;
	width: 100%;
	border-radius: 50%;
	background-color: #D8F6CE;
}

.ps-dog {
	position: absolute;
	height: 40%;
	width: 50%;
	bottom: 0;
	right: 0;
	padding: 10%;
	border-radius: 50%;
	z-index: 1;
	background-color: #FFFF00;
}

.ps-img-dog {
	margin-bottom: 150px;
	border: 1px solid black;
	height: 100px;
	width: 100px;
	position: relative;
}
/* ============================================== */
#left {
	position: left;
}

#right {
	position: right;
}

#content {
	display: inline-bloack;
	width:50%;
}

#tablle {
	width: 100%;
	font-size: 20px;
}

td {
	text-align: center;
	padding: 5px;
}

Button {
	float: right;
	margin: 5px;
}

#cont, #contt, .replyArea {
	text-align: center;
}

#num{
  width : 25px;
}


/* ============================================= */
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



#deleteCommentBtn{
position:relative;

width:90px;
height:38px;
display : inline-block;
}


</style>

</head>
<%@ include file="../common/menubar.jsp"%>
<body>
	<section class="bg-light page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<!--  -->

				<div class="col-md-4 col-sm-6 portfolio-item">
					<div class="portfolio-hover-content">
						<i class="fas fa-plus fa-3x"></i>
					</div>
					<img class="img-fluid" src="<%= request.getContextPath() %>/resources/productBoard/<%= titleImg.getChangeName() %>" id="test1">
					<div class="portfolio-caption">
						<h6><%= pb.getProductName() %></h6>
						<p class="text-muted"><%= pb.getPrice() %>원</p>
					</div>
				</div>
				<div id="content">
					<h2 align="center"><%= pb.getProductName() %></h2>
					<br>
					<hr>
					<br>
				<form action="<%= request.getContextPath() %>/ProductBoardBuyServlet" method="post">
					<input id="product_No" name="productNo" type="hidden" value="<%= pb.getProductNo() %>"> 
					<table id="tablle">
						<tr>
							<td width="20%">판매가</td>
							<td width="60%"></td>
							<td width="20%"><%= pb.getPrice() %>원</td>
						</tr>
						<tr>
							<td width="20%">배송비</td>
							<td width="60%"></td>
							<td width="20%">무료</td>
						</tr>
						<% if(!(pb.getProductCate()==5 || pb.getProductCate()==6)){ %>
						<tr>
							<td width="20%">사이즈</td>
							<td width="60%"></td>
							<td width="20%"><select id="searchCondition" name="size">
									<option>----</option>
									<option value="S">S</option>
									<option value="M">M</option>
									<option value="L">L</option>
							</select></td>
						</tr>
						<% } %>
						<tr>
						<td width="20%">수량</td>
						<td width="60%"> </td>
						<td width="20%"><input type="tel" name="amount" id="num" maxlength="1" required></td>
						</tr> 
					</table>
					<hr>
					<div id="Bttn">
						<button id="insertBtn"  class="btn btn-outline-success">결제하기</button>
						&nbsp;
						<button type="Button" id="jjim" onclick="" class="btn btn-outline-success">장바구니</button>
					</div>
					
						</form>
				</div>
				<script>
				
				$("#jjim").click(function(){
					var product_No = $("#product_No").val();
					location.href="<%= request.getContextPath() %>/JjimInsertServlet?product_No="+product_No;
				})
				</script>

			</div>
			<hr>

			<div id="cont">
			<img id="detailImg" class="imgg" src="<%= request.getContextPath() %>/resources/productBoard/<%= fileList.get(1).getChangeName() %>">
			</div>
			
		</div>
		<!-- 상품설명 -->
		<div id="contt">
		 <% if(!(pb.getProductCate()==5 || pb.getProductCate()==6)){ %>
               <img class="imgg" src="<%= request.getContextPath() %>/resources/productBoard/imgg/사이즈표.jpg">            
               <%} %>
		<pre>
		
			
*품절된 옵션은 12월 초 재입고 예정에 있습니다.*<br>
대표번호

010-4927-0935
﻿

필독사항 

 

1. 고객상담시간은 토, 일, 공휴일을 제외한 10시~19시까지이며,

13~14시까지는 점심 시간이므로 상담이 어려울 수 있습니다.

2. 문의 전화가 많은 경우 통화가 지연될 수 있으니 문의 게시판을 이용해주시기 바랍니다.

3. 택 제거 후에는 교환 및 환불이 불가합니다.

4. 모든 위탁 판매 상품은 위탁 판매 업체의 교환 및 환불 정책에 따르며, 상세페이지에 별도로 기재되어 있습니다.

﻿

배송안내

 

1. 배송업체 : CJ 대한통운

2. 배송지역 : 전국지역

3. 기본 배송비 : 무료

4. 평균 배송일 : 월~금 (공휴일 제외) 오전 10시 이전에 주문/결제 완료된 제품에 한하여 당일 출고됩니다.

단, 재고가 없거나 주문정보의 누락, 배송지연이 별도 공지된 제품은 당일 출고가 어려울 수 있습니다.

5. 고객님의 부재, 연락처 오류, 주소 오류 등으로 인한 반송시 왕복 택배비 (6,000원)은 고객 부담입니다.

6. 발송 후 송장번호를 문자로 보내드리니 CJ대한통운 웹사이트에서 조회할 수 있습니다. 

﻿

반품/교환 사유에 따른 요청 가능 기간

 

반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 반송해 주시기 바랍니다. 

 

1. 구매자의 단순 변심은 상품 수령 후 7일 이내

(구매자 반품배송비 부담) 

2. 표시/광고와 상이, 상품 하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내.

둘 중 하나 경과시 반품/교환 불가 (판매자 배송비 부담)



반품/교환 불가능한 사유


아래와 같은 경우 반품/교환이 불가능합니다.  

 

1. 반품요청기간이 지난경우

2. 구매자의 책임 있는 사유로 상품 등이 명실 또는 훼손된 경우

(단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)

3. 상품을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우

(예: 상품, 화장품, 향수류, 음반 등)

4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우

5. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 		

		</pre>
		      <img src="<%= request.getContextPath() %>/resources/productBoard/imgg/자견단_주의사항.jpg">
		</div>
		<br>
		
		<div class="container">
		<!-- 댓글 -->
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
                  <% for(pComment c : clist){ %>
               
               <li class="list-group-item note-item clearfix" id="note-524236">
                  <div class="content-body panel-body pull-left">
                     <div class='avatar avatar-medium clearfix'>

                        <img src='<%=request.getContextPath()%>/resources/userimg/<%=c.getChangeName() %>' class="review">
                     </div>
                     <span class="nickname"><strong><%=c.getUserName() %></strong></span>
                     
                     
                     <%--댓글 삭제를 위한 보이지 않는 form --%>
                     <form action="<%=request.getContextPath()%>/PdeleteCommentServlet"  class="commentForm" method="get">
                     <input type="hidden" value="<%=c.getCommentNo()%>" class="commentNo"name="commentNo">
                     <input type="hidden" value="<%=c.getProductNo()%>" class="product_No" name="productNo">
                     <div id="note-text-524235">
                     
                        <p id="commentP"><%=c.getContent() %>  </p> 
                        <%if ( c.getUserName().equals(loginUser.getUserName()) ){ %>
                        <button class="btn btn-outline-danger deleteCommentBtn">삭제하기</button>
                        <%} %>
                           <div class="date-created">
                              <span class="timeago"><%=c.getEnrollDate() %></span>
                           </div>
                     </div>
                     </form>
                     
                     
                     
                  </div>
               </li>
               
               <%} %>
            <%} %>
               
            </ul>
         </div>
      </div>
      </div>

		<!-- ============================================ -->
		<script>
         
         $("#CommentInsertBtn").click(function(){
            var writer= <%=loginUser.getUserNo() %>;
            var productNo =<%=pb.getProductNo()  %>;
            var content =$("#replyContent").val();
            
            
            $.ajax({
               url :"PinsertCommentServlet",
               type:"post",
               dataType:"json",
               data:{
                  writer:writer,
                  content:content,
                  productNo:productNo},
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
                      
                      var $form = $("<form action='<%=request.getContextPath()%>/PdeleteCommentServlet' method='post' class='commentForm'>");
    					 var $commentNo=$("<input type='hidden' class='commentNo' name='commentNo'>").attr("value",value.commentNo);
    					 var $productNo=$('<input type="hidden" class="productNo"name="productNo">').attr("value",value.productNo);
    					 var $button =$("<button class='btn btn-outline-danger deleteCommentBtn'>").text("삭제하기");
                      
                      var $div4 =$("<div class='date-created'>");
                      var $enrollDate =$("<span class='timeago'>").text(value.enrollDate);
                      
                      
                      $div1.append($div2);
                      $div2.append($img1);
                      
                      $div1.append($userName);
                      
                      $div1.append($div3);
                      $div1.append($form);
    					 $form.append($productNo);
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
         
		</script>
	</section>
</body>
<%@ include file="../common/footer.jsp"%>
</html>