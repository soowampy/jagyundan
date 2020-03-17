<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.*"%>
    <%
    Notice n = (Notice)request.getAttribute("notice");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/mypage/report/mpReportDetail.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#tableWrapper{
	padding-top:5%;
	width:60%;
	height:60%;
	margin:auto;
	   margin-bottom:15px;
}

#detail{
height:300px;

}

#writer{
width:90px;
}

#btnWrapper{
position:relative;
	left:80%;
	margin-bottom:15px;
	margin-top:15px;
}



</style>



</head>

<body>
	<%@ include file="../../common/menubar.jsp"%>
	
	<div id="tableWrapper">
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                        <div class="title">
                            <h2>
                                <font color="#000000"><%=n.getTitle() %></font>
                            </h2>
                        </div>
                    </div>
                    
	<form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post" target="_self"  enctype="multipart/form-data">
                        <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002 ">
                            <div class="boardView">
                                <table border="1" summary="">
                                    <caption><%=n.getTitle() %>공지 제목</caption>
                                    <tbody>
                                       
                                         <tr>
                                            <th>작성일</th>
                                            <td><%=n.getEnrollDate()%> </td>
                                        </tr>
                                        
                                        <tr class="view">
                                            <td colspan="2">
                                                <div class="detail" id="detail">
                                                   
                                                    <p id="centent"><%=(n.getContent()).replace("\r\n","<br>") %></p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </form>
                    
                    
               
                 
              <div id="btnWrapper">
              <button id="listBtn" onclick="location.href='<%=request.getContextPath() %>/NoticeListServlet'" class="btn btn-outline-success">목록으로</button>
              <!--  로그인 시 나타는 버튼 -->
              <%if((loginUser.getUserId()).equals("adminjagyun")){ %>
                <button id="updateBtn" type="button" onclick="updateBoard()" class="btn btn-outline-success">수정하기</button>
                <button id="deleteBtn" type="button" onclick="deleteBoard()" class="btn btn-outline-danger">삭제하기</button>
                 <%} %>
         	 </div>
              <hr>
              
             
              
           </div>   
                      
                 <form action="" id="detailForm" method="post">
				<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo()%>">
				</form>
				
				 <script>
           	function deleteBoard(){
           		if(confirm("해당 게시글을 삭제하시겠습니까?")){
           			$("#detailForm").attr("action","<%=request.getContextPath()%>/NoticeDeleteServlet");
           			$("#detailForm").submit();
           		}
           	}
           	
           	function updateBoard(){
           		$("#detailForm").attr("action","<%=request.getContextPath()%>/NoticeUpdateFormServlet");
           		$("#detailForm").submit();
           	}
           </script>
      	            
	
	
	
	
	
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>