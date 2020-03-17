 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String pwmsg = (String) request.getAttribute("pwmsg");

	String pscheck = (String) request.getAttribute("pscheck");
	String approval = (String) request.getAttribute("approval");
	
	
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>자견단</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Custom fonts for this template-->

<style>
#inner {
	margin-top: 5%;
	margin-bottom: 10%;
	width: 100%;
}

.card {
	
}

.select {
	width: 15%;
	height: 15%;
	margin: 1%;
}

#wrapper, #content-wrapper, .card-header, .card-footer, .row, .col-lg-12,
	.card mb-12 {
	width: 100%;
}

.selectList {
	text-align: center;
}

#pp {
	font-size: 2em;
	margin: 3%;
	text-align: center;
}
#ppp{
	text-align: center;
	color:green;
	
}

.col-lg-12 {
	margin-bottom: 10%;
}

hr {
	width: 80%;
}

.mpButton {
	background-color: #5caf5d;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 16px;
}

.mpButton:hover {
	background-color: #f1f1f1;
	color: black;
}

.userImg {
	border-radius: 100%;
	width: 100%;
	height: 100%;
}

#userImg {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	width: 200px;
	height: 200px;
	border: 3px rgba(102, 102, 102, 0.514) solid;
	text-align: center;
	display: inline-block;
}

#page-top {
	background-color: rgba(231, 230, 230, 0.24)
}

#hmm {
	width: 100%;
	display: inline-block;
	float: left;
}

#humm {
	display: inline-block;
}

/* 악 */
.social {
	position: relative;
	height: 4.5em;
	width: 20.25em;
}

.social li {
	display: block;
	height: 6em;
	line-height: 6em;
	margin: -3.3em;
	position: absolute;
	-webkit-transition: -webkit-transform .7s;
	-moz-transition: -moz-transform .7s;
	-ms-transition: -ms-transform .7s;
	-o-transition: -o-transform .7s;
	transition: transform .7s;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	transform: rotate(45deg);
	text-align: center;
	width: 6em;
}

.social a {
	color: black;
	font-size: 10pt;
	height: 4em;
	line-height: 6em;
	text-align: center;
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	transform: rotate(-45deg);
	width: 4em;
}

.social li:hover {
	-webkit-transform: scale(1.3, 1.3) rotate(45deg);
	-moz-transform: scale(1.3, 1.3) rotate(45deg);
	-ms-transform: scale(1.3, 1.3) rotate(45deg);
	-o-transform: scale(1.3, 1.3) rotate(45deg);
	transform: scale(1.3, 1.3) rotate(45deg);
}

.facebook {
	background: #b3d2f0;
	left: 0;
	top: 0%;
}

.twitter {
	background: #d2f7eb;
	bottom: 0;
	left: 25%;
}

.pinterest {
	background: #dcf7ff;
	left: 50%;
	top: 0%;
}

.behance {
	background: #ffe5e5;
	bottom: 0;
	left: 75%;
}

#a {
	width: 100%;
	height: 100%;
	margin-left: 25%; 	
	margin-bottom:20%;
}

}
#when {
	display: inline;
	float: left;

}

#aaa {
	display: inline;
	float: left;
}

.select:hover {
	opacity: 0.7;
	cursor: pointer;
}
.card mb-12{
text-align:center;
}
</style>
<script>
	var msg = "<%=pwmsg%>";
	var pscheck = "<%=pscheck%>";
	var approval = "<%=approval%>";
	
	$(function(){
		if(pwmsg != "null"){
			alert(msg);
		}
	});
</script>

</head>

<body id="page-top">
	<%@ include file="../common/menubar.jsp"%>
	<div class="container">
		<div id="inner">
			<div id="wrapper">

				<div id="content-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="card mb-12">
									<br> <br> <strong><p id="pp">

									<%=loginUser.getUserName()%>
											회원님 환영합니다!<br>
											
										</p></strong>
										<p id="ppp"><%if(loginUser.getUserPwd()==null){ %>
										네이버 아이디로 로그인하셨습니다
										<%} %></p>
									<div id="hr">
										<hr>
									</div>
									<div class="selectList">
										<br>
										<div id="petPic">
											<div id="hmm">
												<div id="when">
													<div id="userImg">
														<img
															src="<%= request.getContextPath() %>/resources/userimg/<%=loginUser.getChangeName() %>"
															class="userImg" alt="">
														
													</div>
													<div id="humm">
														<br>
														<div id="a">
															<ul class="social">
																<li class="facebook"><a
																	href="<%=contextPath%>/views/myPage/user/myPwdUpdate.jsp">비밀번호변경</a></li>
																<li class="twitter"><a
																	href="<%=contextPath%>/myPetListServlet">반려견관리</a></li>
																<li class="pinterest"><a
																	href="<%=contextPath%>/mpJjimListServlet">장바구니</a></li>
																<li class="behance"><a
																	href="<%= request.getContextPath() %>/logout">로그아웃</a></li>
															</ul>
															<br>
														</div>



													</div>
													<br>
												</div>
											</div>
											<br>
											<br>
											<br>
											<br> <br>
											
											<a
												href="<%=request.getContextPath()%>/views/myPage/user/myInfoUpdate.jsp"><img
												src="<%=request.getContextPath()%>/resources/mypage/image/mpMyinfo.png"
												class="select"></a> <a
												href="<%=request.getContextPath()%>/mpBoardListServlet"><img
												src="<%=request.getContextPath()%>/resources/mypage/image/mpBoardList.png"
												class="select"></a> <a
												href="<%= request.getContextPath() %>/MyMarketList"><img
												src="<%=request.getContextPath()%>/resources/mypage/image/mpOrderList.png"
												class="select"></a><br>
											<!-- 본인이 펫시터일때 들어가는 부분 -->
											<!-- 내가(이욱재)수정할부분 -->
											<a href="javascript:psCheck()"><img
												src="<%=request.getContextPath()%>/resources/mypage/image/mpPetsitterPage.png"
												class="select"></a> <a
												href="<%=request.getContextPath()%>/PetsitterUseList"><img
												src="<%=request.getContextPath()%>/resources/mypage/image/mpPetsitterService.png"
												class="select"></a> <a
												href="<%= request.getContextPath() %>/reportListServlet"><img
												src="<%=request.getContextPath()%>/resources/mypage/image/mpReport.png"
												class="select"></a> <br> <br>
											<div id="hr">
												<hr>
											</div>
											<br> <br> <br> <br>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /#wrapper -->

				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>

			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%@ include file="../common/footer.jsp"%>

	<script>
function myPwdUpdate(){
	location.href = "<%=contextPath%>/views/myPage/user/myPwdUpdate.jsp";
};

function myPetInfo(){
	location.href = "<%=contextPath%>/myPetInfo";
};

function jjim(){
	location.href = "<%=contextPath%>/views/myPage/market/jjim.jsp";
}
function psCheck(){ //확인하는 부분
	$.ajax({
		url : "<%=request.getContextPath()%>/CheckPs", //CheckPs로 감
						success : function(data) { //연결 성공시
							console.log(data);
							switch (data) {
							case "ps-ok": //승인 완료
								console.log("승인 완료")
<%-- 								location.href = "<%= request.getContextPath() %>/views/myPage/petSitter/petSitterPage1.jsp"; --%>
									location.href = "<%= request.getContextPath() %>/PetsitterSelect";
				break;
			case "not-yet": //승인 대기
				alert("관리자의 승인을 기다리고 있습니다!")
				break;
			case "fail" : //승인 거절
				alert("관리자의 승인이 거절되었습니다.")
				break;
			case "ap-no"://지원 하지 않음
				if(confirm("펫시터 지원을 하지 않았습니다. 펫시터 지원을 하러 가시겠습니까?")){
					location.href="<%= request.getContextPath()%>/views/petsitter/apply-ps.jsp";
				}
				break;
			}
		},
		error:function(){
			console.log("ajax와 연결 실패");
		}
	})
}

function logout(){
	location.href = '<%= request.getContextPath() %>/logout';
}
</script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>

</html>
