<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*,common.model.vo.*, java.util.*, java.text.SimpleDateFormat"%>
    <%
	Board b = (Board) request.getAttribute("board");

	Date today = new Date();
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	String tday = format1.format(today);

	
	ArrayList<IMG> flist = (ArrayList<IMG>) request.getAttribute("flist");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	left:70%;
	margin-bottom:15px;
	margin-top:15px;
}

#imgArea{
	text-align:center;
}

#textArea{
	text-align:center;
}

#titleInput{
	height:30px;
}

/*이미지 삽입 부분*/
#imgArea{
            text-align:center;
            min-width: 500px;
            
           
        }
     #imgArea img{
     max-width:1000px;
     max-hight:1000px;  
       }

   #imgfile{
   	height:40px;
   	margin:20px;
   	
   	float:right;
   }
 
 
 /*욱재 enrollPS 훔쳐옴*/



.enroll-form-wrapper{
	height:100%;
	width:100%;
	margin:auto;
	
}
.ps-board{
	height:100%;
	width:100%;
}
/*---------------이미지------------------------*/
.represent-img{
	width:800px;

	height:400px;
	
}

.rest-img1{
	width:300px;
	height:132px;

	
}
.rest-img2{
	width:300px;
	height:132px;


}

.rest-img3{
	width:300px;
	height:132px;

}


.border{
	border:10px solid black;
}
.float-left{
	float:left;
}

.hidden{
	display:none;
}
.width{
	width:100%;
}
.height{
	height:100%;
}
  
</style>



</head>

<body>
	<%@ include file="../../common/menubar.jsp"%>
	
	<div id="tableWrapper">
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                        <div class="title">
                            <h2>
                                <font color="#000000">반려견 스토리 수정하기</font>
                            </h2>
                        </div>
                    </div>
                    
	<form id="BoardForm"  action="<%=request.getContextPath() %>/IMGUpdateServlet" method="post" enctype="multipart/form-data" >
                        <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002 ">
                            <div class="boardView">
                                <table border="1" summary="">
                           
                                    <tbody>
                                         <tr>
                                            <th>제목<input type="hidden" name="boardNo" value="<%=b.getBoardNo()%>"></th>
                                            <td><input type="text" size="125" id="titleInput" name="title" value="<%=b.getTitle()%>"> </td>
                                        </tr>
                                        <tr>
                                            <th id="writer">작성자 </th>
                                            <td><%=loginUser.getUserName() %></td>
                                        </tr>
                                         <tr>
                                            <th>작성일</th>
                                            <td><%=tday %> </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                        
                                            <td colspan="2">
                                             
                                             <br>
                                             
                                         <div class="enroll-form-wrapper">
		
				<div class="represent-img border float-left" id="represent" ><img 	src="<%=request.getContextPath()%>/resources/board/image/<%=flist.get(0).getChangeName()%>" id="represent1" width="790px" height="390px"></div>
				<div class="rest-img border float-left">
					<div class="rest-img1 border" id="rest-img1"><img src="<%=request.getContextPath()%>/resources/board/image/<%=flist.get(1).getChangeName()%>" id="rest-img-1" width="100%" height="100%"></div>
					<div class="rest-img2 border" id="rest-img2"><img src="<%=request.getContextPath()%>/resources/board/image/<%=flist.get(2).getChangeName()%>" id="rest-img-2" width="100%" height="100%"></div>
					<div class="rest-img3 border" id="rest-img3"><img src="<%=request.getContextPath()%>/resources/board/image/<%=flist.get(3).getChangeName()%>" id="rest-img-3" width="100%" height="100%"></div>
				</div>
				<br clear="both">

				<input type="file" class="hidden" id="represent-btn" onchange="loadImg(this,1)" name="represent-img">
				<input type="file" class="hidden" id="rest-img1-btn" onchange="loadImg(this,2)" name="rest-img1">
				<input type="file" class="hidden" id="rest-img2-btn" onchange="loadImg(this,3)" name="rest-img2">
				<input type="file" class="hidden" id="rest-img3-btn" onchange="loadImg(this,4)" name="rest-img3">
				
			
											</div>

        
                                                <div class="detail" id="detail">
                                                <br>
                                                <br>
                                                   <textArea cols="125" rows="10" name="content" style="resize:none" ><%=b.getContent()%></textArea>
                                                   <br>
                                               
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                         <div id="btnWrapper">
              
                <button id="insertBtn" class="btn btn-outline-success">수정하기</button>
                 <button id="listBtn" type="button"onclick='location.href="<%=request.getContextPath() %>/IMGListServlet"' class="btn btn-outline-success">목록으로</button>
         	 </div>
         	
         	 <input type="hidden" name="IMGNo1" value="<%=flist.get(0).getIMGNum()%>">
         	 <input type="hidden" name="IMGNo2" value="<%=flist.get(1).getIMGNum()%>">
         	 <input type="hidden" name="IMGNo3" value="<%=flist.get(2).getIMGNum()%>">
         	 <input type="hidden" name="IMGNo4" value="<%=flist.get(3).getIMGNum()%>">
         	 
                    </form>
              
             
              <hr>
              
         
           

              
               
               
               
       
         </div>
<script>
	$(function(){
		$("#represent").click(function(e){
			$("#represent-btn").click();
		});
		$("#rest-img1").click(function(e){
			$("#rest-img1-btn").click();
		})
		$("#rest-img2").click(function(e){
			$("#rest-img2-btn").click();
		})
		$("#rest-img3").click(function(e){
			$("#rest-img3-btn").click();
		})
	});
	function loadImg(value,num){
		//value => input type="file";
		//num => 조건문을 통해 미리보기 div 지정
		
		//file이 존재하는지 조건문
		if(value.files && value.files[0]){
			//파일을읽오들일 FileReader 객체 생성
			var reader = new FileReader();
			
			//파일 읽기가 완료 되었을때 실행되는 메소드 설정
			reader.onload = function(e){
				switch(num){
				case 1:
					$("#represent1").attr("src",e.target.result);//src에다가 읽어온 값 넣는다
					$("#represent1").css({width:"100%",height:"100%",margin:"0"});
					break;
				case 2:
					$("#rest-img-1").attr("src",e.target.result);//src에다가 읽어온 값 넣는다
					$("#rest-img-1").css({width:"100%",height:"100%",margin:"0"});
					break;
				case 3:
					$("#rest-img-2").attr("src",e.target.result);//src에다가 읽어온 값 넣는다
					$("#rest-img-2").css({width:"100%",height:"100%",margin:"0"});
					break;
				case 4:
					$("#rest-img-3").attr("src",e.target.result);//src에다가 읽어온 값 넣는다
					$("#rest-img-3").css({width:"100%",height:"100%",margin:"0"});
					break;

				}
			}	
			//파일 읽기 하는 메소드
			reader.readAsDataURL(value.files[0]);
		}
	}
</script>
  
	
	
	
	
	
	
	<%@ include file="../../common/footer.jsp"%>

</body>
</html>