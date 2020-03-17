<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/mypage/css/myInfoUpdate.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
textarea{
	width:80%;
	height:100%;
}
.reason{
	width:100%;
	height:350px;
	resize:none;
	display:block;
	overflow-y: hidden;
	padding: 1.1em; /* prevents text jump on Enter keypress */
    padding-bottom: 0.2em;
    line-height: 1.6;
}
body{
	
}
</style>
<script>
	$(function(){
	      $('.wrap').on( 'keyup', 'textarea', function (e){
	          $(this).css('height', 'auto' );
	          $(this).height( this.scrollHeight );
	        });
	        $('.wrap').find( 'textarea' ).keyup();
	})
</script>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
		<div class="container">
			  <form id="editForm" name="editForm" action="<%= request.getContextPath() %>/PsInsertServlet" method="post" onsubmit="return checkValidate()">
	            <div class="xans-element- xans-member xans-member-edit">
	                <h3>펫시터 정보</h3>
	                <div class="boardWrite">
	                    <table border="1" summary="">
	                        <caption>회원정보</caption>
	                        <tbody>
	                            <tr>
	                                <th scope="row">지원 동기</th>
	                                <td class="wrap">
	                                    <textarea name="reason"  id="reason" class="reason"></textarea>
	                                    <span id="counter">###</span>
	                                   	<script>
					      					$('#reason').keyup(function (e){
					          					var content = $(this).val();
									        	
									        	$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
									            $('#counter').html(content.length + '/150');
									        	
									            if(content.length > 100) {
									                $(this).val($(this).val().substring(0, 150));
									             }
									      	});
					      					
									      	$('#reason').keyup();
										</script>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th scope="row">직업여부</th>
	                                <td id="job">
	                                   	<label for="yes">유</label>
	                                   	<input name="checkJob" id="yes" type="radio" value="Y">
	                                   	<label for="no">무</label>
	                                   	<input name="checkJob" id="no" type="radio" value="N">
	                                </td>
	                            </tr>                            <tr>
	                                <th scope="row">반려견 유무</th>
	                                <td>
	                                	<label for="yes">유</label>
	                                   	<input name="checkPet" id="yes" type="radio" value="Y">
	                                   	<label for="no">무</label>
	                                   	<input name="checkPet" id="no" type="radio" value="N">
	                                </td>
	                            </tr>                            <tr>
	                                <th scope="row">돌봄경험</th>
	                                <td>
	                                    <input name="dogExp" type="number" min="0" step="1" value="0">
	                                </td>
	                            </tr>                            <tr>
	                                <th scope="row">관련 자격증</th>
	                                <td>
	                                    <textarea name="certific" style="resize:none;"></textarea>
	                                </td>
	                            </tr>                            
	
	                        </tbody>
	                    </table>
	                </div>
	                <div class="btnArea">
	                    <button>취소</button>
	                    <button type="submit">지원하기</button>
	                </div>
	            </div>
	        </form>
		</div>
<script>
	function checkValidate(){ //유효성 검사하기 위한 부분
		if($("#reason").val()==""){
			alert("지원 동기를 꼭 입력하셔야 합니다!.");
			$("#title").focus()
			return false;
		}
		if($("#reason").val().length<50){
			alert("지원 동기는 최소 50자 이상이여야 합니다.");
			$("#reason").focus();					
			return false;
		}
		var check1 = $(':input[name=checkJob]:radio:checked').val();
		
		if(!check1){
			alert("직업 여부를 꼭 체크하셔야 합니다!");
			return false;
		}
		
		var check2 = $(':input[name=checkPet]:radio:checked').val();
		
		if(!check2){
			alert("반려견 유무를 꼭 체크하셔야 합니다!");
			return false;
		}
	}
</script>
</body>
</html>