<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="productBoard.model.vo.* , common.model.vo.* , java.util.*"%>
	
	<%
	ProductBoard pb = (ProductBoard)request.getAttribute("productBoard");
	
	ArrayList<IMG> fileList = (ArrayList<IMG>)request.getAttribute("fileList");
	IMG titleImg = fileList.get(0);
	
	String size = (String)request.getAttribute("size");
	int amount = (int)request.getAttribute("amount");
	
	int finalPrice = pb.getPrice() * amount;
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 결제 api -->
<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/market/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
		
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/market/css/agency.min.css"
	rel="stylesheet">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<style>
/* 기본 정보 */
#table1 {
	width: 100%;
	font-size: 20px;
	text-align: center;
}
#table1 td {
	height: 50px;
}
.tablee {
	width: 100%;
}
.tablee td {
	padding: 10px;
}
#content{
   width:50%;
}

/* 텍스트 박스 폼  */
.text, .select {
	width: 200px;
	height: 40px;
	border: 1px solid rgba(0, 128, 0, 0.507);
}
.textt {
	width: 100%;
	height: 40px;
	border: 1px solid rgba(0, 128, 0, 0.507);
}

/* 결제하기 박스 , 버튼 */
#buyNow {
	text-align: center;
	height: 100%;
	width: 100%;
}
#insertBtn {
	height: 100%;
	width: 35%;
}
/* 약관 */
#divv {
	width: 100%;
	height: 300px;
	border: 1px solid black;
	margin: auto;
}
</style>

<%@ include file="../common/menubar.jsp"%>
<body>
	<section class="bg-light page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<!--  -->
				<div class="col-md-4 col-sm-6 portfolio-item">
					<div class="portfolio-hover-content">
						<i class="fas fa-plus fa-3x"></i>
					</div>
					<img class="img-fluid" src="<%= request.getContextPath() %>/resources/productBoard/<%= titleImg.getChangeName() %>" alt="" id="test1">
				</div>
				<!-- 기본 정보 -->
				<div id="content">
					<h2 align="center"><%= pb.getProductName() %></h2>
					<br> <br>
					<table id="table1">
						<tr>
							<td width="20%">판매가</td>
							<td width="60%"></td>
							<td width="20%"><%= pb.getPrice() %>원</td>
						</tr>
						<tr>
							<td width="20%">배송비</td>
							<td width="60%"></td>
							<td width="20%">무료</td>
						</tr>
						<tr>
							<td width="20%">사이즈</td>
							<td width="60%"></td>
							<td  width="20%"><%= size %></td>
						</tr>
						<tr>
							<td width="20%">수량</td>
							<td width="60%"></td>
							<td  width="20%"><%= amount %></td>
						</tr>
					</table>
					<hr>
				</div>
				<pre>
※ 구매 금액에 따라 배송비 차등 적용됩니다.(50,000원 미만: 3,000원)
※ 제주/ 도서산간 배송지의 경우 배송비가 추가됩니다.
※ 제주도 3000원, 제주도 외 도서산간 2000원
				</pre>
			</div>

			<!-- 배송지 정보 -->
			<h2>배송지 정보</h2>
			<hr>
			<br>
			<form action="<%= request.getContextPath() %>/PurchaseInsertServlet" method="post">
			<div id="wrap">
			    <input name="userNo" type="hidden" value="<%= loginUser.getUserNo() %>">
				<input name="productNo" type="hidden" value="<%= pb.getProductNo() %>">
				<input name="amount" type="hidden" value="<%= amount %>">
				<input name="finalPrice" type="hidden" value="<%= finalPrice %>">
				 
				<table class="tablee">
					<tr>
						<td><label>*이름</label></td>
						<td><input type="text" name="name" id="buyName" class="text" required></td>
						<td><span id="nameresult"></span></td>
					</tr>
					<tr>
						<td><label>*핸드폰번호</label></td>
						<td><select id="searchCondition" name="tel1" class="text">
								<option>----</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select>- <input type="text" name="tel2" id="tel2" class="text" maxlength="4">- 
						<input type="text" name="tel3" id="tel3" class="text" maxlength="4"></td>
						<td><span id="nameresult"></span></td>
					</tr>
					<tr>
						<td>*주소</td>
						<td><input type="text" id="sample6_postcode" name="address1" class="text" placeholder="우편번호" required> &nbsp;
							<button type="Button" class="btn btn-outline-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호
								찾기</button></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" id="sample6_address" name="address2" class="textt"placeholder="주소"></td>
					</tr>
					<tr>
					<td></td>
					<td><input type="text"id="sample6_detailAddress" name="address3" class="textt" placeholder="상세주소"></td>
					</tr>
				</table>
			</div>
			<br>
			<hr>
			<br>
			<!-- 약관 -->
				<div>
					<label>&lt;인터넷 서비스 이용 약관&gt;</label>&nbsp;
					<textarea class="container" id="divv">제 1조 (목적) 이 약관은 김대성재단(이하 “본 재단”이라 한다)과 이용자간에 “본 재단”이 운영하는 김대성 홈페이지(이하 “사이트”라 한다), 또는 향후 구축되는 홈페이지에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)의 가입조건 및 이용에 관한 제반 사항과 기타 필요한 사항에 대하여 규정함을 목적으로 합니다. 제 2조 (정의) 1. “사이트”란 “본 재단”이 인터넷 (관련) 서비스를 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 구축한 웹 사이트를 말합니다. 2. “이용자”란 “사이트”에 접속하여 이 약관에 따라 “사이트”가 제공하는 서비스를 받는 인터넷 회원 및 비회원을 말합니다. 3. “인터넷 회원”이라 함은 “사이트”에 개인정보를 제공하여 회원등록을 한 자로서, “사이트”의 정보를 지속적으로 제공받으며, “사이트”에서 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다. 4. “비회원”이라 함은 인터넷 회원에 가입하지 않고 “사이트”가 제공하는 서비스를 이용하는 자를 말합니다. 5. 위에서 정하는 것 외의 용어의 정의는 관계법령 및 본 센터가 정하는 바에 의합니다. 제 3조 (약관의 명시와 개정) 1. “본 재단”은 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. 2. “본 재단”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 사이트 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 3. “본 재단”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에는 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관이 그대로 적용됩니다. 단, 이미 계약을 체결한 이용자가 개정약관을 적용 받고자 하는 뜻을 개정약관의 공지기간 내에 “사이트”에 송신하여 “본 재단”의 승낙을 받은 경우에는 개정약관이 적용됩니다. 4. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 및 관례에 따릅니다. 5. 본 약관은 이용자가 동의 함으로써 효력이 발생하며, 변경된 약관은 공지기간이 종료하는 익일부터 효력이 발생합니다. 제 4조(서비스의 내용) 1. “사이트”에서 제공하는 서비스는 다음과 같습니다. 가. “본 재단”이 운영하는 Museum SAN 정보안내 서비스 나. 소식 메일 전송 서비스 다. 기타 “본 재단”이 정하거나 개발, 또는 다른 기관의 제휴를 받아 제공하는 서비스 라. 인터넷을 통한 각종 유/무료 프로그램 및 가입 신청 마. 온라인을 통한 인터넷 예매.등록을 통한 결제 서비스 2. “본 재단”은 필요한 경우 서비스의 내용을 추가 또는 변경할 수 있습니다. 이 경우 “본 재단”은 추가 또는 변경 내용을 인터넷 회원에게 통지합니다. 제 5조 (서비스의 이용 및 제한) 1. 서비스 이용은 “본 재단”의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24 시간을 원칙으로 합니다. 다만 컴퓨터 등 정보통신설비의 보수, 점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 2. 서비스 중단의 경우 “본 재단”은 해당 홈페이지를 통해 이용자에게 사전 통지합니다. 단, “본 재단”이 통제할 수 없는 부득이한 사유(시스템 관리자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)로 인하여 사전 통지가 불가능한 경우에는 그러지 아니합니다. 제 6조 (서비스의 사용료) 1. 본 재단이 서비스를 유료화할 경우 유료화의 시기, 정책, 비용에 대하여 유료화 실시 이전에 사이트에 공시하여야 합니다. 제 7조 (인터넷 회원가입) 1. 이용자는 “사이트”에 정해진 가입신청 양식에 따라 개인정보를 입력한 후 이 약관에 동의한다는 의사표시를 함으로서 인터넷 회원가입을 신청합니다. 2. 만 14세 미만의 아동이 회원 가입하여 “사이트”를 정상적으로 이용하기 위해서는 회사에서 정한 양식에 따라 법정대리인의 사전동의가 필요합니다. 법정대리인의 동의 이전에는 “사이트”를 정상적 이용이 불가능 하며 “본 재단”이 정한 기간내에 법정대리인의 동의가 없는 경우 “본 재단”은 시한을 정하여 발급받은 아이디를 경고없이 삭제할 수 있습니다. 3. “본 재단”은 인터넷 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 인터넷 회원 등록을 승낙합니다. 1) 기타 인터넷 회원으로 등록하는 것이 “사이트”의 기술상 현저히 지장이 있다고 판단되는 경우 2) 가입신청자가 이 약관 제 9조에서 정한 사유로 인하여 이전에 인터넷 회원 자격을 상실한 적이 있는 경우 인터넷 회원자격 상실 후 1년이 경과하지 않은 자(단, “본 재단”의 승낙을 얻은 경우에는 예외로 합니다.) 4. 이 약관 제 9조에 해당하지 않는 사용자로 재가입을 원하는 사용자는 본인임을 확인할 수 있는 이름, ID, 생년월일, 휴대전화번호, 이메일을 알려주는 경우 재가입이 승낙됩니다. 5. 인터넷 회원 이용계약의 성립 시기는 인터넷 회원가입 직후 가입통보 연락을 받은 시점으로 합니다. 6. 인터넷 회원은 등록사항에 변경이 있는 경우, 즉시 이메일 등 기타 방법으로 “본 재단”에 그 변경사항을 알려야 합니다. 제 8조 (인터넷 회원 탈퇴) 1. 인터넷 회원은 언제든지 “사이트”에서 본인임을 확인할 수 있는 이름, 생년월일, 휴대전화번호, 이메일주소를 제공한 후 탈퇴할 수 있습니다. 2. 탈퇴 여부는 기존의 ID와 비밀번호로 로그인이 되지 않는 것으로 확인이 가능합니다. 제 9조 (인터넷 회원 자격 상실) 1. 인터넷 회원 및 이용자가 다음 각 호의 사유에 해당하는 경우, “본 재단”은 인터넷 회원자격을 제한, 정지 또는 상실시킬 수 있습니다. 1) 가입 신청 시에 허위 내용을 등록한 경우 2) 다른 사람의 “사이트” 이용을 방해하거나 그 정보를 도용하는 등 사이트 운영질서를 위협하는 경우 3) “사이트”를 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 4) “본 재단”이 인터넷 회원에게 시정을 요구한 후에도 동일한 행위가 반복 되거나 일정기간 안에 그 사유가 시정되지 아니하는 경우 5) 타인의 ID와 비밀번호 등의 정보를 도용한 경우 6) “사이트” 내에서 컴퓨터 바이러스 프로그램을 유포하는 경우 7) “사이트” 및 회원, 제 3자의 지적재산권을 침해하고 시정을 거부하는 경우 8) “사이트” 및 회원, 제 3자의 명예를 손상시키거나 업무를 방해하는 행위 2. “본 재단”이 인터넷 회원자격을 상실시키는 경우에는 인터넷 회원등록을 말소합니다. 이 경우 인터넷 회원에게 이를 통지하고, 인터넷 회원등록 말소 전에 소명할 기회를 부여합니다. 제 10조 (인터넷 회원에 대한 통지) “본 재단”이 인터넷회 원에 대한 각 종 통지를 하는 경우, 인터넷 회원의 이메일로 통지함을 원칙으로 합니다. “본 재단”은 불특정다수 인터넷 회원에 대한 통지의 경우 일정기간 동안 “사이트” 게시판에 게시함으로써 개별통지를 대신할 수 있습니다. 제 11조(서비스이용계약의 성립) 1. 이용계약은 인터넷 회원가입 페이지에서 “인터넷 회원 약관에 동의하며 인터넷 회원 가입을 신청한다.”는 물음에 “동의” 버튼을 누르면 약관에 동의하는 것으로 인정하고 “본 재단” 홈페이지의 이용승낙으로 성립합니다. 2. “본 재단”의 승낙은 이용자의 인터넷 회원가입 직후 가입통보 메시지로 승낙 의사를 표시합니다. 제 12조 (재단의 의무) 1. “본 재단”은 특별한 사정이 없는 한 인터넷 회원이 서비스를 이용할 수 있도록 합니다. 2. “본 재단”은 이 약관에서 정한 바에 따라 계속적, 안정적으로 제공할 의무가 있습니다. 3. “본 재단”은 인터넷 회원으로부터 소정의 절차에 의해 제기되는 의견에 대해서 적절한 절차를 거쳐 처리하며, 처리시 일정기간이 소요될 경우 인터넷 회원에게 그 사유와 처리 일정을 알려주어야 합니다. 4. “본 재단”은 이용자가 안전하게 “사이트”를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안시스템을 갖추어야 합니다. 5. “본 재단”은 본 재단 사업을 알리고 후원을 요청하는 공익성 이메일을 발송할 수 있습니다. 제 13조 (개인정보보호) 1. “본 재단”은 이용자의 개인정보수집시 서비스 제공에 필요한 최소한의 정보를 수집합니다. 1) 성명 2) 생년월일 3) 휴대전화번호 4) 희망 ID/비밀번호 5) 이메일주소 6) 주소 7) 멤버십 회원의 경우 멤버십 카드 고유번호 2. “본 재단”에 제공된 개인정보는 당해 이용자의 동의 없이 “사이트”에서 제공하는 서비스 목적 외의 이용이나 제 3자에게 제공할 수 없으며, (다만, 서비스의 운영과 관련하여 “본 재단”과 업무상제휴 관계에 있는 업체에게는 목적 범위 내에서 제공, 활용할 수 있습니다.) 정보 이용과 관련하여 이용자에게 손해가 발생한 경우 관계 법령에서 정하는 바에 따라 “본 재단”이 손해배상 책임을 부담합니다. 3. “본 재단”이 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(직장, 성명 및 전화번호, 기타 연락처), 정보의 수집 목적 및 이용목적, 제 3자에 대한 정보 제공 관련 사항(제공받는 자, 제공목적 및 제공할 정보의 내용) 등 정보통신망 이용촉진 및 정보보호등에 관한 법률의 규정을 준수합니다. 4. 이용자는 언제든지 “사이트”가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 이 경우 “본 재단”은 즉시 필요한 조치를 취할 의무가 있습니다. 이용자가 오류의 정정을 요구한 경우에 “본 재단”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다. 5. “본 재단”은 개인정보 보호를 위하여 관리책임자를 지정 운영하고 있으며, “본 재단”의 책임 없는 사유로 인하여 이용자의 개인정보가 분실, 도난, 유출, 변조 등이 이루어져 이용자에게 발생한 손해에 대하여는 책임을 지지 않습니다. 6. “본 재단” 또는 “본 재단”으 로부터 개인정보를 제공받은 제 3자는 개인정보의 수집 목적 및 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다. 제 14조 (인터넷 회원의 의무) 1. 인터넷 회원은 본 약관에서 규정하는 사항과 기타 “본 재단”이 정한 제반 규정, 공지사항 등 “본 재단”이 공지하는 사항 및 관계법령을 준수하여야 하며, 기타 회사의 업무에 방해가 되는 행위, “본 재단”의 명예를 손상시키는 행위를 해서는 안됩니다. 2. 인터넷 회원의 ID와 비밀번호에 관한 모든 관리의 책임은 인터넷 회원에게 있습니다. 3. 자신의 ID가 부정하게 사용된 경우, 인터넷 회원은 반드시 “본 재단”에 그 사실을 통보해야 합니다. 4. 인터넷 회원은 “본 재단”의 사전 허락 없이 서비스를 이용하여 어떠한 영업활동도 할 수 없습니다. 제 15조 (게시물의 관리) “본 재단”은 이용자가 게시한 내용물에 대해서 다음 각 호에 해당하는 경우 사전 통보 없이 삭제 또는 등록거부를 할 수 있습니다. 1) 타인에 대한 인신공격성 발언, 저속한 표현 등을 사용한 경우 2) “사이트”가 제시한 게시기간을 초과하는 경우 3) 음란한 자료 혹은 음란사이트 관련 링크를 올리는 경우 4) “사이트”를 포함한 타인의 저작권을 침해한 게시물의 경우 5) 미풍양속을 저해하거나 관계법령에 위반되는 경우 6) 영리 목적의 글 또는 금전에 관련된 게시물 또는 관련 링크를 올리는 경우 제 16조 (저작권의 귀속 및 이용 제한) 1. “본 재단”이 작성한 게시물에 대한 저작권에 관한 권리는 “본 재단”에 귀속합니다. 이용자는 “사이트”를 이용함으로써 얻은 정보를 “본 재단”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 등 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다. 2. 게시물(이용자가 “사이트”에 업로딩한 글, 영상, 소리 등)에 대한 권리와 책임은 게시자인 이용자에게 있습니다. “본 재단”은 게시자의 동의 없이 게시물을 영리적 목적으로 사용하지 않습니다. 제 17조 (분쟁해결) 1. “본 재단”은 이용자가 제기하는 정당한 의견이나 불만을 적극 반영하고 그 피해를 최소화하는데 최대한 노력합니다. 2. 서비스이용과 관련한 분쟁에 대하여는 관계법령 및 관례에 따라 해결하기로 합니다. 제 18조 (면책조항) 1. 천재지변, 기타 불가항력으로 인하여 서비스의 중단 또는 이용자가 올린 데이터의 유실 혹은 손상시 “본 재단”은 책임이 면제됩니다. 2. “본 재단”은 이용자가 게재한 정보의 사실 여부, 정확도 등의 내용에 대해서는 책임을 지지 않습니다. 3. 서비스 이용과 관련하여 발생한 손해 중 이용자의 고의, 과실 등 “본 재단”의 귀책없는 사유로 인해 발생한 손해에 대하여는 책임이 면제됩니다. 4. “본 재단”은 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임이 면제됩니다. 5. “본 재단”은 이용자 상호간 및 제 3자 상호간에 서비스와 관련한 분쟁에 개입하지 않으며, 이로 인한 어떠한 손해배상 책임도 부담하지 않습니다.</textarea>
				</div>
				<div>
					<label>&lt;개인정보 보관 약관&gt;</label>&nbsp;
					<textarea class="container" id="divv">김대성은 수집한 개인정보를 다음의 목적을 위해 활용합니다. ● 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송 ● 회원 관리 회원제 서비스 이용에 따른 본인확인, 개인 식별, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리, 고지사항 전달 ● 마케팅 및 광고에 활용 이벤트 등 광고성 정보 전달 1) 수집된 개인정보는 정해진 목적 이외의 용도로는 이용되지 않으며 수집 목적이 변경될 경우 사전에 알리고 동의를 받을 예정입니다.</textarea>
				</div>
				<br>
				<br>
				<div>
					<h4>주문 요약</h4>
					<hr>
					<table id="table1">
						<tr>
							<td width="20%">총 상품금액</td>
							<td width="60%"></td>
							<td width="20%"><%= pb.getPrice() %>원</td>
						</tr>

						<tr>
							<td width="20%">배송비</td>
							<td width="60%"></td>
							<td width="20%">무료</td>
						</tr>
						<tr>
							<td width="20%">수량</td>
							<td width="60%"></td>
							<td width="20%"><%= amount %></td>
						</tr>
						<tr><td colspan="3"><hr></td></tr>
						<tr>
							<td width="20%"><h4>총 상품금액</h4></td>
							<td width="60%"></td>
							<td width="20%"><h4><%= finalPrice %>원</h4></td>
						</tr>
					</table>
					<hr>
				</div>
				<div id="buyNow">
					<button type="button" id="insertBtn"  class="btn btn-outline-success" onclick="buyNow()">결제하기</button>
				</div>
				<div id="buyy">
				     <button id="buy">PurchaseInsert</button>
				</div>
				</form>
			</div>
	</section>

	<script>
	<!-- 우편번호 서비스  -->
	$("#buyy").hide();
		function sample6_execDaumPostcode() {
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
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
		</script>
		
	<script>
	<%-- 결제 서비스 --%> 
	function buyNow(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp20522573'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
		pg : 'inicis', // version 1.1.0부터 지원. 이건 어떤 방식으로 결제를 할것인지가 들어감
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(), //카카오 메시지에 날짜 보냄
		name : "<%= pb.getProductName() %>" , // 상품명 
		amount : "<%= finalPrice %>" , //상품 수량
		buyer_email :  $("#email").val() , // email
		buyer_name : $("#buyName").val() ,//User에서 구매자 이름 가져와야함
		buyer_tel : $("#searchCondition").val() + "-" + $("#tel2").val() +"-" +$("#tel3").val() ,//User에서 구매자 폰번호 가져와야함
		buyer_addr : $("#sample6_address").val() ,//ProductBoard 에서 구매자 주소 가져옴
		buyer_postcode : $("#sample6_postcode").val()  , //ProductBoard 에서 구매자 주소 가져옴
		m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	},function(rsp) {
		if (rsp.success) {
			var msg = '결제가 ';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			$("#buy").click();
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg; // 사용자가 결제를 취소 하였습니다 . 등등 나오게 하는 메세지 
		//	location.href="#"; // 전송 위치
		}
		alert(msg);
	});
	}
	
	
	</script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>