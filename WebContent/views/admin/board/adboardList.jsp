<!-- 관리자▶게시판▶일반 게시판 관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.ArrayList, board.model.vo.*"%>
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
<link
	href="<%= request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css"
	rel="stylesheet">
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

#id0 {
	width: 5%;
}

#id1 {
	width: 8%;
}

#id2 {
	width: 10%;
}

#id3 {
	width: 8%;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../common/adminNavibar.jsp"%>
<script>
$("#main").attr('class','nav-item');
$("#user").attr('class','nav-item');
$("#adpetSitterRequestList").attr('class','collapse-item');
$("#adpetSitterList").attr('class','collapse-item');
$("#marketad").attr('class','collapse-item');
$("#marketBuy").attr('class','collapse-item');
$("#marketCancel").attr('class','collapse-item');
$("#freeBoard").attr('class','collapse-item active');
$("#picBoard").attr('class','collapse-item');
$("#comment").attr('class','collapse-item');
$("#boardQnA").attr('class','collapse-item');

</script>	
	
<body id="page-top">
	<div id="inner">
		<div class="container-fluid">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">게시판 관리</h6>
				</div>
<form id="check" action="<%= request.getContextPath() %>/adBoardDeleteServlet" method="post">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th></th>
									<th>글번호</th>
									<th>작성자 ID</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성일자</th>
									<th>상태</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th>글번호</th>
									<th>작성자 ID</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성일자</th>
									<th>상태</th>
								</tr>
							</tfoot>
							<!-- 글 목록 뽑아내기 -->
							<tbody>
								<% int num=1; 
								for(Board b : list){  %>
								<tr>
								 <td><input type="checkbox" name="bId" id="bId+<%=num%>"value="<%= b.getBoardNo() %>"></td>
									<td id="id1"><%=b.getBoardNo() %></td>
									<td id="id2"><%=b.getUserName() %></td>
									<td><%=b.getTitle() %></td>
									<td id="id3"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#zz<%=num%>">읽기</button></td>
									<td><%=b.getEnrollDate() %></td>
									<td><%=b.getStatus() %></td>
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
                        <h3 style="margin-bottom: 25px; text-align: center;">게시글 상세 보기</h3>
                        <div class="form-group">
                            <b>글쓴이</b><input type="text" class="form-control" id="name" name="name" value="<%=b.getUserName() %>" disabled>
                            
                        </div>
                        <div class="form-group">
                        <b>작성 날짜</b><input type="text" class="form-control" id="name" name="name" value="<%=b.getEnrollDate() %>" disabled>
                        </div>
                        <div class="form-group">
                            <b>제목</b>
                            <input type="text" class="form-control" id="subject1" name="subject" value="<%=b.getTitle()%>" disabled>
                        </div>
                        <div class="form-group">
                            <b>내용</b>
                            <textarea class="form-control" type="textarea" id="message"  disabled 
                                rows="7"><%=b.getContent() %></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 모달끝ㅋㅋ -->   
								
								
								</tr>
								<%num+=1;} %>
							</tbody>
						</table>
					</div>
					<form>
						<label>글 상태 변경 : </label>
						<!-- 글 상태 변경하기 (정상 게시, 삭제) -->
       			       <select name="status">
							<option value="Y">정상</option>
							<option value="N">삭제됨</option>
							<option selected>---</option>
						</select>	
						<button id="adBoardDelete" class="btn btn-success">변경</button>
					</form>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	</div>
	</div>
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
</body>
</html>