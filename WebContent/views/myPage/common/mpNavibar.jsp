<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.*"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
/* 1. 수직 내비게이션 바 */
.navi {
	width: /* 200px; */ 20%;
	height: 750px;
	list-style-type: none;
	margin: 0;
	margin-top: 5%;
	padding: 0;
	background-color: rgba(167, 167, 167, 0.137);
	border-radius: 16px;
	display: flex;
	flex-direction: column;
}

.navi li a {
	color: #000000;
	list-style-type: none;
	text-decoration: none;
	display: block;
	text-align: center;
	padding: 20px;
}

.navi li a:hover {
	background-color: #5caf5d;
	list-style-type: none;
	color: white;
}

.mpNav {
	width: 100%;
}

.mpButton {
	background-color: #5caf5d;
	border: none;
	color: white;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 3px 2px;
	cursor: pointer;
	border-radius: 16px;
	width: 43%;
}

.mpButton:hover {
	background-color: rgba(125, 196, 107, 0.459);
	color: black;
}

.mpNav {
	text-align: center;
}

hr {
	margin: 0%
}

#Mpwrapper {
	display: flex;
}

.userImg {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	text-align: center;
}

@media only screen and (max-width: 870px) {
	.userImg {
		display: none;
	}
	.mpButton {
		display: none;
	}
	.navi {
		width: 100%;
		height: 580px;
	}
}
}
</style>
<body>
<%@ include file="../../common/menubar.jsp"%>
	<!--  	<div class="container2"> -->
	<div class="container2">
			<div class="mpinner">
			<div class="container">

	<div id="Mpwrapper">
		<ul class="navi">
			<li class="mpNav"><br> <img
				src="<%= request.getContextPath() %>/resources/userimg/<%=loginUser.getChangeName() %>"
				class="userImg"> <br>
			<br>
				<p>
					<b><%=loginUser.getUserName() %>님 (<%=loginUser.getUserId() %>)</b>
				</p>
				<button class="mpButton" id="mpPwUpdate"  onclick="myPwdUpdate();">
					비밀번호<br>변경
				</button>
				<button class="mpButton" id="mpPetUpdate" onclick="myPetInfo();">
					반려견<br>관리
				</button> <br> <br>
				<hr style="border: dashed 0.7px rgba(158, 158, 158, 0.322);"></li>
			<li class="mpNav"><a
				href="<%= request.getContextPath() %>/views/myPage/user/myInfoUpdate.jsp">내
					정보 변경</a></li>
			<li class="mpNav"><a
				href="<%= request.getContextPath() %>/mpBoardListServlet">작성한
					글</a></li>
			<li class="mpNav"><a
				href="<%= request.getContextPath() %>/mpJjimListServlet">장바구니</a></li>
			<li class="mpNav"><a
				href="<%= request.getContextPath() %>/MyMarketList">주문
					내역</a></li>
			<li class="mpNav"><a
				href="<%= request.getContextPath() %>/PetsitterUseList">펫시터
					이용내역</a></li>
			<li class="mpNav"><a
				href="javascript:psCheck()">펫시터
					페이지</a></li>
			<li class="mpNav"><a
				href="<%= request.getContextPath() %>/reportListServlet">1:1
					문의</a></li>


		</ul>
		<br>		<br>		<br>		<br>
		<br>
		<br>
		<br>
		<br> <br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> <br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> <br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> <br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<script>
		function myPwdUpdate(){
	location.href = "<%= contextPath %>/views/myPage/user/myPwdUpdate.jsp";
};

function myPetInfo(){
	location.href = "<%= contextPath %>/myPetListServlet";
};

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

		</script>
</body>
</html>