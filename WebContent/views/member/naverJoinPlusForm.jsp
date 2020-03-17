<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	String naverId = (String)request.getAttribute("naverId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://nid.naver.com/login/css/oauth_201804.css">
    <style>
    .a{
    border: 1px solid black;
    width:100%;
    height:30px;
    margin-bottom:1%;
    }
    .b{
        border: 1px solid black;
    width:25%;
    height:30px;
    margin-bottom:1%;
    }
    </style>
</head>
<body>

<div id="wrap">
    <!-- header -->
    <div id="header" role="banner">
        <div class="oauth_header">
            <a href="http://www.naver.com" target="_blank" class="oauth_logo oauth_sprites" onclick="try{nclks('top.naver',this,event)}catch(e){}"><h1 class="blind">Naver</h1></a>
            <a class="oauth_user" >
                <span class="oauth_user_mask oauth_sprites"></span>
                <div class="oauth_user_id" id="oauth_user_id"></div>
                
            </a>
            <div class="oauth_user_pop oauth_sprites" id="oauth_user_pop" style="display:none"><a id="change_account">다른 아이디로 로그인</a></div>
        </div>
    </div>
    <!-- // header -->
    <!-- container -->
    <div class="oauth_container" role="main">
        <div id="content" class="oauth_content">
            <div class="access_logo"><img src="https://ndevthumb-phinf.pstatic.net/20191225_149/1577259701954k6lmr_PNG/CPun5DWCtPB020191225164141.png" onerror="this.src='https://static.nid.naver.com/images/login/oauth_new/noimage.png';" width="70" height="70" alt="자견단단"></div>
            <form id="joinForm" action="<%= request.getContextPath() %>/nTest2" method="post">
            <div class="oauth_personal">
                    <p>
                    
					
					<h1>추가내용 입력</h1><br><br>
					<input type="hidden" value="<%=naverId %>" name="naverId">
										<h2>주소</h2><br><input type="button" onclick="sample4_execDaumPostcode()" value="[우편번호 찾기]">
										<input id="postcode1" name="addr" class="a" placeholder="" readonly="readonly" maxlength="14" type="text" required/> 
										<br>
										<input id="addr1" name="addr1" class="a" readonly="readonly" type="text" required/><br /> 
										<input id="addr2" name="addr2" class="a" type="text" required/>
										<br><br><h2>휴대폰 번호</h2><br>
										<select id="phone1" name="phone1" class="b" required>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select>-<input id="phone2" class="b" name="phone2" maxlength="4" type="text" required />-
											<input id="phone3" class="b" name="phone3" maxlength="4" type="text" required />
                    			<br><br><h2>생년월일(ex.19950403)</h2><br>
                    			<input name="birth" class="a" type="text" required/>
                    	

                    
                    </p>

               

            </div>
            <div class="oauth_personal_guide">
            </div>
            <div class="btn_area_double">
                <div class="btn_unit"><button type="button" class="btn_unit_off" ><span>취소</span></button></div>
                <div class="btn_unit"><button class="btn_unit_on" ><span>동의하기</span></button></div>
            </div>
            </form>
        </div>
    </div>


    <!-- //container -->
    <!-- footer -->
    <div id="footer" class="oauth_footer" role="contentinfo">
        <ul>
            <li><!-- tg-text=footer_terms --><a href="http://policy.naver.com/rules/service.html" onclick="try{nclks('ftr.useragr',this,event)}catch(e){}" target="_blank">이용 약관</a></li>
            <li><strong><!-- tg-text=footer_privacy --><a href="http://policy.naver.com/rules/privacy.html" onclick="try{nclks('ftr.privacy',this,event)}catch(e){}" target="_blank">개인정보처리방침</a></strong></li>
            <li class="u_cr eng_none"><a href="http://policy.naver.com/rules/disclaimer.html" onclick="try{nclks('ftr.legal',this,event)}catch(e){}" target="_blank">책임의 한계와 법적고지</a></li>
            <li class="u_cr"><!-- tg-text=footer_help --><a href="https://help.naver.com/support/service/main.nhn?serviceNo=532" onclick="try{nclks('ftr.cs',this,event)}catch(e){}" target="_blank">회원정보 고객센터</a></li>
        </ul>
        <address>
            <em><a href="http://www.naver.com/" target="_blank" class="sp_img logo"><span class="blind">naver</span></a></em>
            <em class="copy">Copyright</em>
            <em class="u_cri">&copy;</em>
            <a href="http://www.navercorp.com/" target="_blank" class="u_cra">NAVER Corp.</a>
            <span class="bar" aria-hidden="true">|</span>
            <!-- tg-text=footer_help -->
            <a href="https://help.naver.com/support/service/main.nhn?serviceNo=532" onclick="try{nclks('ftr.cs',this,event)}catch(e){}" target="_blank" class="u_cri">
                회원정보 고객센터
            </a>
            <span class="all_r">All Rights Reserved.</span>
        </address>
    </div>
    <!-- //footer -->
<script>
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
<!--  // 우편번호 서비스 --> 

</script>

</body>
</html>