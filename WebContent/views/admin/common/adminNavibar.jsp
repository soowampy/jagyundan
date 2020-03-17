<!-- 관리자 화면 좌측 네비바 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String contextPath = request.getContextPath();
	String msg = (String)session.getAttribute("msg1");
%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>자견단</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- Custom fonts for this template-->

  <link href="<%= request.getContextPath() %>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%= request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<style>
/* *{
font-size:9pt;
} */
#accordionSidebar{
  background-color: rgb(127, 194, 127);
  
}

</style>
<body>

  <div class= "container2">
  <div id="wrapper">
    <!-- 네비바 시작 -->
    <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- -->
      <li class="nav-item" id="main">
        <a class="nav-link" href="<%= request.getContextPath() %>/views/admin/adminMain.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>관리자 페이지</span></a>
      </li>
      
      <hr class="sidebar-divider">
    <!-- 회원 관리-->      
      <li class="nav-item" id="user">
        <a class="nav-link" href="<%= request.getContextPath() %>/adminUserServlet">
                    <i class="fas fa-fw fa-table"></i>
          <span>회원 관리</span></a>
      </li>

    <!-- 펫시터 관리  ▶ 신청자 관리, 펫시터 관리-->
      <li class="nav-item" id="pet">
        <a class="nav-link collapsed" href="#" 
        id="petNav" 
        data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>펫시터 관리</span>
        </a>
        <div id="collapseUtilities" class="collapse show" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%= request.getContextPath() %>/adpetSitterRequestServlet" id="adpetSitterRequestList">신청자 관리</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/adminPetsitterListServlet" id="adpetSitterList">펫시터 관리</a>
          </div>
        </div>
      </li>

    <!-- 마켓 관리 ▶ 판매 관리, 판매 물품 작성, 주문 취소 내역-->
      <li class="nav-item" id="market">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>마켓 관리</span>
        </a>
        <div id="collapsePages" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%= request.getContextPath() %>/ProductAdminListServlet" id="marketad">판매 관리</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/views/admin/market/ProductBoardInsert.jsp" id="marketInsert">판매 물품 작성</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/ProductAdminBuyListServlet" id="marketBuy">주문 내역</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/RefundSelectServlet"  id="marketCancel">주문취소 내역</a>

          </div>
        </div>
      </li>

    <!-- 게시판 관리 ▶ 일반 게시판 관리, 사진 게시판 관리, 댓글 관리, 1:1 문의 관리-->
      <li class="nav-item" id="board">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>게시판 관리</span>
        </a>
        <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<%= request.getContextPath() %>/adBoardListServlet" id="freeBoard">일반 게시판 관리</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/adIMGBoardListServlet" id="picBoard">반려견 스토리 게시판 관리</a>
            <a class="collapse-item" href="<%= request.getContextPath() %>/adQnaListServlet" id="boardQnA">1:1 문의 관리</a>
          </div>
        </div>
      </li>
      <hr class="sidebar-divider d-none d-md-block">
    </ul>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/vendor/chart.js/Chart.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/demo/chart-area-demo.js"></script>
  <script src="<%= request.getContextPath() %>/resources/admin/js/demo/chart-pie-demo.js"></script>
</body>

</html>
