<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int psBoardNo = Integer.parseInt(request.getParameter("psbNo"));
	int commentNo = 0;
	if(request.getParameter("commentNo") != null){
		commentNo = Integer.parseInt(request.getParameter("commentNo"));
	}
	System.out.println(psBoardNo);
	System.out.println(commentNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	padding:15px;
}
textArea{
	width:100%;
	height:200px;
	margin-top:25px;
	resize:none;
}
#print{
	margin-top:5px;
	margin-bottom:5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<form action="<%=request.getContextPath()%>/InsertReply" method="post" onsubmit="return checkValidate()">
		<p style="text-align:center;">펫시터 리뷰</p>
		<div>
		1 &nbsp;&nbsp;<input name="score" id="score" style="width:90%; height:100%;" type="range" min="1" max="5" onchange="getScore()">&nbsp;&nbsp;5
		</div>
		<p id="print"></p>
		<textarea name="comment" id="comment" placeholder="댓글을 입력하세요."></textarea>
		<input type="text" name="psBoardNo" style="display:none;" value="<%= psBoardNo %>">
		<%if(commentNo!=0) {%>
			<input type="text" name="commentNo" style="display:none;" value="<%= commentNo %>">			
		<%} %>
		<button>작성하기</button>
	</form>
	<script>
		function getScore(){
			console.log($("#score").val());
			var score = $("#score").val();
			$("#print").val(score+"점");
			$("#print").text(score+"점");
		}
		function checkValidate(){
			if($("#print").val() == ""){
				alert("점수를 입력해주세요.");
				return false;
			}
			if($("#comment").val()==""){
				alert("댓글을 입력해주세요.");
				return false;
			}
		}
	</script>
</body>
</html>