<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, user.model.vo.*"%>
<%
ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link
	href="<%= request.getContextPath() %>/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="<%= request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="<%= request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<style>
#wrapper, #content-wrapper, .container-fluid.card shadow mb-4,
	.card-header py-3 {
	width: 100%;
}

#inner {
	margin-top: 2%;
	width: 100%;
}
</style>

</head>
<body>
	<%@ include file="../common/adminNavibar.jsp"%>
<script>
$("#main").attr('class','nav-item');
$("#user").attr('class','nav-item active');
$("#market").attr('class','nav-item');
$("#petNav").attr('class','nav-link');
$("#pet").attr('class','nav-item');

$("#petRequest").attr('class','collapse-item');
$("#petSitter").attr('class','collapse-item');
$("#collapseUtilities").attr('class','collapse');
</script>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="inner">
		<div class="container-fluid">

			<!-- Page Heading -->

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">회원 관리</h6>
				</div>
<form id="check" <%-- action="<%= request.getContextPath() %>/updateUserServlet" --%> method="post">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">		
							<thead>
								<tr>
									<th></th>
									<th>ID</th>
									<th>이름</th>
									<th>성별</th>
									<th>주소</th>
									<th>이메일</th>
									<th>반려견 수</th>
									<th>전화번호</th>
									<th>생년월일</th>
									<th>탈퇴여부</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th>ID</th>
									<th>이름</th>
									<th>성별</th>
									<th>주소</th>
									<th>이메일</th>
									<th>반려견 수</th>
									<th>전화번호</th>
									<th>생년월일</th>
									<th>탈퇴여부</th>
								</tr>
							</tfoot>
							<tbody>
                  	<%int num=1;
                  		for(User u : list){ %>
								<tr>
									<td><input type="checkbox" name="bId" value="<%= u.getUserNo() %>"></td>
									<td><%=u.getUserId() %></td>
									<td><%=u.getUserName() %></td>
									<td><%=u.getGender() %></td>
									<td><%=u.getAddress() %></td>
									<td><%=u.getEmail() %></td>
									<td><%=u.getdogSu() %></td>
									<td><%=u.getPhone() %></td>
									<td><%=u.getBirth() %></td>
									<td><%=u.getAdmin() %></td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>			
					<label>회원 탈퇴여부 변경 : </label> 
					<select name="status">	
						<option value="N">N(탈퇴됨)</option>
						<option value="Y">Y(정상)</option>
						<option selected>---</option>
					</select>&nbsp;&nbsp;
<!-- 					<button id="UpdateUserInfo" class="btn btn-success">변경</button>&nbsp; 
					<button class="btn btn-primary" type="button" onclick="checkMail();">메일발송하기</button>
 -->
 
 
 <!-- 메일전송 모달 -->
   <div class="modal fade seminor-login-modal" id="zz">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal body -->
                <div class="modal-body seminor-login-modal-body">
                    <button type="button" class="close" data-dismiss="modal">
                        <span><i class="fa fa-times-circle" aria-hidden="true"></i></span>
                    </button>
                    <div class="form-area">
                        <div class="form-group">
                            <b>제목</b>
                            <input type="text" name="title"></input>
                        </div>
                        <div class="form-group">
                            <b>답변</b>
                            <textarea class="form-control" type="textarea" id="message"  name="content"
                                rows="10"></textarea>
                                <br>
                            <input type="submit" formaction="<%= request.getContextPath() %>/adUsermailServlet" value="메일 전송">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <!-- ㅋㅋ -->
 
 
<input type="submit" formaction="<%= request.getContextPath() %>/updateUserServlet"  value="변경">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#zz">메일 전송</button>

					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					

	</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>


	<script>

function checkMail(){

}
</script>


	<script
		src="<%= request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%= request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%= request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="<%= request.getContextPath() %>/resources/admin/js/demo/datatables-demo.js"></script>

</body>
</html>