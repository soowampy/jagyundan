<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar, java.util.ArrayList, petsitter.model.vo.*, common.model.vo.*"%>
<%
	
	Reservation reserv = (Reservation)request.getAttribute("reserv");
	PsInfoDetail pid = (PsInfoDetail)request.getAttribute("pid");
	String psImage = (String)request.getAttribute("psImage");
	String service = (String)request.getAttribute("service");
	int servicePrice = (Integer)request.getAttribute("servicePrice");
	int finalPrice = (Integer)request.getAttribute("finalPrice");
	int plusDog = reserv.getDogSu();
	int plusDogPrice = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 결제 api -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.border{
	border:1px solid black;
}
/*----------전체 구조 틀------------*/
.before-pay-wrapper{
	width:75%;
	margin:auto;
	height:200vh;
	margin-top:3%;
	padding-left:10%;
	padding-right:10%;
}
.ps-profile{
	width:100%;
	height:9%;
}
.price-info-wrapper{
	width:100%;
	height:18%;
	position:relative;
	padding:10px;
}
.reserv-caution{
	width:100%;
	height:15%;
	margin-top:5%;
	background-color:#F6E3CE;
	padding:15px
}
.reserv-require{
	width:100%;
	height:20%;
	padding:15px
}
.reserv-premeet{
	width:100%;
	height:8%;
	margin-top:1%;
}
.agreement{
	width:100%;
	height:10%;
	font-size:0.8rem;
	margin-top:2%;
}
.reserv-btn{
	margin-top:5%;
	width:100%;
	height:5%;
}
/*----------------------------------------------*/
.ps-img-dog{
	height:100px;
	width:100px;
	position:relative;
}
.ps-img{
	height:100%;
	width:100%;
	border-radius:50%;
	border:1px solid green;
	padding:3%
}
.ps-dog{
	position:absolute;
	height:50px;
	width:50px;
	bottom:-5px;
	right:-10px;
	border-radius:50%;
	z-index:1;
	border:2px solid #FFBF00;
}
.reserv-intro{
	width:100%;
	height:100%;
	margin-top:2%;
}
.reserv-intro1{
	margin-left:18%;
	font-size:1.8rem;
}
.reserv-intro2{
	margin-left:18%;
}
.ri-sp1{
	font-size:1.5rem;
}
.ri-sp2{
	font-size:1.3rem;
}
/*-----------------가격 부분----------------------------*/
.insert-date{
	width:100%;
	height:5%;
}
.price-info-detail{
	width:100%;
	height:100%;
}
.price-inf0{
	width:100%;
	height:22%;
	position:relative;
}
.price-info1{
	width:100%;
	height:20%;
	margin-left:30%;
}
.price-info2{
	width:100%;
	height:80%;
}
.howMuch{
	width:50%;
	text-align:left;
	margin-top:2%;
}
.real-price{
	width:50%;
	text-align:right;
	margin-top:2%;
}
.add-pet{
	width:60%;
	text-align:left;
	padding-top:2%;
	border-top:1px solid gray;
}
.add-pet-price{
	width:40%;
	text-align:right;
	padding-top:2%;
	border-top:1px solid gray;
}
.howMuch2{
	width:50%;
	text-align:left;
	border-top:1px solid gray;
	padding-top:2%;
	font-size:1.8rem;
	font-family: 'Do Hyeon', sans-serif;
	color:#FE642E;
}
.real-price2{
	width:50%;
	text-align:right;
	padding-top:2%;
	border-top:1px solid gray;
	font-size:1.8rem;
	font-family: 'Do Hyeon', sans-serif;
	color:#FE642E;
}
/*---------------------------------------------*/
.list{
	padding-left:2%;
}
#requirment{
	height:100%;
	width:100%;
	resize:none;
	border:0;
}
/*---------------------------------------------*/

/*---------------------------------------------*/
.checking{
	font-size:1.2rem;
}
.checkbox{
	height:15px;
	width:15px;
}
/*---------------------------------------------*/
.reserv-btn1{
	height:100%;
	width:30%;
	font-family: 'Do Hyeon', sans-serif;
	color:white;
	background-color:#FE642E;
	font-size:2rem;
	border:0;
	outline:0;
	border-radius:10px;
}
/*---------------------------------------------*/
.float-left{
	float:left;
}
.float-right{
	float:right;
}
.border-none{
	border:none;
	text-align:center;
}
/*---------------------------------------------*/
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function(){
		$("#startDate").val(<%= reserv.getStartDate() %>);
		$("#endDate").val(<%= reserv.getEndDate() %>);
		$("#service").text("<%= service %>");
		$("#servicePrice").text(<%= servicePrice%>)
		<%
			plusDogPrice =   servicePrice*plusDog;
		%>
		$("#plusDog").text(<%= plusDogPrice %>)
	})
</script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<form class="before-pay-wrapper" action="<%=request.getContextPath() %>/PsReservInsertServlet" method="post"> 
		<div class="ps-profile">
			<div class="ps-img-dog float-left">
				<div class="ps-img"><img src="<%= request.getContextPath() %>/resources/userimg/<%= psImage %>" style="height:100%;width:100%;border-radius:50%;"></div>
			</div>
			<div class="reserv-intro">
				<dl>
					<dt class="reserv-intro1"><span class="ri-sp1"><%= pid.getUserName() %></span><span class="ri-sp2">님에게 예약 요청 메시시를 보냅니다.</span></dt>
					<dd class="reserv-intro2">아래 예약 내역을 확인후 돌보미에게 문의하세요</dd>
				</dl>
			</div>
		</div>
		
		<div class="price-info-wrapper border">
				<div class="insert-date">
					<div style="border:1px solid #848484; border-radius: 3px; margin-top:20px">
						<input name="startDate" id="startDate" class="float-left border-none" type="text" placeholder="시작 날짜" readonly style="width:45%;">
						<span class="float-left" style="width:10%; text-align:center">&gt;</span>
						<input name="endDate" id="endDate"class="float-left border-none" type="text" placeholder="끝나는 날짜" readonly style="width:45%;">				
						<br clear="both">
					</div>
				</div>
				<div class="price-info">
					<div class="price-info2">
						<dl class="price-info-detail">
							<dt class="howMuch float-left"><p id="service"></p></dt>
							<dd class="real-price float-left"><p id="servicePrice"></p></dd>
							<br clear="both">
							<dt class="add-pet float-left">반려견 :&nbsp;<span><%= plusDog %>마리</span></dt>
							<dd class="add-pet-price float-left"><p id="plusDog"></p></dd>
							<br clear="both">
							<dt class="howMuch2 float-left">최종금액</dt>
							<dd class="real-price2 float-left"> <%= finalPrice %>원</dd>
						</dl>
					</div>
				</div>
		</div>
		<div class="reserv-caution">
			<h4 style="font-family: 'Do Hyeon', sans-serif;">예약 요청 전 꼭 확인해주세요.</h4>
			<ul class="list">
            <li>예약을 위해 강아지에 대한 내용을 돌보미에게 상세히 적어주세요.</li>
            <li>환불은 예약 3일전까지 100% 가능합니다.</li>
            <li>메시지 내용은 안전거래 등의 목적으로 회사가 열람, 수집할 수 있습니다</li>
            <li>개인 연락처를 공유하지마세요. 예약이 완료되면 돌보미의 연락처를 확인하실 수 있습니다.</li>
            <li>요청사항을 적지 않고 따로 요청 하실 사항은 해당 펫시터에게 직접 요청하시면 됩니다!</li>
			</ul>
		</div>
		<div class="reserv-require border">
			<textarea name="requirment" id="requirment" placeholder="이욱재 돌보미에게 예약 요청을 위해 메시지를 남겨주세요"></textarea>
		</div>
		<div class="agreement">요청 시 잘못된 정보를 전달할 경우 이로인해 발생되는 문제에 대한 책임은 의뢰인 본인에게 있습니다.
'예약 요청'을 클릭하면 서비스 총액을 지불하는 것과 서비스 약관, 환불정책에 동의하는 것입니다.
돌보미가 예약 요청을 수락해야 결제를 진행 할 수 있으며, 24시간 이내에 돌보미가 요청에 대한 응답을 할 것 입니다.
고객이 펫시터에게 성적 수치심을 느끼게 하거나 정신적으로 고통을 입을 수 있는 언행을 했을 시, 펫시터가 손해배상을 청구할 수 있습니다. 또한 성희롱이 정도를 넘어 성범죄에 해당 하는 경우에는 형법, 성폭력범죄의 처벌 등에 관한 특례법 위반 등으로 형사처벌을 받을 수 있습니다.
			<br><br>
			<input id="checkId" type="checkbox" class="checkbox"/> 
			<label for="checkId" class="checking">해당 내용을 확인했습니다.</label>
		</div>
		<div class="reserv-btn">
 			<button type="button" class="reserv-btn1" onclick="checkValidate()">예약요청</button>
 			<button id="reserv-btn" class="reserv-btn2" style="display:none"></button>
		</div>
		<input type="text" name="plusDog" style="display:none" value="<%= plusDog %>"> <!-- 추가 강아지 -->
		<input type="text" name="finalPrice" style="display:none" value="<%= finalPrice %>"> <!-- 최종 가격 -->
		<input type="text" name="psBoardNo" style="display:none" value="<%= reserv.getPsBoardNum() %>">
	</form>
	<%@ include file="../common/footer.jsp" %>
	<!-- 결제 api -->
	<script>
		function checkValidate(){
			var check = false;
			var checkMsg = "디폴트값";
			if($("#requirment").val().length<1){
				if(confirm("요청 사항이 정말 없으십니까?")){
					$("#requirment").val("없음");
				}else{
					$("#requirment").focus();
					return false;
				}
			}
			if (document.getElementById("checkId").checked == false){
				alert("내용을 확인후 확인 버튼을 눌러 주십시오");
				$("#checkId").focus();
				return false;
			}
			
			var IMP = window.IMP; // 생략가능
			IMP.init('imp20522573'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원. 이건 어떤 방식으로 결제를 할것인지가 들어감
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '펫시터 예약',
				amount : <%= finalPrice %>,
				buyer_email : "<%= loginUser.getEmail()%>",
				buyer_name : '<%= loginUser.getUserName()%>',
				buyer_tel : '<%= loginUser.getPhone()%>',
				buyer_addr : '<%= loginUser.getAddress()%>',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					alert(msg);
					$("#reserv-btn").click();
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					check = false;
					checkMsg = "결제 실패";
					alert(msg);
					location.href="<%=request.getContextPath()%>/SelectPsBoardList";
				}
			});
		}
	</script>
</body>
</html>