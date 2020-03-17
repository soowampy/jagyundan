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
  <link href="<%= request.getContextPath() %>/resources/mypage/css/withdraw2.css" rel="stylesheet">

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
font-size:12pt;

}
#pwd{
font-size:8pt;
}
.c_header,p{
text-algin:center;
}
#a{
margin-left:20%;
}
.spc_content{
margin:10%;

}
#b{
text-align:center;
}
</style>
<body>
<%@ include file="../../common/menubar.jsp"%>
	<div id="container">
		<!-- CONTENTS -->
		<!-- CONTENTS -->
	<div id="content">
<div class="container">
<div id="a">
	<img src="<%= request.getContextPath() %>/resources/image/withdraw.png"
								 alt="" />
</div>
			
		<div class="c_header">
			<h2>탈퇴 안내</h2>
			<p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
		</div>

		<!-- [D] input type="text"에 focus 되었을때 class에 on 추가 (ie6,ie7 대응) -->
		<div class="section_delete">
			<h3 class="h_dropout">
						     	  사용하고 계신 아이디(<em><%=loginUser.getUserId() %></em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
						     </h3>
			<p class="dropout_dsc">
						     	  <em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.
						     </p>
			<h3 class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
			<p class="dropout_dsc">
						     	  회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
						     </p>
			<table cellspacing="0" border="1" summary="탈퇴 후 회원정보 및 개인형 서비스 이용기록 삭제 안내" class="tbl_type">
			<caption>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</caption>
			<colgroup>
			<col width="145"><col width="*">
			</colgroup>
			<tbody id="tblBullet1"> 
			</tbody>
			</table>
			<table cellspacing="0" border="1" summary="탈퇴 후 게시판형 서비스에 등록한 게시물 유지 안내" class="tbl_type">
			<caption>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</caption>
			<colgroup>
			<col width="145"><col width="*">
			</colgroup>

				<input type="hidden" name="token_help" value="R3CIbBN3SHew5oL1" />
				<input type="hidden" name="lang" value="ko_KR" />
				<div class="dropout_agree_area">
					<p class="contxt">
						<strong>
						     	  탈퇴 후에는 아이디 <em><%=loginUser.getUserId() %></em> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
						     <br>
								 게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>또한, 네이버 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다. 
							</strong>
					</p>
					<input type="checkbox" id="dropoutAgree" name="dropoutAgree" onclick="clickcr(this,'otn.guideagree','','',event);" >
					<label for="dropoutAgree"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
					</div><br><br>
						<div class="spc_header">
		
				<p class="contxt">안전한 자견단 사용을 위해 비밀번호를 다시 한 번 입력해주세요.</p>
			</div>
<form id="deleteForm" action="<%= request.getContextPath() %>/deleteUser" method="post">
			<input type="hidden" id="token_help" name="token_help" value="pfpgbDn8SH8oFTM1" />
			<input type="hidden" id="encPasswd" name="encPasswd">
			<input type="hidden" id="encNm" name="encNm">
			<div class="spc_content">
				    <p class="spc_row"><span class="txt_userid"><%=loginUser.getUserId() %></span></p>
					<p class="spc_row2">
					<input type="password" id="userPwd" name="userPwd" maxlength="20" placeholder="비밀번호">
					</p>
					<div id="b">
					<p class="btn_area_btm">

						<button type="submit">확인</button>
						
					</p>
					</div>
			</div>
</form>
					
					
				</div>	</table>		
		</div>
	</div>					 
    </div>
    </div>
    	</div>
	</div>
	</div>
<script>

</script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>