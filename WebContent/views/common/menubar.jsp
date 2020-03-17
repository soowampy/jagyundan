<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.*"%>

<%

User loginUser = (User)session.getAttribute("loginUser");

String msg = (String)session.getAttribute("msg");
%>


<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>자견단</title>

<!-- Bootstrap core CSS -->
<link	href="<%= request.getContextPath() %>/resources/menubar/bootstrap.min.css"	rel="stylesheet">
<!-- Custom styles for this template -->
<link	href="<%= request.getContextPath() %>/resources/menubar/full-width-pics.css"	rel="stylesheet">
<style>
*{
font-family: 'Noto Sans KR', sans-serif;
}

.navbar {
	margin: 0%;

}
#aa{
	width:70%;
	height:70%;
}

.mnav:hover {
	opacity: 0.5;
	cursor: pointer;
}
</style>
<script>
	var msg = "<%= msg %>";
	$(function(){
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("msg"); %>
		}
	});
</script>
</head>

<body>

<body class="menubarbody">
	<!-- Navigation -->
	<nav class="navbarM navbarM-expandM fixed-top">
		<div class="container">

			<!-- 로고-->
			<a href="<%= request.getContextPath() %>/">
			<img 	width="70%",
	height="70%", src="<%= request.getContextPath() %>/resources/image/logo.png"></a>
	

			<button class="navbarM-togglerM" type="button"
				data-toggle="collapseM" data-target="#navbarMResponsive"
				aria-controls="navbarMResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbarM-togglerM-icon"></span>
			</button>
			<div class="collapseM navbarM-collapseM" id="navbarMResponsive">
				<ul class="navbarM-nav ml-auto">
					<li class="nav-itemM active"><a class="nav-linkM" href="#">
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-itemM" id="nav-itemM">
						<!-- //메인 --> <a class="nav-linkM" href="<%= request.getContextPath() %>/">
						<img
							src="<%= request.getContextPath() %>/resources/image/main.png" id="nav-itemM1" class="mnav"></a>
					</li>
					<li class="nav-itemM">
						<!-- //펫시터 --> <a class="nav-linkM" href="<%= request.getContextPath() %>/SelectPsBoardList"><img
							src="<%= request.getContextPath() %>/resources/image/petservice.png" id="nav-itemM2" class="mnav"></a>
					</li>
					<li class="nav-itemM">
						<!-- //마켓 --> <a class="nav-linkM" href="<%= request.getContextPath() %>/ProductBoardListServlet"><img
							src="<%= request.getContextPath() %>/resources/image/market.png" id="nav-itemM3" class="mnav"></a>
					</li>
					<li class="nav-itemM">
						<!-- //커뮤니티 --> <a class="nav-linkM" href="<%= request.getContextPath() %>/list.bo"><img
							src="<%= request.getContextPath() %>/resources/image/community.png" id="nav-itemM4" class="mnav"></a>
					</li>
					<% if(loginUser == null) { %>
					<li class="nav-itemM"><a class="nav-linkM"
						href="<%= request.getContextPath() %>/views/member/loginForm.jsp"><img src="<%= request.getContextPath() %>/resources/image/log.png"
							id="nav-itemM5" class="mnav"></a></li>
					<li class="nav-itemM"><a class="nav-linkM"
						href="<%= request.getContextPath() %>/views/member/memberJoin.jsp"><img src="<%= request.getContextPath() %>/resources/image/join.png"
							id="nav-itemM5" class="mnav"></a></li>
					<%}else{ %>
					<li class="nav-itemM"><a class="nav-linkM"
						href="<%= request.getContextPath() %>/views/myPage/myPageMain2.jsp"><img
							src="<%= request.getContextPath() %>/resources/image/mypage.png"
							id="nav-itemM7" class="mnav"></a></li>
					<%} %>
				</ul>
			</div>
		</div>
	</nav>


</body>



</html>
