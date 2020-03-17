<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 30%;
  margin:1%;
  text-align:center;
}

/* Add padding to container elements */
.containerb {
  padding: 50px;
  margin:1%;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-contentb {
  background-color: #fefefe;
  margin: 10% auto 20% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid rgba(173, 173, 173, 0.582);
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
  =
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}

#psw,#newpsw,#newpsw-repeat{
width:70%;
}
.clearfix{
text-algin:center;
margin-left:10%;
margin-right:10%;
}
</style>


</head>
<body>
 	<%@ include file="../../common/menubar.jsp" %>
 	<div class="container">
<div id="id01">

<form id="updatePwdForm" class="modal-contentb" action="<%= request.getContextPath() %>/updatePwd" method="post" onsubmit="return checkPwd();">
    <div class="containerb">
      <h1>비밀번호 변경</h1>
      <hr>
      <label for="psw"><b>기존 비밀번호</b></label><br>
      <input type="password" name="userPwd"  id="psw" maxlength="15">
		<br>
      <label for="psw-repeat"><b>변경할 비밀번호</b></label><br>
      <input type="password" name="newPwd"  id="newpsw" maxlength="15">
<br>
      <label for="psw-repeat"><b>비밀번호 확인</b></label><br>
      <td><input type="password" name="newPwd2"  id="newpsw-repeat" maxlength="15">
      <br><br><br>
      <div class="clearfix">
       <button type="button" onclick="" id="cancelbtn" class="cancelbtn">뒤로 가기</button>
       <button id="updatePwdBtn"  class="signupbtn">변경하기</button>
      </div>
    </div>
  </form>
</div>
</div>
	<script>
		function checkPwd(){
			var userPwd = $("#psw");
			var newPwd = $("#newpsw");
			var newPwd2 = $("#newpsw-repeat");
			
			// 1. input 태그(3개) 안에 값이 없으면 return false
			if(userPwd.val().trim() == "" || newPwd.val().trim() == "" || newPwd2.val().trim() == ""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			// 2. 비밀번호와 확인란의 값의 다르면 return false
			if(newPwd.val() != newPwd2.val()){
				alert("비밀번호가 다릅니다.");
				newPwd2.select();
				return false;
			} 
			
			// 둘 다 통과하면 return true;
			return true;
			
		}
	
	
	</script>
</body>
</html>