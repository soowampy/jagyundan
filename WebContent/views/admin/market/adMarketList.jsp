<!-- 관리자▶마켓▶상품 목록 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, productBoard.model.vo.*"%>
    <%
	ArrayList<ProductBoard> plist = (ArrayList<ProductBoard>)request.getAttribute("plist");
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
 	 	 	 	<script>
$("#main").attr('class','nav-item');
$("#user").attr('class','nav-item');
$("#adpetSitterRequestList").attr('class','collapse-item');
$("#adpetSitterList").attr('class','collapse-item');
$("#marketad").attr('class','collapse-item active');
$("#marketInsert").attr('class','collapse-item ');
$("#marketBuy").attr('class','collapse-item');
$("#marketCancel").attr('class','collapse-item');
$("#freeBoard").attr('class','collapse-item ');
$("#picBoard").attr('class','collapse-item ');
$("#comment").attr('class','collapse-item ');
$("#boardQnA").attr('class','collapse-item ');

</script>	
 	<body id="page-top">
  <!-- Page Wrapper -->
  <div id="inner">
        <div class="container-fluid">
          <!-- Page Heading -->

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
              <form action="<%= request.getContextPath() %>/ProductAdminStatusServlet" method="post">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">판매 관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>상품번호</th>
                      <th>카테고리</th>
                      <th>상품명</th>
                      <th>가격</th>
                      <th>상태</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th></th>
                      <th>상품번호</th>
                      <th>카테고리</th>
                      <th>상품명</th>
                      <th>가격</th>
                      <th>상태</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  <!-- 상품 리스트 뽑아내기 -->
                  <% for(ProductBoard pb : plist){ %>
                    <tr>
                      <td id="id0"><input type="checkbox" name="product_No" value="<%= pb.getProductNo() %>"></td>
                      <td id="id1"><%= pb.getProductNo() %></td>
                      <td id="id2"><%= pb.getProductCate() %></td>
                      <td ><%= pb.getProductName() %></td>
                      <td id="id3"><%= pb.getPrice() %>원</td>
                      <td>
                      
                      <%if( pb.getStatus().equals("Y")){ %>
                      	판매중
                      <%}else{ %>
                      	품절
                      <%} %>
                      </td>
                    </tr>
      				<%} %>
                  </tbody>
                </table>
              </div>
              <!-- 상품 상태 변경 : 판매중 / 품절 -->
	              <label>상태 변경 : </label>
	              <select name="status">
					 <option value="Y">판매중</option>
					 <option value="N">품절</option>
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