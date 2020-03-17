<!-- 관리자▶게시판▶댓글 관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
  <link href="<%= request.getContextPath() %>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="<%= request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style>
#wrapper, #content-wrapper, .container-fluid.card shadow mb-4,.card-header py-3{
width:100%;}
#inner{
margin-top:2%;
width:100%;
}
#id0{
width:5%;
}
#id1{
width:8%;
}

#id2{
width:10%;
}
#id3{
width:8%;
text-align:center;
}
</style>
</head>
<body>
 	<%@ include file="../common/adminNavibar.jsp" %>
 	<script>
$("#main").attr('class','nav-item');
$("#user").attr('class','nav-item');
$("#adpetSitterRequestList").attr('class','collapse-item');
$("#adpetSitterList").attr('class','collapse-item');
$("#marketad").attr('class','collapse-item');
$("#marketBuy").attr('class','collapse-item');
$("#marketCancel").attr('class','collapse-item');
$("#freeBoard").attr('class','collapse-item ');
$("#picBoard").attr('class','collapse-item');
$("#comment").attr('class','collapse-item active');
$("#boardQnA").attr('class','collapse-item');

</script>	
 	<body id="page-top">
  <div id="inner">
        <div class="container-fluid">
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">댓글 관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>댓글번호</th>
                      <th>게시판 분류</th>
                      <th>작성자 ID</th>
                      <th>내용</th>
                      <th>작성일자</th>
                      <th>상태</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th></th>
                      <th>댓글번호</th>
                      <th>게시판 분류</th>
                      <th>작성자 ID</th>
                      <th>내용</th>
                      <th>작성일자</th>
                      <th>상태</th>
                    </tr>
                  </tfoot>
                  <!-- 댓글 목록 뽑아내기 -->
                  <tbody>
                  <%for(int i=1; i<100; i++){ %>
                    <tr>
                      <td id="id0"><input type="checkbox"></td>
                      <td id="id1"><%=i %></td>
                      <td id="id2">일반 게시판</td>
                      <td id="id2">ccaa1111</td>
                      <td>어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고어쩌쩌고ㅋㅋ</td>
                      <td>2011/04/25</td>
                      <td id="id3">정상</td>
                    </tr>
      				<%} %>
                  </tbody>
                </table>
              </div>  <form>
              <label>댓글 상태 변경 : </label>
              <!-- 댓글 상태 변경하기 (정상 게시, 삭제) -->
              <select>
				 <option value="ok">정상</option>
				 <option value="no">삭제됨</option>
 				 <option selected>---</option>
 			  </select>
				<input type="submit" value="변경">
			  </form>
            </div>
          </div>
        </div>
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