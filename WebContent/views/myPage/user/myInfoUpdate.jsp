<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User u = (User)session.getAttribute("loginUser");

	int userNo = u.getUserNo();
	String userId = u.getUserId();
	String userName = u.getUserName();
	String userPwd = u.getUserPwd();
	String gender = u.getGender();
	String email = (u.getEmail() != null) ? u.getEmail() : "";
	String address0 = (u.getAddress() != null) ? u.getAddress() : "";
	
	String address[] = address0.split(",");
	
	
	String birth = u.getBirth();

	String phone[]= u.getPhone().split(",");
	// 값이 존재하는 인덱스에 checked라는 문자열을 넣을 용도
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/mypage/css/myInfoUpdate2.css" />
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
</head>
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



*{
font-size:11pt;
}
#pwd{
font-size:8pt;
}

  #h{
            font-weight: 700;
            font-size:30px;
  }
</style>
<body>
<%-- <%@ include file="../../common/menubar.jsp"%>
	<!--  	<div class="container2"> -->
	<div class="container2">
			<div class="mpinner">
			<div class="container"> --%>
		<%@ include file="../common/mpNavibar.jsp"%>

<div class="tableArea">
<div id="">
        <form id="updateForm" name="updateForm" action="<%= request.getContextPath() %>/UserUpdateServlet2" method="post" enctype="multipart/form-data">
            <div class="xans-element- xans-member xans-member-edit">
                      <div id="h">회원정보</div><br>
                <div class="boardWrite">
                    <table border="1" summary="">
                        <caption>회원정보</caption>
                        <tbody>
                            <tr>
                                <th scope="row">아이디</th>
                                <td><span id="name_contents">
                                <input id="userNo" name="userNo" value="<%=userNo %>" hidden>
                                <input id="userId" name="userId" value="<%=userId %>" hidden>
                                <%=userId %></span> <!-- <span id="pwd">(영문소문자/숫자, 4~16자)</span> -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호</th>
                                <td><input id="userPwd" name="userPwd" maxlength="16" disabled value="" type="password" />
                                    <!-- <span id="pwd">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span></td> -->
                            </tr>

                            <tr style="display:1">
                                <th scope="row">이름</th>
                                <td><span id="name_contents"><%=userName%></span>
                                <input id="userNo" name="userName" value="<%=userName%>" hidden>
                                </td>
                            </tr>
                            <tr class="">
                                <th scope="row">생년월일</th>
                                <input id="birth" name="birth" value="<%=birth%>" hidden>
                                <td><%= birth%></td>
                            </tr>
                            <tr class="">
                                <th scope="row">성별</th>
                                <%if(gender.equals("F")){ %>
                                <td><input id="is_sex0" name="is_sex" fw-filter="" fw-label="성별" fw-msg="" disabled="1"
                                        value="M" type="radio" /><label for="is_sex0">남자</label>
                                    <input id="is_sex1" name="is_sex" fw-filter="" fw-label="성별" fw-msg="" disabled="1"
                                        value="F" type="radio" checked="checked" /><label for="is_sex1">여자</label></td>
                            	<%}else {%>
                                <td><input id="is_sex0" name="is_sex" fw-filter="" fw-label="성별" fw-msg="" disabled="1"
                                        value="M" type="radio" checked="checked" /><label for="is_sex0">남자</label>
                                    <input id="is_sex1" name="is_sex" fw-filter="" fw-label="성별" fw-msg="" disabled="1"
                                        value="F" type="radio" /><label for="is_sex1">여자</label></td>
                            	<%} %>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td>
                                    <input id="postcode1" name="addr0" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14"
                                        value="<%=address[0] %>" type="text" /> 
                                        
                                        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                    <input id="addr1" name="addr1" class="inputTypeText" readonly="readonly" value="<%=address[1] %>" type="text" /><br />
                                    <input id="addr2" name="addr2"class="inputTypeText" value="<%=address[2] %>" type="text" /> </td>
                            </tr>
                            <tr>
                                <th scope="row">휴대전화</th>
                                <td><select id="phone1" name="phone1">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>-<input id="phone2" name="phone2" maxlength="4" value="<%=phone[1] %>" type="text" />-
                                    <input id="phone3"
                                        name="phone3" maxlength="4" value="<%=phone[2]%>" type="text" /> 
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">이메일</th>
                                <input id="email" name="email" value="<%=email%>" hidden>
                                <td><%=email %></td>
                            </tr>
							<tr>
										<th scope="row">사진</th>
										<td>
											<div id="file">
 												<input type="file" id="thumbnailImg1" 
 												name="UserImg" onchange="loadImg(this,1)">
												<div id="contentImgArea1">
													<img id="contentImg1" width="120" height="100">
												</div>
											</div>
										</td>
									</tr>
                        </tbody>
                    </table>
                </div>
                <div class="btnArea">
				<button id="updateBtn">수정하기</button>
				<button id="deleteBtn" onclick="deleteMember();" type="button">탈퇴하기</button>
                </div>
            </div>
        </form>
    </div>
    </div>
    	</div>
	</div>
	</div>
<script>
function deleteMember(){
	location.href="<%= request.getContextPath()%>/views/myPage/user/deleteUser.jsp";
}

function sample4_execDaumPostcode() {
    new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                     }
                  }
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('postcode1').value = data.zonecode;
                  document.getElementById("addr1").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("addr2")
                        .focus();
               }
            }).open();
}

					function loadImg(value, num){
						// value => input type="file"
						// num => 조건문을 통해 미리보기 div 지정
						// file이 존재하는지 조건문
						if(value.files && value.files[0]){
							// 파일을 읽어 들일 FileReader 객체 생성
							var reader = new FileReader();
							
							// 파일 읽기가 완료 되었을 때 실행 되는 메소드 설정
							reader.onload = function(e){
								switch(num){
								case 1:
									$("#contentImg1").attr("src", e.target.result);
									break;
								}
							
							}
							// 파일 읽기 하는 메소드
							reader.readAsDataURL(value.files[0]);
						}
					}
					

</script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>