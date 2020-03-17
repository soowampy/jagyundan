<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = (String)request.getAttribute("code");
	String email="";
	if((String)request.getAttribute("email")!=null){
		email = (String)request.getAttribute("email");
	}
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function idValue(){
	var code=<%=code%>;
} 

var msg = "<%= msg %>";
$(function(){
	if(msg != "null"){
		alert(msg);
		<% session.removeAttribute("msg"); %>
	}
});
</script>
<style>

body{
margin-left:15%;
margin-top:10%;
}
</style>
<title>Insert title here</title>
</head>
<body onload="idValue();">

<b>이메일 인증하기</b><br>
	<form action="<%= request.getContextPath() %>/emailCheckServlet" id="emailCheckForm" method="post">
		<input type="email" id="emailCheck" name="emailCheck" value="<%=email%>">
		<input type="submit" value="인증하기" id="aaa" onsubmit="return joinValidate();">
	</form>

		<b>인증번호 입력</b><br>
		<input type="text" id="checkCode">
		<button onclick="check();">인증확인!</button>
		
		<script>
			var v3 = document.getElementById("checkCode").value;
			function check(){
				var v1 ="<%=code%>"; 
				var v3 = document.getElementById("checkCode").value;
				if(v1!=v3){
					alert('인증번호가 다릅니다!');
				}else{
					alert('인증되었습니다!');
					opener.document.joinForm.email.value = document.getElementById("emailCheck").value;
					opener.document.joinForm.email.setAttribute("readonly", "readonly");
					
					
					var v4="<%=email%>";
					$(".emailcheck0", opener.document).remove();
					$("#emailcheck1", opener.document).remove();
					$("#email", opener.document).append("<input name='email' class='emailcheck' id='text' value='" +v4+ "' type='text' readonly>");
					$("#email", opener.document).append("인증완료");
					self.close();
				}
			}
			
<%-- 			
			function joinValidate(){
				var isUsable = false;
				// 아이디 중복 시 false, 아이디 사용 가능 시 true -> 나중에 유효성 검사
		            var userId = $("#emailCheckForm input[name='emailCheck']");
					if(!userId || userId.val().length < 4){
		                alert("정확한 이메일을 입력해주세요");
						userId.focus();
					}else{
						// ajax로 중복 여부 확인
						$.ajax({
		                    url : "<%=request.getContextPath()%>/emailCheckServlet",
							type : "post",
							data : {userId:userId.val()},
							success : function(data){
								if(data == "fail"){
									alert('사용할 수 없는 아이디입니다.');
									userId.focus();
								}else{
									if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
										userId.prop('readonly', true); 
										// -> 더 이상 userId에 값 입력해서 변경할 수 없도록
										isUsable = true;
										// -> 사용 가능하다는 flag 값
									}else{
										userId.focus();
									}
								}
								if(isUsable){
									// 아이디 중복 체크 후 사용 가능한 아이디이며 사용하기로 한 경우
									// 회원가입 버튼 활성화
									$("#joinBtn").removeAttr("disabled");
								}
							},
							error : function(){
								console.log('서버 통신 안됨');
		                    }
		                });
		            }
		        } --%>
		</script>
</body>
</html>