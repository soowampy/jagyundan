<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar, java.util.ArrayList, petsitter.model.vo.*, common.model.vo.*,board.model.vo.*"%>
<%
   PsBoard psBoard = (PsBoard)request.getAttribute("psBoard");

   int psBoardNo = psBoard.getPsBoardNo();
   System.out.println("수정 들어왔다");
   System.out.println(psBoard);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<style>
.enrollWrapper{
   height:250vh;
   width:70%;
   margin:auto;
   margin-top:25px;
   padding:20px;
   background-color:#F2F2F2;
   margin-bottom:15px;
}
.enroll-intro{
   height:5%;
   width:80%;
   margin:auto;
   text-align:center;
   font-size:4rem;
   font-family: 'Jua', sans-serif;
   border-bottom:1px solid black;
}
.enroll-form-wrapper{
   height:75%;
   width:80%;
   margin:auto;
   margin-top:15px;
}
.ps-board{
   height:100%;
   width:100%;
}
/*---------------이미지------------------------*/
.represent-img{
   width:70%;
   height:35%;
}
.rest-img{
   width:30%;
   height:35%;
}
.rest-img1{
   width:100%;
   height:34%
}
.rest-img2{
   width:100%;
   height:33%
}
.rest-img3{
   width:100%;
   height:33%
}
/*---------------제목------------------------*/
.title{
   width:100%;
   height: 5%;
}
/*---------------서비스------------------------*/
.condition{
   width:100%;
   height:45%;
   background-color:white;
   padding:20px;
}
.checkbox{
   height:15px;
   width:15px;
}
.tableArea{
   margin:auto;
   width:100%;
}
.tableArea{
   text-align:center
}
/*---------------내용------------------------*/
.content{
   width:100%;
   height:30%;
   padding:10px;
   background-color:white;
}
#content{
   height:90%;
   width:100%;
   resize:none;
   border:0;
}
#counter{
   height:10%;
   width:100%;
}
/*---------------등록 버튼------------------------*/
.enroll-btn{
   height:5%
}
/*---------------자주 쓰는것들---------------------------*/
.border{
   border:10px solid black;
}
.float-left{
   float:left;
}
.float-right{
   float:right;
}
.margin-top{
   margin-top:15px;
}
.images{
   height:30px;
   width:30px;
   margin-top:40%;
   margin-left:48%;
}
.images1{
   height:30px;
   width:30px;
   margin-top:28%;
   margin-left:45%;
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
<script>
      function enrollValidate(){ //유효성 검사하기 위한 부분
            if($("#represent-btn").val()== "" || $("#rest-img1-btn").val()== "" || $("#rest-img2-btn").val()== ""|| $("#rest-img3-btn").val()== ""){
               //사진 유효성검사 하는 부분
               alert("사진을 4장 꼭 채우셔야 합니다!");
               return false;
            }
      
            if($("#title").val()==""){ //제목 유효성 검사
               alert("제목을 꼭 입력하셔야 합니다!.");
               $("#title").focus()
               return false;
            }
            
            //체크박스 유효성 검사
            var service1 = document.getElementsByName("service");
            var service2 = false;
            for(var i=0;i<service1.length;i++){
                if(service1[i].checked == true){
                   service2 = true;
                }
            }
            if(!service2){
               alert("서비스 항목을 최소1개이상 선택하십시요");
               return false;
            }
            
            //
            
            var size1 = document.getElementsByName("size");
            var size2 = false;
            for(var i=0;i<size1.length;i++){
                if(size1[i].checked == true){
                   size2 = true;
                }
            }
            if(!size2){
               alert("사이즈 항목을 최소1개이상 선택하십시요");
               return false;
            }
            
            //
            
            var age1 = document.getElementsByName("age");
            var age2 = false;
            for(var i=0;i<age1.length;i++){
                if(age1[i].checked == true){
                   age2 = true;
                }
            }
            if(!age2){
               alert("나이 항목을 최소1개이상 선택하십시요");
               return false;
            }
            
            //
            if($("#checkIn").val() == "" || $("#checkOut").val() == ""){
               alert('체크인/아웃 시간이 입력이 안됬습니다');
               if($("#checkIn").val() == ""){
                  $("#checkIn").focus();
                  return false;
               }else{
                  $("#checkOut").focus();
                  return false;
               }
            }
            
            if($("#hourPrice").val() == 0){
               alert("데이케어 가격 설정을 하시지 않으셨습니다.")
               $("#hourPrice").focus();
               return false;
            }
            
            if($("#onedayPrice").val() == 0){
               alert("숙박 케어 가격 설정을 하시지 않으셨습니다.")
               $("#onedayPrice").focus();
               return false;
            }
            
            if($("#content").val()==""){
               alert("내용을 꼭 입력하셔야 합니다!.");
               $("#content").focus()
               return false;
            }
            if($("#content").val().length<10){
               alert("본인 설명은 최소 300자 이상이여야 합니다.");
               $("#content").focus()               
               return false;
            }
      }
</script>
<script>
   $(function(){
      $("#title").val("<%= psBoard.getTitle() %>");
      $("#checkIn").val("<%= psBoard.getCheckIn() %>");
      $("#checkOut").val("<%= psBoard.getCheckOut() %>");
      $("#hourPrice").val("<%= psBoard.getHourPrice() %>");
      $("#onedayPrice").val("<%= psBoard.getOneDayPrice() %>");
   })
</script>
</head>

<body>
   <%@ include file="../common/menubar.jsp" %>
   <div class="enrollWrapper">
      <div class="enroll-intro">펫시터 글 수정</div>
      <div class="enroll-form-wrapper">
         <form action="<%= request.getContextPath() %>/UpdatePsBoard?psBoardNo=<%= psBoardNo %>" method="post" name="psForm" class="ps-board" onsubmit="return enrollValidate()"
            enctype="multipart/form-data">
            <div class="represent-img border float-left" id="represent" ><img id="represent1" class="images" src="<%= request.getContextPath() %>/resources/petsitter/plus.png"></div>
            <div class="rest-img border float-left">
               <div class="rest-img1 border" id="rest-img1"><img class="images1" id="rest-img-1" src="<%= request.getContextPath() %>/resources/petsitter/plus.png"></div>
               <div class="rest-img2 border" id="rest-img2"><img class="images1" id="rest-img-2" src="<%= request.getContextPath() %>/resources/petsitter/plus.png"></div>
               <div class="rest-img3 border" id="rest-img3"><img class="images1" id="rest-img-3" src="<%= request.getContextPath() %>/resources/petsitter/plus.png"></div>
            </div>
            <br clear="both">
            <div class="title margin-top">
               <dl>
                  <dt>제목</dt>
                  <dd><input name="title" id="title" class="width" type="text"></dd>
               </dl>
            </div>
            <div class="condition margin-top">
                  <div class="service">
                     <dl>
                        <dt>이용 가능 서비스</dt>
                        <dd>
                           <table class="border tableArea margin-top">
                              <tr>
                                 <td>
                                    <label for="walk">산책</label>
                                    <input class="checkbox" type="checkbox" id="walk" name="service" value="산책">
                                 </td>
                                 <td>
                                    <label for="pill">약물복용</label>
                                    <input class="checkbox" type="checkbox" id="pill" name="service" value="약물복용">
                                 </td>
                                 <td>
                                    <label for="play">실내놀이</label>
                                    <input class="checkbox" type="checkbox" id="play" name="service" value="실내놀이">
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <label for="madang">마당</label>
                                    <input class="checkbox" type="checkbox" id="madang" name="service" value="마당">
                                 </td>
                                 <td>
                                    <label for="pickup">픽업</label>
                                    <input class="checkbox" type="checkbox" id="pickup" name="service" value="픽업">
                                 </td>
                                 <td>
                                    <label for="shower">목욕가능</label>
                                    <input class="checkbox" type="checkbox" id="shower" name="service" value="목욕가능">
                                 </td>
                              </tr>
                           </table>
                        </dd>
                     </dl>               
                  </div> <!-- service -->
                  <div class="size">
                     <dl>
                        <dt>가능 사이즈</dt>
                        <dd>
                           <table class="border tableArea margin-top">
                              <tr>
                                 <td>
                                    <label for="small">소형견</label>
                                    <input class="checkbox" type="checkbox" id="small" name="size" value="s">
                                 </td>
                                 <td>
                                    <label for="middle">중형견</label>
                                    <input class="checkbox" type="checkbox" id="middle" name="size" value="m">
                                 </td>
                                 <td>
                                    <label for="large">대형견</label>
                                    <input class="checkbox" type="checkbox" id="large" name="size" value="l">
                                 </td>
                              </tr>
                           </table>
                        </dd>
                     </dl>               
                  </div> <!-- size -->
                  <div class="age">
                     <dl>
                        <dt>가능 나이</dt>
                        <dd>
                           <table class="border tableArea margin-top">
                              <tr>
                                 <td>
                                    <label for="baby">강아지(1~2살)</label>
                                    <input class="checkbox" type="checkbox" id="baby" name="age" value="강아지">
                                 </td>
                                 <td>
                                    <label for="mature">성견(3~7살)</label>
                                    <input class="checkbox" type="checkbox" id="mature" name="age" value="성견">
                                 </td>
                                 <td>
                                    <label for="old">노령견(7살~)</label>
                                    <input class="checkbox" type="checkbox" id="old" name="age" value="노령견">
                                 </td>
                              </tr>
                           </table>
                        </dd>
                     </dl>               
                  </div> <!-- age -->
                  <div class="time">
                     <dl class="float-left" style="margin-right:20px;">
                        <dt>체크인</dt>
                        <dd><input type="time" name="checkIn" id="checkIn"></dd>
                     </dl>
                     <dl>
                        <dt>체크아웃</dt>
                        <dd><input type="time" name="checkOut" id="checkOut"></dd>
                     </dl>
                     <br clear="both">
                  </div>
                  <div class="price">
                     <label>데이 케어 설정</label>
                     <br>
                     <input type="number" name="hourPrice" id="hourPrice" min="10000" step="5000" placeholder="시간케어 가격">
                     <br>
                     <label style="margin-top:15px;">숙박 케어 설정</label>
                     <br>
                     <input type="number" name="onedayPrice" id="onedayPrice" min="10000" step="5000" placeholder="숙박케어 가격">
                  </div>
               </div> <!-- condition -->
            <div class="content margin-top">
               <textarea name="content" id="content" placeholder="내용을 입력하세요.."><%=psBoard.getContent() %></textarea>
               <span id="counter">###</span>
               <script>
                     $('#content').keyup(function (e){
                         var content = $(this).val();
                         $('#counter').html(content.length);
                     });
                     $('#content').keyup();
               </script>
            </div>
            <div class="enroll-btn border margin-top"><button type="submit" class="width height">등록</button></div>
            <input type="file" name="represent" class="hidden" id="represent-btn" onchange="loadImg(this,1)">
            <input type="file" name="rest-img1" class="hidden" id="rest-img1-btn" onchange="loadImg(this,2)">
            <input type="file" name="rest-img2" class="hidden" id="rest-img2-btn" onchange="loadImg(this,3)">
            <input type="file" name="rest-img3" class="hidden" id="rest-img3-btn" onchange="loadImg(this,4)">
         </form>
      </div> <!-- enroll-form-wrapper -->
   </div>
   <%@ include file="../common/footer.jsp" %>
</body>
</html>