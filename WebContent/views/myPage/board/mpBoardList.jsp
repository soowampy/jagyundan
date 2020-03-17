<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
	<%
	
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	%>
<%
	int dogsu=0;

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

  #h{
            font-weight: 700;
            font-size:30px;
  }
</style>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

		<%@ include file="../common/mpNavibar.jsp"%>

		
<div class="tableArea">
<div id="h">내가 쓴 글</div><br>
<div id="formwrap">
    <table class="table table-hover" >
    <thead>
        <tr><!-- 예약번호 클릭하면 상세페이지로이동 -->
            <th>글번호</th><!-- 예약날짜~종료날짜로 표기 -->
            <th>카테고리</th>
            <th>글제목</th>
            <th>작성일자</th>
        </tr>
       </thead>
       <%if(!(list.isEmpty())){
for(Board b : list){  %>
        <tr>	<%if(b.getCategory()==1){ %>
            			<input type="hidden" class="bNo" value="<%=b.getBoardNo() %>">
            	<%}else {%>
            	            			<input type="hidden" class="pNo" value="<%=b.getBoardNo() %>">
            	<%} %>
            <td><%=b.getBoardNo() %> </td>
            <td><%if(b.getCategory()==1){%>

            자유게시판
            <%} else{%>
            반려견 스토리
            <%} %></td>
            <td><%=b.getTitle() %></td>
            <td><%=b.getEnrollDate() %></td>
              <%}}else{ %>
              <td colspan="5">등록된 글이 없습니다!</td>

        </tr>
              <%} %>
    </table><br>

</div>
</div>
				</div>			
		</div></div>
	</div>
	</div>
	</div>
		<script>
	// 게시판 상세보기 기능 구현
	$(function(){
		$("#formwrap td").mouseenter(function(){
			$(this).parent().css({"cursor":"pointer"})	
		}).click(function(){
			var boardNo=$(this).parent().children("input").val();
			var clas=$(this).parent().children("input").attr('class');
			console.log(boardNo);
			if(clas=='bNo'){
			location.href="<%= request.getContextPath() %>/boardDetailServlet?boardNo="+boardNo;
			}else{
				location.href="<%= request.getContextPath() %>/IMGDetailServlet?boardNo="+boardNo;
			}
		});
	});
	</script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>