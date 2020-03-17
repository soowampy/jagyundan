<!-- 관리자▶게시판▶질문 게시판 관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, myPage.report.model.vo.*"%>
    <%
ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("adReportlist");
%>
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
$("#picBoard").attr('class','collapse-item ');
$("#comment").attr('class','collapse-item ');
$("#boardQnA").attr('class','collapse-item active');

</script>	
 	<body id="page-top">
  <div id="inner">
        <div class="container-fluid">
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">문의 게시판 관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>신고 번호</th>
					  <th>회원 번호</th>
                      <th>신고 유형</th>
                      <th>제목</th>
                      <th>글 읽기</th>
                      <th>처리 여부</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th></th>
                      <th>신고 번호</th>
                      <th>회원 번호</th>
                      <th>제목</th>
                      <th>신고 유형</th>
                      <th>글 읽기</th>
                      <th>처리 여부</th>
                    </tr>
                  </tfoot>
                  <!-- 글 목록 뽑아내기 -->
                  <tbody>
					<% int num=1; 
					for(Report r : list) {%>
                    <tr>
                      <td id="id0"><input type="checkbox"></td>
                      <td ><%=r.getReportNo() %></td>                      
                      <td><%=r.getUserNo() %></td>
            <%if(r.getSingo()==1) {%>
            <td>불량 유저 신고</td>
            <%}else if(r.getSingo()==2){ %>
            <td>불량 펫시터 신고</td>
            <%}else if(r.getSingo()==3) {%>
            <td>상품 문의</td>
            <%}else if(r.getSingo()==4) {%>
            <td>배송 문의</td>
            <%}else if(r.getSingo()==5) {%>
            <td>주문/결제 문의</td>
            <%} %>
            <td><%=r.getTitle() %></td>

                      <td id="id3"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#zz<%=num%>">읽기</button></td>
            <%if(r.getAdmin().equals("N")){ %>
            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#xx<%=num%>">답변달기</button></td>
            <%}else if(r.getAdmin().equals("Y")){ %>
            <td>답변 완료</td>
            <%} %>
<!-- 글 내용 읽기 모달 -->
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
                        <h3 style="margin-bottom: 25px; text-align: center;">1:1 문의 내역</h3>
                        <div class="form-group">
                            <b>회원 번호</b><input type="text" class="form-control" id="name" name="name" value="<%=r.getUserNo() %>" disabled>
                        </div>
                        <div class="form-group">
                            
                        </div>
                        <div class="form-group">
                            <b>제목</b>
                            <input type="text" class="form-control" id="subject1" name="subject" value="<%=r.getTitle() %>" disabled
                                required>
                                <b>신고 유형</b>
                                <input type="text" class="form-control" id="subject1" name="subject" value="<%if(r.getSingo()==1) {%>불량 유저 신고<%}else if(r.getSingo()==2){ %>불량 펫시터 신고
            <%}else if(r.getSingo()==3) {%>상품 문의<%}else if(r.getSingo()==4) {%>배송 문의<%}else if(r.getSingo()==5) {%>주문/결제 문의<%} %>" disabled
                                required>
                        </div>
                        <div class="form-group">
                            <b>내용</b>
                            <textarea class="form-control" type="textarea" id="message"  disabled 
                                rows="7"><%=r.getReason() %></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 모달끝ㅋㅋ -->   
   <div class="modal fade seminor-login-modal" id="xx<%=num%>">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal body -->
                <div class="modal-body seminor-login-modal-body">
                    <button type="button" class="close" data-dismiss="modal">
                        <span><i class="fa fa-times-circle" aria-hidden="true"></i></span>
                    </button>
                    <div class="form-area">
                        <div class="form-group">
                            <b>내용</b>
                            <textarea class="form-control" type="textarea" id="message"  disabled 
                                rows="5"><%=r.getReason() %></textarea>
                        </div>
                        <div class="form-group">
                            <form id="check" action="<%= request.getContextPath() %>/adQnAReply" method="post">
                            <input type="hidden" name="reportNo" value="<%=r.getReportNo() %>">
                            <b>답변</b>
                            <textarea class="form-control" type="textarea" id="message"  name="reply"
                                rows="10"></textarea>
                                <br>
                            <button>등록하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                  				<% num+=1; %>
                    </tr>
      				<%} %>
                  </tbody>
                </table>
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