<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
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
  
  table{

  }
</style>
</head>
<body>
	<%@ include file="../common/mpNavibar.jsp"%>
	<div class="tableArea">
    <div id="petinfo">
       <div id="h">반려견 등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <hr>
    <table>
<!-- 반려견있으면 뜨고 없으면 반려견이없습니다 등록하시겠습니까~ -->
        <!-- for문 돌려서.. -->
        </tr>
        <tr>
		<form id="joinForm" name="joinForm" action="<%= request.getContextPath() %>/myPetInsertServlet" method="post">
            <td class="n"><b>이름</b><br><input type="text" id="aa" class="form-control" name="dogName" value="">
            <td><b>성별</b><br>
                <input type="radio" class="" name="gender" value="F">암&nbsp;
                <input type="radio" class="" name="gender" value="M">수&nbsp;
            </td>
        </tr>
        <tr>
            <td><b>예방접종 여부</b><br>
            <input type="text" class="form-control" id="aa" name="vaccination" value=""></td>
            <td>
                    <b>배변훈련여부</b><br>
                    <input type="radio" class="" name="toiletTrain" value="Y">했음&nbsp;
                    <input type="radio" class="" name="toiletTrain" value="N">안했음&nbsp;
            </td>
        </tr>
        <tr>
            <td><b>중성화 여부</b><br>
                <input type="radio" class="" name="neutralize" value="Y">했음&nbsp;
                <input type="radio" class="" name="neutralize" value="N">안했음&nbsp;</td>
            <td><b>크기</b><br>
                <input type="radio" class="" name="size" value="S">소&nbsp;
                <input type="radio" class="" name="size" value="M">중&nbsp;
                <input type="radio" class="" name="size" value="L">대</td>
        </tr>
        <tr>
            <td><b>반려견 나이</b><br><input type="number" class="form-control" id="b" name="age" value=""></td>
            <td></td>
        </tr>
    </table>
</div>
	<div id="acc">
    <button class="btn btn-primary" >추가하기</button>
    </form>
	</div>
	
	</div>
	</div>

	</div>
	</div>
	</div>
	</div>
	</div>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>