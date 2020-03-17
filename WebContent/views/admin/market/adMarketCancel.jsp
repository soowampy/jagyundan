<!-- 관리자▶마켓▶취소 내역 관리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   import="java.util.ArrayList, purchase.model.vo.*" %>
    <%
	ArrayList<ProductPurchase> plist = (ArrayList<ProductPurchase>)request.getAttribute("plist");
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
<body id="page-top">
  <div id="inner">
        <div class="container-fluid">
          <div class="card shadow mb-4">
          <form action="<%= request.getContextPath() %>/RefundUpdateServlet" method="post">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">취소 관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                    <th></th>
                      <th>주문번호</th>
                      <th>구매자</th>
                      <th>상품이름</th>
                      <th>수량</th>
                      <th>환불금액</th>
                      <th>구매날짜</th>
                      <th>운송장번호</th>
                      <th>처리상황</th>
                    </tr>
                  </thead>
                 <!-- 취소 내역 목록 뽑아내기 -->
                  <tbody>
			   <% for(ProductPurchase pb : plist){ %>
                    <tr>
                     <td id="id0"><input type="checkbox" name="buy_no" value="<%= pb.getBuy_no() %>"></td>
                      <td ><%= pb.getBuy_no() %></td>
                      <td><%= pb.getUser_name() %></td>
                      <td><%= pb.getProduct_name() %></td>
                      <td><%= pb.getAmount() %></td>
                      <td><%= pb.getPrice() %>원</td>   
                      <td><%= pb.getBuy_date() %></td> 
                      <td><%= pb.getBox_num() %></td>
                      <% if(pb.getRefund().equals("Y")) {%>
                      <td>진행중</td>
                      <%}else { %>
                      <td>환불완료</td>
                      <%} %>
                    </tr>
      				<%} %>
                  </tbody>
                </table>
              </div>
	              <label>처리상황 변경 : </label>
             	<!-- 처리 여부 변경하기 (완료, 처리중) -->
	              <select name="status">
					 <option value="O">환불완료</option>
					 <option value="Y">진행중</option>
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

  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/demo/datatables-demo.js"></script>
</body>
</html>