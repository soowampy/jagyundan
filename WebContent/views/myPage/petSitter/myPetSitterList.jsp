<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"	import="java.util.ArrayList, petsitter.model.vo.*, java.util.Calendar, java.text.SimpleDateFormat"%>
<%

ArrayList<Reservation> rlist = (ArrayList<Reservation>)request.getAttribute("list");

Calendar cToday = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
int today = Integer.parseInt(sdf.format(cToday.getTime()));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<style>
.container2 {

	margin-top: 2%; width : 100%;

}

.mpinner {


}

*{
font-size:11pt;
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

</style>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body>

		<%@ include file="../common/mpNavibar.jsp"%>

		
<div class="tableArea">
<h3>펫시터 이용내역</h3><br>
    <table class="table table-hover" >
    <thead>
        <tr><!-- 예약번호 클릭하면 상세페이지로이동 -->
            <th>예약번호</th>
            <th>시작 날짜</th><!-- 예약날짜~종료날짜로 표기 -->
            <th>종료 날짜</th>
            <th>진행 상태</th>
            <th>후기 작성</th>
        </tr>
       </thead>
        <tr>
        				<%if(!(rlist.isEmpty())) {%>
					<%
					for(Reservation r : rlist) {%>
		            <td><%=r.getReservNO() %></td>
		            <td><%=r.getStartDate() %></td>
		            <td><%=r.getEndDate() %></td>
		            <td>
			            <%if(Integer.parseInt(r.getEndDate())>today) {%>
			            	진행 전
			            <%}else if(Integer.parseInt(r.getEndDate())<today){ %>
			            	완료
			            <%}else if((Integer.parseInt(r.getEndDate())>today && (Integer.parseInt(r.getEndDate())<today))){ %>
			            	진행 중
			            <%} %>
		            </td>
           			 <td><a href="SelectPsBoardListDetail?psb=<%= r.getPsBoardNum() %>">작성하러 가기</a></td>
  					 <%} %>
					<%}else{%>
							<td>예약 내역이 없습니다!</td>
					<%}%>
        </tr>
    </table><br>
    
</div>
				</div>			
		</div></div>
	</div>
	</div>
	</div>

	<%@ include file="../../common/footer.jsp"%>
</body>
</html>