<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, myPage.report.model.vo.*"%>
<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
int num=0; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>자견단</title>
<style>
.container2 {

	margin-top: 2%; width : 100%;
}

.mpinner {


}



.tableArea{
width:70%;
padding:1%;
margin-left:7%;
margin-top:1%;
}

table{
            text-align:center;
}

*{
font-size:11pt;
}

#btnbtn{
    background-color:rgba(255, 255, 255, 0);
    border:0;
    outline:0;
}
</style>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body>

		<%@ include file="../common/mpNavibar.jsp"%>

		
<div class="tableArea">
<h3>1:1 문의내역</h3><br>
    <table class="table table-hover" id="listArea">
    <thead>
        <tr><!-- 예약번호 클릭하면 상세페이지로이동 -->
            <th>신고번호</th>
            <th>문의 유형</th><!-- 예약날짜~종료날짜로 표기 -->
            <th>제목</th>
            <th>등록일</th>
            <th>상태</th>
        </tr>
       </thead>
               <% if(list.isEmpty()){ %>
               <tr>
               <td colspan="4">등록된 문의글이 없습니다!</td>
               </tr>
				 <%} else { %>
				 						 <% for(Report r : list) {%>
        <tr>
        <form action="<%= request.getContextPath() %>/reportDetailServlet" method="post">
			<input type="hidden" name="reportNo" value="<%=r.getReportNo() %>">
            <td><%=num+1%></td>
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
            <td><button id="btnbtn"><%=r.getTitle() %></button></td>
            <td><%=r.getwDate() %></td>
            <%if(r.getAdmin().equals("N")){ %>
            <td>답변 대기중</td>
            <%}else if(r.getAdmin().equals("Y")){ %>
            <td>답변 완료</td>
            <%} %>
                    </form>
        </tr> <% num=num+1;%>
						 <% } %>
					 <% } %>
   
    </table><br>
    <button onclick="insertReport()" type="button">문의하기</button>
</div>
				</div>			
		</div></div>
	</div>
	</div>
	</div>

	<%@ include file="../../common/footer.jsp"%>
	<script>
	function insertReport(){
		location.href = '<%= request.getContextPath() %>/views/myPage/report/myReportInsert.jsp';
	}
	

	</script>

</body>
</html>