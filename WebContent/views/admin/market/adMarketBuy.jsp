<!-- 관리자▶마켓▶주문 내역 관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, purchase.model.vo.*"%>
    <%
	ArrayList<Purchase> list = (ArrayList<Purchase>)request.getAttribute("list");
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
<style>
#wrapper, #content-wrapper, .container-fluid.card shadow mb-4,.card-header py-3{
width:100%;}
#inner{
margin-top:2%;
width:100%;
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
$("#marketBuy").attr('class','collapse-item active');
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
              <h6 class="m-0 font-weight-bold text-primary">주문 관리</h6>
            </div>

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>주문번호</th>
                      <th>상품번호</th>
                      <th>구매자 이름</th>
                      <th>주소</th>
                      <th>연락처</th>
                      <th>수량</th>
                      <th>결제 금액</th>
                      <th>구매일</th>
                      <th>운송장번호</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>주문번호</th>
                      <th>상품번호</th>
                      <th>구매자 이름</th>
                      <th>주소</th>
                      <th>연락처</th>
                      <th>수량</th>
                      <th>결제 금액</th>
                      <th>구매일</th>
                      <th>운송장번호</th>
                    </tr>
                  </tfoot>
                 <!-- 주문 내역 목록 뽑아내기 -->
                  <tbody>
                  <%int num=1; 
                  for(Purchase p : list){ %>
                    <tr>
                      <td><%=p.getBuy_no() %></td>
                      <td><%=p.getProduct_no() %></td>
                      <td><%=p.getGet_people() %></td>
                      <td><%=p.getGet_where() %></td>
                      <td><%=p.getGet_phone() %></td>
                      <td><%=p.getAmount() %></td>
                      <td><%=p.getPrice() %></td>
                      <td><%=p.getBuy_date() %></td>
                      <td><%if(p.getBox_num().equals("N")) {%>
                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#zz<%=num%>">입력하기</button>
                      <%}else {%>
                      	<%=p.getBox_num() %>
                      <%} %>
                      </td>

                    </tr>
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
                        <h3 style="margin-bottom: 25px; text-align: center;">운송장번호 등록</h3>
                        <div class="form-group">
                        <form id="check" action="<%= request.getContextPath() %>/adMarketBuyInsertBox" method="post">
                            <input type="hidden" name="buyNo" value="<%=p.getBuy_no() %>">
                            <input type="text" name="boxNum">
                            <button>등록</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 모달끝ㅋㅋ --> 
      				<%num+=1;} %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/demo/datatables-demo.js"></script>
</body>
</html>