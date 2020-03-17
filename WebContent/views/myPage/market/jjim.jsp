<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, myPage.jjim.model.vo.* , common.model.vo.*"%>
	<%
	
	ArrayList<jjim> list =(ArrayList<jjim>)request.getAttribute("list");
	ArrayList<IMG> flist = (ArrayList<IMG>)request.getAttribute("flist");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<!-- Bootstrap core CSS -->
<link
	href="<%= request.getContextPath() %>/resources/market/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%= request.getContextPath() %>/resources/market/css/agency.min.css"
	rel="stylesheet">
<style>
#img1 {
	width: 100%;
	height: 100%;
}

#test1:hover {
	opacity: 0.5;
}

.searchArea {
	float: right;
	width: 300px;
}

/* 정렬폼 */
        #ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        #ul>.li {
            float: left;
        }
        .li a {
            text-decoration: none;
            font-weight: bold;
            color: gray;
            display: block;
            text-align: center;
            padding: 10px;
        }
        
        
.container2 {
	margin-top: 2%; width : 100%;
	margin-bottom: 10%;
}

.tableArea{
width:70%;
padding:1%;
margin-left:7%;
margin-top:1%;
}

#a{
text-align:right;
}
*{
font-size:11pt;
}
#b{
text-align:center;
margin:10%;
}
</style>
</head>
		<%@ include file="../common/mpNavibar.jsp"%>

<body >


		
<div class="tableArea">
	<section class="page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">장  바  구  니</h2>
					<h3 class="section-subheading text-muted">구매는 상세페이지에서 해주세요!</h3>
					<!-- ========== -->
				</div>
			</div>

			<hr>
			<form id="check" action="<%= request.getContextPath() %>/mpJjimDeleteServlet" method="post">
		   <div id="a"><button>삭제</button>&nbsp;&nbsp;&nbsp;</div>
		   <div class="row">
			<%if(!(list.isEmpty())) {%>
							<% for(jjim pb : list){ %>
				<!-- ==============================상품============================== -->
				<div class="col-md-4 col-sm-6 portfolio-item">
						<div class="portfolio-hover-content">
							<i class="fas fa-plus fa-3x"></i>
						</div> 
						<input type="checkbox" name="jjimList" value="<%=pb.getJjimNo()%>">
					<% for(IMG at : flist){ %>
						<% if(pb.getProductNo() == at.getProductNo()){ %>
						<a href="<%= request.getContextPath() %>/ProductBoardDetailServlet?product_No=<%=pb.getProductNo()%>">
						<img class="img-fluid" src="<%= request.getContextPath() %>/resources/productBoard/<%= at.getChangeName() %>" id="test1">
						</a>
							<% } %>
						<% } %>
					<div class="portfolio-caption">
						<h6><%=pb.getProductName() %></h6>
						<p class="text-muted"><%=pb.getPrice() %> 원</p>
					</div>
				</div>
							<% } %>
							<%}else{ %><p id="b">장바구니에 담긴 상품이 없습니다!</p><%} %>
							</form>
							</div>
				<!-- ===================================================== -->
			
			</div>
		</div>
</section></div></div></div></div></div></div>

	<%@ include file="../../common/footer.jsp"%>
</body>
		
</html>