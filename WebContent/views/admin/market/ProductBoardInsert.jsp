<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/market/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/market/css/agency.min.css"
	rel="stylesheet">

<style>
.outer {
width:500px;
height:1000px;
   margin: auto;
   margin-top: 50px;
}

.tt {
   width: 100%;
   border: 1px solid rgba(0, 128, 0, 0.507);
}
#inner{
width:100%;
margin-bottom:3%;
}
</style>
</head>
<%@ include file="../common/adminNavibar.jsp" %>
 	 	 	<script>
$("#main").attr('class','nav-item');
$("#user").attr('class','nav-item');
$("#adpetSitterRequestList").attr('class','collapse-item');
$("#adpetSitterList").attr('class','collapse-item');
$("#marketad").attr('class','collapse-item ');
$("#marketInsert").attr('class','collapse-item  active');
$("#marketBuy").attr('class','collapse-item');
$("#marketCancel").attr('class','collapse-item');
$("#freeBoard").attr('class','collapse-item ');
$("#picBoard").attr('class','collapse-item ');
$("#comment").attr('class','collapse-item ');
$("#boardQnA").attr('class','collapse-item ');

</script>	
 	<body id="page-top">
  <div id="inner">
	<section class="bg-light page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="outer">
					<br>
					<h2 align="center">상품 입력</h2>
					<hr>
					<div class="tableArea">
						<form action="<%= request.getContextPath() %>/ProductBoardInsertServlet" method="post" enctype="multipart/form-data">
							<fieldset>
								<table>
									<tr>
										<td colspan="6"><h5><strong>대표 이미지</strong></h5></td>
									</tr>
									<tr>
										<td colspan="6">
											<div id="titleImgArea">
												<img id="titleImg" width="350" height="200" class="tt">
											</div>
										</td>
									</tr>

									<tr>
										<td colspan="6"><h5><strong>옵션</strong></h5></td>
									</tr>

									<tr>
										<td>분야</td>
										<td><select name="category" class="tt">
												<option>----</option>
												<option value="1">야외용품</option>
												<option value="2">패션</option>
												<option value="3">장난감</option>
												<option value="4">훈련용품</option>
												<option value="5">음식</option>
												<option value="6">기타</option>
										</select></td>
										<td>사이즈</td>
										<td><select id="searchCondition" name="size"  class="tt">
												<option value="F">----</option>
												<option value="S">S</option>
												<option value="M">M</option>
												<option value="L">L</option>
										</select></td>
										
										<td>가격</td>
										<td><input type="number" size="58" name="price" min="0" class="tt"></td>
									</tr>
														<tr>
						           <td colspan="6"><h5><strong>수량</strong></h5></td>
						           </tr>
						            <tr>
						            <td colspan="6"><input type="number" size="45" name="amount" value="0"></td>
					                </tr>

									<tr>
										<td colspan="6"><h5><strong>제목</strong></h5></td>
									</tr>
									<tr>
										<td colspan="6"><input type="text" size="58" name="title"
											class="tt"></td>
									</tr>
									<tr>
										<td colspan="6"><h5><strong>내용</strong></h5></td>
									</tr>
									<tr>
										<td colspan="6"><textarea rows="15" cols="60" name="content" style="resize: none;" class="tt"></textarea></td>
									</tr>
								</table>
								<br>
								<div align="center">
									<button id="submit" type="submit" class="btn btn-outline-success">등록하기</button>
									<button id="pp" type="button" class="btn btn-outline-success">사진등록</button>
									<div id="fileupload">
										<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)"> 
										<input type="file" id="thumbnailImg2" name="thumbnailImg2">
									</div>
									<br>
									<script>
										$(function() {
											$("#fileupload").hide();

											$("#titleImgArea").click(
													function() {
														$("#thumbnailImg1").click();
													});
											$("#pp").click(function() {
												$("#thumbnailImg2").click();
											});
										});
					                       function loadImg(value, num){
					                    	   
												var reader = new FileReader();
												
												reader.onload = function(e){
														$("#titleImg").attr("src", e.target.result);							
												}
												// 파일 읽기 하는 메소드
												reader.readAsDataURL(value.files[0]);
											}
									</script>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section></div></div></div></div></div></div></div></div></div></div>
	</div>
	  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/demo/datatables-demo.js"></script>
</body>

</html>