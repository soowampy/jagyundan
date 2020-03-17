<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<style>
#main{
marign-bottom:15%;
text-align:center;
            font-weight: 700;
            font-size:35px;
}
</style>
</head>
<body>
 	<%@ include file="common/adminNavibar.jsp" %>

<body>
<div class="container">
<br>
<hr>
	<div id="main"><img src="<%= request.getContextPath() %>/resources/image/admindog.jpg"
								 alt="" width="100%" height="100%"/><br><br>관 리 자 페 이 지</div><br>
								
         
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
</div>
</div>
        

</body>
</html>