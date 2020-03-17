<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, productBoard.model.vo.* , common.model.vo.*"%>
<%
	ArrayList<ProductBoard> plist = (ArrayList<ProductBoard>)request.getAttribute("plist");

	ArrayList<IMG> flist = (ArrayList<IMG>)request.getAttribute("flist");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<!-- Bootstrap core CSS -->
<link href="<%= request.getContextPath() %>/resources/market/vendor/bootstrap/css/bootstrap.min.css"  rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%= request.getContextPath() %>/resources/market/css/agency.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#img1 {
	width: 100%;
	height: 100%;
}

#test1:hover { /* 물품 마우스 hover */
	opacity: 0.5;
}

.searchArea { /* 검색 창 */
	float: right;
	width: 300px;
}

/* 정렬폼 */
.ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	margin-left: auto;
	margin-right: auto;
}

.ul>.li {
	float: left;
}

.li a {
	text-decoration: none;
	font-weight: bold;
	color: gray;
	display: block;
	text-align: center;
	padding: 10px;
}

/* 상단 네비 */
.navi {
	list-style-type: none;
	margin: 0;
}

.navi>.lii {
	float: left;
	padding-left: 40px;
	padding-right: 40px;
}

.navi-box {
	text-align: center;
	display: inline-block;
}

.lii a {
	text-decoration: none;
	font-weight: bold;
	color: black;
	display: block;
	text-align: center;
}

.nav {
	width: 90px;
	height: 40px;
}

.nav:hover {
	opacity: 0.5;
	cursor: pointer;
}

#ja {
	width: 20%;
	height: 25%;
}
</style>
</head>
<%@ include file="../common/menubar.jsp"%>
<body id="page-top">


	<!-- 상품 게시판 -->
	<section class="bg-light page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<img src="<%= request.getContextPath() %>/resources/productBoard/imgg/자견샵.png" id="ja">
					<h3 class="section-subheading text-muted">자견샵 물품은 반려견 맞춤으로 안전합니다.</h3>
					<hr>
					<!-- 상단 네이 바  -->
					<div class="navi-box">
						<ul class="navi">
							<li class="lii"><img src="<%= request.getContextPath() %>/resources/productBoard/imgg/야외용품.png" class="nav">
							<input type="hidden" class="navi" value="1"></li>
							<li class="lii"><img src="<%= request.getContextPath() %>/resources/productBoard/imgg/패션.png" class="nav">
							<input type="hidden" class="navi" value="2"></li>
							<li class="lii"><img src="<%= request.getContextPath() %>/resources/productBoard/imgg/장난감.png" class="nav">
							<input type="hidden" class="navi" value="3"></li>
							<li class="lii"><img src="<%= request.getContextPath() %>/resources/productBoard/imgg/훈련용품.png" class="nav">
							<input type="hidden" class="navi" value="4"></li>
							<li class="lii"><img src="<%= request.getContextPath() %>/resources/productBoard/imgg/음식.png" class="nav">
							<input type="hidden" class="navi" value="5"></li>
							<li class="lii"><img src="<%= request.getContextPath() %>/resources/productBoard/imgg/기타.png" class="nav">
							<input type="hidden" class="navi" value="6"></li>
						</ul>
					</div>
					<script>
					
					$(function(){
						$(".lii").click(function(){
							var product_Cate = $(this).children().eq(1).val();
							location.href="<%= request.getContextPath() %>/ProductBoardCateServlet?product_Cate="+product_Cate;
						});
					});
					
					</script>
					<br>
					<hr>
					<br>

					<!-- 검색폼 -->
				<form action="<%= request.getContextPath() %>/ProductBoardSearch"  method="get">
					<div class="searchArea" align="center">
						<div class="input-group mb-3">
							<input type="text" name="search" class="form-control"aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-success" id="searchBtn">검색하기</button>
							</div>
						</div>
					</div>
				</form>
					<!-- ========== -->
				</div>
			</div>



			<div class="row">
				<% for(ProductBoard pb : plist){ %>
				<!-- ==============================상품============================== -->
				<div class="col-md-4 col-sm-6 portfolio-item">
					<input type="hidden" value="<%= pb.getProductNo() %>"> 
						<div class="portfolio-hover-content">
							<i class="fas fa-plus fa-3x"></i>
						</div> 
						<% for(IMG at : flist){ %>
						<% if(pb.getProductNo() == at.getProductNo()){ %>
						<img class="img-fluid" src="<%= request.getContextPath() %>/resources/productBoard/<%= at.getChangeName() %>" id="test1">
							<% } %>
						<% } %>
					<div class="portfolio-caption">
						<h6><%= pb.getProductName() %></h6>
						<p class="text-muted"> <%= pb.getPrice() %>원</p>
					</div>
				</div>
			<% } %>
				<!-- ===================================================== -->
			</div>
			<hr>
		</div>
		<script>
		// 상세 보기
		$(function(){
			$(".col-md-4").click(function(){
				var product_No = $(this).children().eq(0).val();
				location.href="<%= request.getContextPath() %>/ProductBoardDetailServlet?product_No="+product_No;
			});
		});
		</script>
	</section>
</body>
<%@ include file="../common/footer.jsp"%>
</html>