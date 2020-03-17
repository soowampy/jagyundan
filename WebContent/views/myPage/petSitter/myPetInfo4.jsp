<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"  import="java.util.ArrayList, petsitter.model.vo.*"%>
<%
ArrayList<Pet> p = (ArrayList<Pet>)request.getAttribute("list");
Pet selectPet = (Pet)request.getAttribute("selectPet");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
<style>
.container2 {
   margin-top: 2%;
   width: 100%;
}

.tableArea {
   width: 70%;
   padding: 1%;
   margin-left: 5%;
   margin-top: 1%;
}

* {
   font-size: 11pt;
}


#petinfo{
    width:100%;

}
td{
    width:50%;

}

table{
width:100%;

}
.a{
    padding:0%;
    margin:0%;
    width:80%;
    height:25px;
}
#aa{
    padding:0%;
    margin:0%;
    width:50%;
    height:15px;

}
#b{
    width:15%;
}

    .c{
        text-align:right;
        padding:0%;
        margin:0%;
    }
    td{

height:80px;
padding:2%;
    background-color:rgba(235, 235, 235, 0.295);
}

.q{
    padding:0%;
    margin-bottom:1%;
    height:20px;
}
  #h{
            font-weight: 700;
            font-size:30px;
  }
  
  #bb{
  font-size:20px;
  }
  
  
  #acc{
  text-align:right;
  }
.default {background-color: #e7e7e7; color: black;} /* Gray */ 
.default:hover {background: #ddd;}
.danger {background-color: #f44336;} /* Red */ 
.danger:hover {background: #da190b;}
  table{

  }
  .info {background-color: #2196F3;} /* Blue */
.info:hover {background: #0b7dda;}
  .btn {
  border: none;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}
#b{
display:inline;
}
</style>
</head>
<body>
   <%@ include file="../common/mpNavibar.jsp"%>


   <div class="tableArea">
   <%if(loginUser.getDogSu()==0) {%>
      등록된 반려견이 없습니다!<br>
      반려견을 새로 등록해주세요~<br>
      <button class="btn btn-info"  type="button" onclick="InsertPet();">반려견 등록</button>
   <%}else {%>

    <div id="petinfo">
       <div id="h">반려견 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <hr>
        <table>
                <tr>
                        <td class="q" colspan="2">     
                        <% for(Pet pet : p){%>
                        <form id="joinForm" name="joinForm" action="<%= request.getContextPath() %>/myPetInfo2" method="post" style="float:left;">
                        <input type="hidden" name="dogNum" value="<%=pet.getDogNum() %>"></input>
                        <button class="btn btn-light"><%=pet.getDogName() %></button>&nbsp;&nbsp;&nbsp;</form><%} %>
                        </td>
                        
             </tr>
        </table>
    <table>
<!-- 반려견있으면 뜨고 없으면 반려견이없습니다 등록하시겠습니까~ -->
        <!-- for문 돌려서.. -->
        </tr>
        <%if(selectPet==null) {%>
        <tr>
            <td class="n"><b>이름</b><br><input type="text" id="aa" class="form-control" name="" value="<%=p.get(0).getDogName()%>" disabled>
            <td><b>성별</b><br>
            <%if(p.get(0).getGender().equals(("F"))) {%>
                <input type="radio" class="" name="" value="" disabled checked>암&nbsp;
                <input type="radio" class="" name="" value="" disabled>수&nbsp;
            <%}else{ %>
                <input type="radio" class="" name="" value="" disabled>암&nbsp;
                <input type="radio" class="" name="" value="" disabled checked>수&nbsp;
            <%} %>
            </td>
        </tr>
        <tr>
            <td><b>예방접종 여부</b><br>
            <input type="text" class="form-control" id="aa" name="" value="<%=p.get(0).getVaccination() %>" disabled></td>
            <td>
                    <b>배변훈련여부</b><br>
         <%if(p.get(0).getToiletTrain().equals("Y")) {%>  
                    <input type="radio" class="" name="" value="" disabled checked>했음&nbsp;
                    <input type="radio" class="" name="" value="" disabled>안했음&nbsp;
         <%}else{ %>
                    <input type="radio" class="" name="" value="" disabled>했음&nbsp;
                    <input type="radio" class="" name="" value="" disabled checked>안했음&nbsp;
         <%} %>
            </td>
        </tr>
        <tr>

            <td><b>중성화 여부</b><br>
         <%if(p.get(0).getNeutralize().equals("Y")) {%>  
                <input type="radio" class="" name="" value="" disabled checked>했음&nbsp;
                <input type="radio" class="" name="" value="" disabled>안했음&nbsp;
         <%}else{ %>
                <input type="radio" class="" name="" value="" disabled>했음&nbsp;
                <input type="radio" class="" name="" value="" disabled checked>안했음&nbsp;
         <%} %>
         </td>
            <td><b>크기</b><br>
         <% if(p.get(0).getSize().equals("S")) {%>  
                <input type="radio" class="" name="" value="" disabled checked>소&nbsp;
                <input type="radio" class="" name="" value="" disabled>중&nbsp;
                <input type="radio" class="" name="" value="" disabled>대
         <%}else if(p.get(0).getSize().equals("M")){ %>
              <input type="radio" class="" name="" value="" disabled>소&nbsp;
                <input type="radio" class="" name="" value="" disabled checked> 중&nbsp;
                <input type="radio" class="" name="" value="" disabled>대
         <%}else if(p.get(0).getSize().equals("L")){%>
            <input type="radio" class="" name="" value="" disabled>소&nbsp;
                <input type="radio" class="" name="" value="" disabled > 중&nbsp;
                <input type="radio" class="" name="" value="" disabled checked>대
         <%} %>
         </td>
        </tr>
        <tr>
            <td><b>반려견 나이</b><br><input type="text" class="form-control" id="b" name="" value="<%=p.get(0).getAge()%>" disabled></td>
            <td></td>
        </tr>
        <%} %><%else{ %>
                <tr>
            <td class="n"><b>이름</b><br><input type="text" id="aa" class="form-control" name="" value="<%=selectPet.getDogName()%>" disabled>
            <td><b>성별</b><br>
            <%if(selectPet.getGender().equals(("F"))) {%>
                <input type="radio" class="" name="" value="" disabled checked>암&nbsp;
                <input type="radio" class="" name="" value="" disabled>수&nbsp;
            <%}else{ %>
                <input type="radio" class="" name="" value="" disabled>암&nbsp;
                <input type="radio" class="" name="" value="" disabled checked>수&nbsp;
            <%} %>
            </td>
        </tr>
        <tr>
            <td><b>예방접종 여부</b><br>
            <input type="text" class="form-control" id="aa" name="" value="<%=selectPet.getVaccination() %>" disabled></td>
            <td>
                    <b>배변훈련여부</b><br>
         <%if(selectPet.getToiletTrain().equals("Y")) {%>  
                    <input type="radio" class="" name="" value="" disabled checked>했음&nbsp;
                    <input type="radio" class="" name="" value="" disabled>안했음&nbsp;
         <%}else{ %>
                    <input type="radio" class="" name="" value="" disabled>했음&nbsp;
                    <input type="radio" class="" name="" value="" disabled checked>안했음&nbsp;
         <%} %>
            </td>
        </tr>
        <tr>

            <td><b>중성화 여부</b><br>
         <%if(selectPet.getNeutralize().equals("Y")) {%>  
                <input type="radio" class="" name="" value="" disabled checked>했음&nbsp;
                <input type="radio" class="" name="" value="" disabled>안했음&nbsp;
         <%}else{ %>
                <input type="radio" class="" name="" value="" disabled>했음&nbsp;
                <input type="radio" class="" name="" value="" disabled checked>안했음&nbsp;
         <%} %>
         </td>
            <td><b>크기</b><br>
         <% if(selectPet.getSize().equals("S")) {%>  
                <input type="radio" class="" name="" value="" disabled checked>소&nbsp;
                <input type="radio" class="" name="" value="" disabled>중&nbsp;
                <input type="radio" class="" name="" value="" disabled>대
         <%}else if(selectPet.getSize().equals("M")){ %>
              <input type="radio" class="" name="" value="" disabled>소&nbsp;
                <input type="radio" class="" name="" value="" disabled checked> 중&nbsp;
                <input type="radio" class="" name="" value="" disabled>대
         <%}else if(selectPet.getSize().equals("L")){%>
            <input type="radio" class="" name="" value="" disabled>소&nbsp;
                <input type="radio" class="" name="" value="" disabled > 중&nbsp;
                <input type="radio" class="" name="" value="" disabled checked>대
         <%} %>
         </td>
        </tr>
        <tr>
            <td><b>반려견 나이</b><br><input type="text" class="form-control" id="b" name="" value="<%=selectPet.getAge()%>" disabled></td>
            <td></td>
        </tr>
        <%} %>
    </table>

</div>
<div id="acc">
    <%if(selectPet==null) {%>
          <button type="button"  class="btn btn-primary" onclick="InsertPet();">추가하기</button> 
       <form action="<%= request.getContextPath() %>/myPetUpdateServlet" method="post" style="float:left;">
          <input type="hidden" name="dogNum" value="<%=p.get(0).getDogNum() %>">

      </form>
<form action="<%= request.getContextPath() %>/myPetDeleteServlet" method="post" onsubmit="return deleteConfirm();" style="float:left;">
         <input type="hidden" name="dogNum" value="<%=p.get(0).getDogNum() %>">
          <button class="btn btn-danger">삭제하기</button>
      </form>   
</div>
   <%} else{%>
         <button type="button"  class="btn btn-primary" onclick="InsertPet();">추가하기</button>
       <form action="<%= request.getContextPath() %>/myPetUpdateServlet" method="post" style="float:left;">
          <input type="hidden" name="dogNum" value="<%=selectPet.getDogNum()%>">

      </form>
       <form action="<%= request.getContextPath() %>/myPetDeleteServlet" method="post" onsubmit="return deleteConfirm();" style="float:left;">
          <input type="hidden" name="dogNum" value="<%=selectPet.getDogNum()%>">
          <button class="btn btn-danger">삭제하기</button>
      </form>
   <%} %>
   <%} %>
   </div>
   </div>
   </div>
   </div>
   </div>
   </div>
   </div>
   <%@ include file="../../common/footer.jsp"%>
   <script>
   function InsertPet(){
      location.href = '<%=request.getContextPath() %>/views/myPage/petSitter/myPetInsert2.jsp';
   }
   
   function deleteConfirm(){
      if(confirm("정말 삭제하시겠습니까?")){
         return true;
      }else{
         return false;
      }
   }
   </script>
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>