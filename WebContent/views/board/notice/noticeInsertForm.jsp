<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	left:70%;
	margin-bottom:15px;
	margin-top:15px;
}


#updateCommentBtn{
position:relative;
right:-65%;
width:60px;
height:35px;
}

#deleteCommentBtn{
position:relative;
right:-65%;
width:60px;
height:35px;
}

#updateBtnArea{
position:relative;
right:70%;
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
                                <font color="#000000">공지사항 등록</font>
                            </h2>
                        </div>
                    </div>
                    
	<form id="BoardForm" name="" action="<%=request.getContextPath() %>/NoticeInsertServlet" method="post">
                        <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002 ">
                            <div class="boardView">
                                <table border="1" summary="">
                           
                                    <tbody>
                                    	
                                         <tr>
                                            <th>제목 </th>
                                            <td><input type="text" size="145" id="titleInput" name="title"> </td>
                                        </tr>
                                        <tr>
                                    		<th>분류</th>
                                    		<td>공지사항</td>
                                    	</tr>
                                          <tr>
                                            <th>내용</th>
                                            <td><span class="displaynone"></span> </td>
                                        </tr>
                                        
                                        <tr class="view">
                                            <td colspan="2">
                                                <div class="detail" id="detail">
                                                   <textArea cols="155" rows="10" name="content" placeholder="이곳에 내용을 작성해주세요" style="resize:none"></textArea>
                                                   
                                                    
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                   <div id="btnWrapper">
              
                <button id="insertBtn" class="btn btn-outline-success">작성하기</button>
                 <button id="listBtn" onclick="javascript:history.back();" class="btn btn-outline-success">목록으로</button>
         	 </div>
                    </form>
              
             
              <hr>
              
         
           

              
               
               
               
       
         </div>

                          
	
	
	
	
	
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>