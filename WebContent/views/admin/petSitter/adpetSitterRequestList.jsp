<!-- 관리자▶펫시터 서비스▶펫시터 신청자 목록-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, petsitter.model.vo.*"%>
<%
ArrayList<PsInfo> list = (ArrayList<PsInfo>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
  <link href="<%= request.getContextPath() %>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
#wrapper, #content-wrapper, .container-fluid.card shadow mb-4,.card-header py-3{
width:100%;}
#inner{
margin-top:2%;
width:100%;
}


/* 모달 */
        .seminor-login-modal-body .close{
 position: relative;
 top: -45px;
 left: 10px;
color: #1cd8ad;
}
.seminor-login-modal-body .close{
    opacity:0.75;
}

.seminor-login-modal-body .close:focus, .seminor-login-modal-body .close:hover {
    color: #39e8b0;
 opacity: 1;
 text-decoration: none;
 outline:0;
}

.seminor-login-modal .modal-dialog .modal-content{
    border-radius:0px;
}

/* form animation */
.seminor-login-form .form-group {
  position: relative;
  margin-bottom: 1.5em !important;
}
.seminor-login-form .form-control{
 border: 0px solid #ced4da !important;
 border-bottom:1px solid #adadad !important;
 border-radius:0 !important;
}
.seminor-login-form .form-control:focus, .seminor-login-form .form-control:active{
 outline:none !important;
 outline-width: 0;
 border-color: #adadad !important;
 box-shadow: 0 0 0 0.2rem transparent;
}
*:focus {
 outline: none;
}
.seminor-login-form{
 padding: 2em 0 0;
}

.form-control-placeholder {
position: absolute;
top: 0;
padding: 7px 0 0 13px;
transition: all 200ms;
opacity: 0.5;
border-top: 0px;
border-left: 0;
border-right: 0;
}

.form-control:focus + .form-control-placeholder,
.form-control:valid + .form-control-placeholder {
font-size: 75%;
-webkit-transform: translate3d(0, -100%, 0);
       transform: translate3d(0, -100%, 0);
opacity: 1;
}

.container-checkbox input {
 position: absolute;
 opacity: 0;
 cursor: pointer;
}
.checkmark-box {
 position: absolute;
 top: -5px;
 left: 0;
 height: 25px;
 width: 25px;
 background-color: #adadad;
}
.container-checkbox {
 display: block;
 position: relative;
 padding-left: 40px;
 margin-bottom: 20px;
 cursor: pointer;
 font-size: 14px;
 font-weight: bold;
 -webkit-user-select: none;
 -moz-user-select: none;
 -ms-user-select: none;
 user-select: none;
 line-height: 1.1;
}
.container-checkbox input:checked ~ .checkmark-box:after {
 color: #fff;
}
.container-checkbox input:checked ~ .checkmark-box:after {
 display: block;
}
.container-checkbox .checkmark-box:after {
 left: 10px;
 top: 4px;
 width: 7px;
 height: 15px;
 border: solid white;
 border-width: 0 3px 3px 0;
 -webkit-transform: rotate(45deg);
 -ms-transform: rotate(45deg);
 transform: rotate(45deg);
}
.checkmark:after, .checkmark-box:after {
 content: "";
 position: absolute;
 display: none;
}
.container-checkbox input:checked ~ .checkmark-box {
 background-color: #f58220;
 border: 0px solid transparent;
}
.btn-check-log .btn-check-login {
 font-size: 16px;
 padding: 10px 0;
}
button.btn-check-login:hover {
    color: #fff;
    background-color: #f58220;
    border: 2px solid #f58220;
}
.btn-check-login {
 color: #f58220;
 background-color: transparent;
 border: 2px solid #f58220;
 transition: all ease-in-out .3s;
}
.btn-check-login {
 display: inline-block;
 padding: 12px 0;
 margin-bottom: 0;
 line-height: 1.42857143;
 text-align: center;
 white-space: nowrap;
 vertical-align: middle;
 -ms-touch-action: manipulation;
 touch-action: manipulation;
 cursor: pointer;
 -webkit-user-select: none;
 -moz-user-select: none;
 -ms-user-select: none;
 user-select: none;
 background-image: none;
 border-radius: 0;
 width: 100%;
}
.forgot-pass-fau a {
    text-decoration: none !important;
    font-size: 14px;
}
.text-primary-fau {
    color: #1959a2;
}

.select-form-control-placeholder{
  font-size: 100%;
    padding: 7px 0 0 13px;
    margin: 0;
}

</style>
</head>
<body>
 	<%@ include file="../common/adminNavibar.jsp" %>
 	 	 	 	 	<script>
$("#main").attr('class','nav-item');
$("#user").attr('class','nav-item');
$("#adpetSitterRequestList").attr('class','collapse-item active');
$("#adpetSitterList").attr('class','collapse-item');
$("#marketad").attr('class','collapse-item');
$("#marketBuy").attr('class','collapse-item');
$("#marketCancel").attr('class','collapse-item');
$("#freeBoard").attr('class','collapse-item ');
$("#picBoard").attr('class','collapse-item ');
$("#comment").attr('class','collapse-item ');
$("#boardQnA").attr('class','collapse-item ');

</script>	
  <body id="page-top">
  <div id="inner">
        <div class="container-fluid">
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">펫시터 신청자 관리</h6>
            </div>
<form id="check" action="<%= request.getContextPath() %>/adUpdatePetsitterRequestServlet" method="post">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>	
                      <th></th>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>지원 폼 보기</th>
                      <th>승인여부</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th></th>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>지원 폼 보기</th>
                      <th>승인여부</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<%int num=1;
                  		for(PsInfo p : list){ %>
                    <tr>
                      <td><input type="checkbox" name="bId" id="bId+<%=num%>"value="<%= p.getUserNo() %>"></td>
                      <td><%=p.getUserName() %></td>
                      <td><%=p.getUserId() %></td>
                      <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#zz<%=num%>">보기</button></td>
                      <td><%=p.getApproval() %></td>
                      
                      <!-- 모달 -->
   <div class="modal fade seminor-login-modal" id="zz<%=num%>">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal body -->
                <div class="modal-body seminor-login-modal-body">
                    <button type="button" class="close" data-dismiss="modal">
                        <span><i class="fa fa-times-circle" aria-hidden="true"></i></span>
                    </button>
                    <div class="form-area">
                        <br style="clear:both">
                        <h3 style="margin-bottom: 25px; text-align: center;">펫시터 지원서</h3>
                        <div class="form-group">
                            <b>이름</b><input type="text" class="form-control" id="name" name="name" value="<%=p.getUserId() %>" disabled>
                        </div>
                        <div class="form-group">
                            <b>직업여부</b>
            <%if((p.getJob()).equals("Y")) {%>
                            유 <input type="radio" disabled checked>
                            무 <input type="radio" disabled > 
            <%} else {%>
                            유 <input type="radio"  disabled>
                            무 <input type="radio"  disabled checked>
            <%} %>                  
                            <b>반려견 유무</b>
			<%if((p.getDogChk()).equals("Y")) {%>
                            유 <input type="radio" disabled checked>
                            무 <input type="radio" disabled>
            <%} else {%>
                            유 <input type="radio" disabled>
                            무 <input type="radio" disabled checked>
            <%} %>
                        </div>
                        <div class="form-group">
                            <b>돌봄 경험</b>
                            <input type="text" class="form-control" id="subject1" name="subject" value="<%=p.getCareExp() %>회" disabled
                                required>
                                <b>관련 자격증</b>
                                <input type="text" class="form-control" id="subject1" name="subject" value="<%=p.getCertific() %>" disabled
                                required>
                        </div>
                        <div class="form-group">
                            <b>지원 동기</b>
                            <textarea class="form-control" type="textarea" id="message"  disabled 
                                rows="7"><%=p.getReason() %></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 모달끝ㅋㅋ -->   
                    </tr>
      				<% num+=1;
      				} %>
                  </tbody>
                </table>
              </div>

              <label>승인여부 변경 : </label>
              <select name="status">
				 <option value="O">승인</option>
				 <option value="X">거부</option>
 				 <option selected>---</option>
 			  </select>
				<button id="adUpdatePetsitterRequest" class="btn btn-success">변경</button>
			  </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>






	<script>
	function showView(){
		window.open("emailCheckForm.jsp", "checkForm", "width=500, height=500");
	}
	
	</script>
  <!-- Page level plugins -->
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%= request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<%= request.getContextPath() %>/resources/admin/js/demo/datatables-demo.js"></script>
  
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>