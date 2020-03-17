<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
    <%
    Board board = (Board)request.getAttribute("board");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/mypage/report/mpReportDetail.css" />
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



#titleInput{
	height:30px;
}

</style>



</head>

<body>
	<%@ include file="../../common/menubar.jsp"%>
	
	<div id="tableWrapper">
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                        <div class="title">
                            <h2>
                                <font color="#000000">게시글 수정하기</font>
                            </h2>
                        </div>
                    </div>
                    
	<form id="BoardDelForm" name="" action="<%=request.getContextPath() %>/BoardUpdateServlet" method="post">
                        <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002 ">
                            <div class="boardView">
                                <table border="1" summary="">
                           
                                    <tbody>
                                         <tr>
                                         
                                            <th>제목<input type="hidden" name="boardNo" value="<%=board.getBoardNo() %>"> </th>
                                            <td><input type="text" size="145" id="titleInput" value="<%=board.getTitle()%>" name="title"> </td>
                                        </tr>
                                        <tr>
                                            <th id="writer">작성자 </th>
                                            <td><%=board.getUserName() %><span class="displaynone"></span> </td>
                                        </tr>
                                         <tr>
                                            <th>작성일</th>
                                            <td><%=board.getEnrollDate() %><span class="displaynone"></span> </td>
                                        </tr>
                                        
                                        <tr class="view">
                                            <td colspan="2">
                                                <div class="detail" id="detail">
                                                   <textArea cols="155" rows="10" style="resize:none" name="content" ><%=board.getContent()%></textArea>
                                                   
                                                    
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                          <div id="btnWrapper">
              
                <button id="updateBtn"  class="btn btn-outline-success">수정하기</button>
                 <button id="listBtn" type="button" onclick="location.href='<%=request.getContextPath() %>/list.bo'" class="btn btn-outline-success">목록으로</button>
         	 </div>
                    </form>
              
            
              <hr>
              
         
           

              
               
               
               
       
         </div>

                          
	
	
	
	
	
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>