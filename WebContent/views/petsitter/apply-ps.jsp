<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
/*--------------자주 쓰는것들--------------------------*/
.width{
	width:100%;
}
.height{
	height:100%;
}
.float-left{
	float:left;
}
.border{
	border:1px solid black;
}
/*----------------------------------------*/
.apply-wrapper{
	height:320vh;
	width:65%;
	margin:auto;
	margin-top:3%;
}
/*----------------------------------------*/
.apply-pic{
	height:25%;
	position:relative;
}
.cover{
	position:absolute;
	z-index:1;
	background-color:#2E2E2E;
	top:0;
	opacity:0.7;
}
.apply-intro{
	width:50%;
	height:50%;
	position:absolute;
	z-index:2;
	top:50px;
	left:55px;
	color:#D7DF01;
	border-radius:10px;
}
.bigText{
	font-family: 'Jua', sans-serif;
	font-size:2.4rem;
	margin:0;
}
.smallText{
	font-size:0.8rem;
	padding:0;
	margin:0;
}
.apply-btn1{
	margin-top:3%;
	width:50%;
	height:50px;
	border:0;
	background-color:#D7DF01;
	color:black;
	font-family: 'Jua', sans-serif;
	border-radius:10px;
	font-size:1.3rem;
	cursor:pointer;
}
/*----------------------------------------*/
.ps-exp{
	height:25%;
	margin-top:2%;
	border:3px solid #04B486;
	border-radius:10px;
	background-color:#FAFAFA;
}
.title-box{
	height:20%;
	background-color:#04B486;
	color:white;
	font-family: 'Jua', sans-serif;
	font-size:3rem;
	text-align:center;
	padding-top:10px;
}
.content-box{
	height:80%;
	padding:50px;
}
.reason{
	text-align:center;
	font-family: 'Jua', sans-serif;
	font-size:2rem;
	height:20%;
}
.reason-exp{
	height:80%;
}
.finger{
	width:100%;
	height:70%;
	position:relative;
}
.numbersize{
	width:50%;
	height:55%;
	position:absolute;
	top:25%;
	left:25%;
}
/*---------------지원자격-------------------------*/
.quali{
	height:20%;
	padding:30px;
	margin-top:30px;
		background-color:#FAFAFA;
}
.quali-intro{
	font-size:2.5rem;
	font-family: 'Jua', sans-serif;
	margin:0;
	text-align:center;
}
.quali-li{
	list-style-type: none;
	padding: 0;
	margin: 0;
	width:50%;
	height:80%;
	margin:auto;
}
.quali-li::after{
	content:'';
	clear:both;
	display:block;
}
.quali-li1{
	width:50%;
	height:50%;
}
/*
.quali-li2{
	width:50%;
	height:50%;
}
.quali-li3{
	width:50%;
	height:50%;
}
.quali-li4{
	width:50%;
	height:50%;
} */
.quali-icon{
	width:100%;
	height:70%;
	position:relative;
}
.quali-icon1{
	width:70px;
	height:70px;
	position:absolute;
	top:15%;
	left:35%;
	
}
.quali-text{
	text-align:center;
	font-size:1.3rem;
	font-family: 'Noto Sans KR', sans-serif;
}
/*----------------지원 및 등록 절차------------------------*/
.process{
	height:10%;
	margin-top:15px;
	padding:20px;
}
.process-intro{
	font-size:2.5rem;
	font-family: 'Jua', sans-serif;
	margin:0;
	text-align:center;
}
.process-li{
	list-style-type: none;
	padding: 0;
	margin: 0;
	width:50%;
	height:80%;
	margin:auto;
}
.process-li1{
	width:26%;
	height:70%;
	position:relative;
	text-align:center;
	font-size:1.1rem;
	font-family: 'Noto Sans KR', sans-serif;
}
.process-li2{
	width:26%;
	height:70%;
	position:relative;
	text-align:center;
	font-size:1.1rem;
	font-family: 'Noto Sans KR', sans-serif;
}
.process-icon{
	width:70px;
	height:70px;
}
.process-li3{
	width:10%;
	height:70%;
}
.arrow-icon{
	width:45px;
	height:20px;
	margin-top:40px;
}
/*----------------지원하기 버튼-------------------------*/
.apply-btn{
	height:10%;
	margin-top:5%;
	position:relative;
}
.ps-word{
	text-align:center;
	font-size:2.2rem;
	font-family: 'Noto Sans KR', sans-serif;
}
.ps-name{
	text-align:center;
	font-size:1.5rem;
	font-family: 'Noto Sans KR', sans-serif;
	color:#A4A4A4;
}
.apply-btn2{
	position:absolute;
	width:100%;
	height:20%;
	bottom:0;
	border:0;
	background-color:#4B8A08;
	color:white;
	font-size:1.5rem;
	font-family: 'Noto Sans KR', sans-serif;
	cursor:pointer;
}
/*-----------------------------------------*/
.margin-left-li{
	margin-left:45px;
}
.w3{
	width:33%;
}
.text-align{
	text-align:center;
	font-size:1rem;
	font-family: 'Noto Sans KR', sans-serif;
}
/*----------------------------------------*/
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="apply-wrapper">
		<div class="apply-pic width">
			<img class="width height" src="<%= request.getContextPath() %>/resources/petsitter/pet-sitter.jpg">
			<div class="cover width height"></div>
			<div class="apply-intro">
				<p class="bigText">반려동물 전문가</p>
				<p class="bigText"> 방문 펫시터를 모집합니다!</p>
				<p class="smallText">반려동물 선진국 미국과 영국에서는 </p>
				<p class="smallText"><strong>고소득 전문직종</strong>인 방문 펫시터에 도전하세요</p>
				<button class="apply-btn1" onclick="gotoApply()">지원하기</button>
			</div>
		</div>
		<div class="ps-exp width">
			<div class="title-box width">펫시터는 무슨일을 하나요?
				<br><p class="smallText" style="font-size:1rem;">방문펫시터는 고객의 집으로 직접 방문하여 강아지의
				산책, 배변정리, 배식 등 케어를 진행 하는 일을 합니다.</p>
			</div>
			<div class="content-box width">
				<div class="reason"><p>왜 <strong style="color:#4B8A08">자견단</strong> 에서 펫시터를 해야하나요?</p></div>
				<div class="reason-exp">
					<div class="text-align w3 float-left height">
						<div class="finger"><img class="numbersize" src="<%= request.getContextPath() %>/resources/petsitter/one.png"></div>
						집에서 일할수 있는 <strong>재택근무!</strong><br>
						저희는 집에서 편안하게 강아지를<br> 돌보실수 있습니다!
					</div>
					<div class="text-align w3 float-left height">
						<div class="finger"><img class="numbersize" src="<%= request.getContextPath() %>/resources/petsitter/two.png"></div>
						<strong>경력, 학력 무관!</strong><br>
						반려견을 키운 경험만 있으면 누구나<br> 지원가능해요
					</div>
					<div class="text-align w3 float-left height">
						<div  class="finger"><img class="numbersize" src="<%= request.getContextPath() %>/resources/petsitter/three.png"></div>
						<strong>최대 수익금 보장!</strong><br>
						저희는 다른 곳보다 돈을 훨씬 더<br> 많이 드립니다!
					</div>
				</div>
			</div>		
		</div>
		<div class="quali width">
			<p class="quali-intro">지원 자격</p>
			<hr>
			<ul class="quali-li">
				<li class="quali-li1 float-left">
					<div class="quali-icon" style="font-size:1.5rem;">
						<img class="quali-icon1" src="<%= request.getContextPath()%>/resources/petsitter/age.png"/>
					</div>
					<p class="quali-text">만 25세 이상</p>
				</li>
				<li class="quali-li1 float-left">
					<div class="quali-icon">
						<img class="quali-icon1" src="<%= request.getContextPath() %>/resources/petsitter/certificate.png" />
					</div>
					<p class="quali-text">반려견 관련 자격증 우대</p>
				</li>
				<br clear="both">
				<li class="quali-li1 float-left">
					<div class="quali-icon">
						<img class="quali-icon1" src="<%= request.getContextPath() %>/resources/petsitter/dogIcon.png" />
					</div>
					<p class="quali-text">반려경험 3년 이상</p>
				</li>
				<li class="quali-li1 float-left">
					<div class="quali-icon">
						<img class="quali-icon1" src="<%= request.getContextPath() %>/resources/petsitter/stearing.png" />
					</div>
					<p class="quali-text">자차 운전 가능자</p>
				</li>
			</ul>
		</div>
		<div class="process width">
			<div class="process-intro">지원 및 등록 절차</div>
			<hr>
			<ol class="process-li">
				<li class="process-li1 float-left">
					<img class="process-icon" src="<%= request.getContextPath() %>/resources/petsitter/mouse.png">
					<br clear="both">
					온라인 지원
				</li>
				<li class="process-li3 float-left"><img class="arrow-icon" src="<%= request.getContextPath() %>/resources/petsitter/right-arrow.png"></li>
				<li class="process-li1 float-left">
					<img class="process-icon" src="<%= request.getContextPath() %>/resources/petsitter/telephone.png">
					<br clear="both">
					전화 인터뷰
				</li>
				<li class="process-li3 float-left"><img class="arrow-icon" src="<%= request.getContextPath() %>/resources/petsitter/right-arrow.png"></li>
				<li class="process-li2 float-left">
					<img class="process-icon" src="<%= request.getContextPath() %>/resources/petsitter/confirmation.png">
					<br clear="both">
					최종 등록
				</li>
			</ol>
		</div>
		<div class="apply-btn width">
			<p class="ps-word">"자견단의 펫시터의 <strong style="color:#4B8A08;">복지와 급여</strong>는 너무 뛰어나고 고객과도 매칭이 너무 잘돼요."</p>
			<p class="ps-name">-관악구 가정 펫시터 이욱재님-</p>
			<button class="apply-btn2" onclick="gotoApply()">방문 펫시터 지원하기</button>
		</div>
	</div>
	<script>
		function gotoApply(){
			<%if( loginUser!= null) {%>
			location.href="<%= request.getContextPath() %>/views/petsitter/application.jsp"
			<%} else{%>
				if(confirm("로그인된 회원만 펫시터에 지원하실수 있습니다. 로그인 하시겠습니까?")){
					location.href="<%= request.getContextPath()%>/views/member/loginForm.jsp"
				}
			<%}%>
		}
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>