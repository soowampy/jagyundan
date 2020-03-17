<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>


<html>
<head>
<title>자견단</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="<%= request.getContextPath() %>/resources/main/mainStyle.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<%@ include file="../common/menubar.jsp"%>
<style>
.homepage {
	margin-top: 4%;
}

#ps-apply,#goMarket,#goIntro {
	cursor: pointer;
}

p,h2{
	font-family: 'Noto Sans KR', sans-serif;
}

a{
color:black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>


<body class="homepage">

	<div class="container">
		<!-- Main -->
		<div id="main">

			<div class="row">

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header>
							<h2></h2>

						</header>

						<!-- 이부분에 슬라이드 -->
						<a href="#" class="image full"><img
							src="<%= request.getContextPath() %>/resources/image/main1.jpg"
							alt="" /></a>


						<p>
							우리 <strong>견자단</strong>은 댕댕이를 사람과 같이 생각합니다.
						</p>
						<p>반려동물은 ‘가슴으로 만든 가족’ 입니다. 우리와 삶을 함께하며 기쁨과 즐거움, 행복과 사랑을 안겨준 이
							세상 무엇으로도 대신할 수 없는 소중한 선물입니다. 최고의 서비스와 깜짝 선물로 고마운 마음을 전하세요
						</p>
					</section>
				</div>

				<!-- Sidebar -->
				<div id="sidebar" class="4u">
					<section>
						<header>
							<h2></h2>
						</header>
						<ul class="style">
							<li id="goIntro">
								<p><strong>펫시터란?</strong></p> <img src="<%= request.getContextPath() %>/resources/image/dog2.png"	width="70px" height="70px" alt="" />
								<p class="text">펫시터 정보 보기</p>
							</li>
							<li id="goMarket">
								<p><strong>이달의 추천 상품!</strong></p> <a href="<%= request.getContextPath() %>/ProductBoardDetailServlet?product_No=22"><img
								src="<%= request.getContextPath() %>/resources/image/mainShop.jpg"
								width="70px" height="70px" alt="" /></a>
								<p class="text"><a href="<%= request.getContextPath() %>/ProductBoardDetailServlet?product_No=22">[뮤니쿤트] 치즈 넥워머 2color</a></p>
							</li>
							
							<li id="ps-apply">
								<p><strong>펫시터 지원하기!</strong></p> <img
								src="<%= request.getContextPath() %>/resources/image/dog4.jpg"
								width="70px" height="70px" alt="" />
								<p class="text">펫시터 지원을 위해...</p>
							</li>

							<!-- 펫시터 지원하기 화면 들어가는 부분 -->
							<script>
                        	$(function(){
                        		$("#ps-apply").click(function(){
                        			location.href="<%= request.getContextPath()%>/views/petsitter/apply-ps.jsp";
                        		});
                        		
                        		$("#goMarket").click(function(){
                        			location.href="<%= request.getContextPath() %>/ProductBoardDetailServlet?product_No=22";
                        		});
                        		
                        		$("#goIntro").click(function(){
                        			location.href="<%= request.getContextPath() %>/views/common/PsIntro.jsp";
                        		});
                        	});
                        </script>
						</ul>
					</section>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Footer -->
	<div id="featured">
		<div class="container">
			<div class="row">
				<div class="4u">
					<h2>자유게시판</h2>
					<a
						href="<%= request.getContextPath() %>/list.bo"
						class="image full"><img
						src="<%= request.getContextPath() %>/resources/image/자유게시판.jpg"
						width="380px" height="160px" alt="" /></a>
					<p>다양한 주제로 자유로운 이야기를 주고 받으세요!</p>
					<p>
						<a href="<%= request.getContextPath() %>/list.bo" class="button" style="background-color:#5caf5d">More Details</a>
					</p>
				</div>
				<div class="4u">
					<h2>반려견 스토리</h2>
					<a
						href="<%= request.getContextPath() %>/IMGListServlet"
						class="image full"><img
						src="<%= request.getContextPath() %>/resources/image/반려견스토리.jpg"
						width="380px" height="160px" alt="" /></a>
					<p>여러분들의 댕댕이를 자랑해보세요!</p>
					<p>
						<a href="<%= request.getContextPath() %>/IMGListServlet" class="button" style="background-color:#5caf5d">More Details</a>
					</p>
				</div>
				<div class="4u">
					<h2>공지사항</h2>
					<a
						href="<%=request.getContextPath()%>/NoticeListServlet"
						class="image full"><img
						src="<%= request.getContextPath() %>/resources/image/공지사항.jpg"
						width="380px" height="160px" alt="" /></a>
					<p>새로운 내용을 확인하세요!</p>
					<p>
						<a href="<%=request.getContextPath()%>/NoticeListServlet" class="button" style="background-color:#5caf5d">More Details</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>