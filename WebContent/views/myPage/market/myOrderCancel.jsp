<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link
	href="<%=request.getContextPath()%>/resources/market/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="<%=request.getContextPath()%>/resources/market/css/agency.min.css"
	rel="stylesheet">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
   
.container2 {
	margin-top: 2%; width : 100%;
	margin-bottom: 10%;
}

.tableArea{
width:70%;
padding:1%;
margin-left:7%;
margin-top:1%;
}
#table1 {
	width: 100%;
	font-size: 20px;
	text-align: center;
}
#table1 td{  
	height : 50px;
}

.tablee {
	width: 100%;
}
.tablee td{
	padding:10px;
}

 .text , .select{
        width:200px;
        height:40px;
        border: 1px solid rgba(0, 128, 0, 0.507);
        background-color: rgba(0, 0, 0, 0.048);
    }
    .textt{
         width:250px;
        height:40px;
        border: 1px solid rgba(0, 128, 0, 0.507);
        background-color: rgba(0, 0, 0, 0.048);
    }
    #insertBtn{
     height:100%;
     width: 35%;
    }
     #buyNow{
     text-align:center;
     height:100%;
     width: 100%;
    }
    
        #divv{
            width: 100%;
            height: 300px;
            border: 1px solid black;
            margin: auto;
        }

</style>
</head>
<body>
		<%@ include file="../common/mpNavibar.jsp"%>

		
<div class="tableArea">


<section class="page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<!--  -->

				<div class="col-md-4 col-sm-6 portfolio-item">
					<div class="portfolio-hover-content">
						<i class="fas fa-plus fa-3x"></i>
					</div>
					<img class="img-fluid" src="<%= request.getContextPath() %>/resources/productBoard/imgg/강아지1.jpg" alt="" id="test1">
					</a>
				</div>

				<div id="content">
					<h2>[새움] MY Calendar 셀프 탁상형 달력</h2>
					<br> <br>
					<table id="table1">
						<tr>
							<td width="20%">판매가</td>
							<td width="60%"></td>
							<td width="20%">47,000원</td>
						</tr>
						<tr>
							<td width="20%">배송비</td>
							<td width="60%"></td>
							<td width="20%">무료</td>
						</tr>
						<tr>
							<td width="20%">사이즈</td>
							<td width="60%"></td>
							<td width="20%">L</td>
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
			<hr>
			<h2>환불 정보</h2>
			<hr>
			<br>
			<div id="wrap">
				<table class="tablee">
					<tr>
						<td><label>*이름</label></td>
						<td><input type="text" name="name" id="name" class="text" required></td>
						<td><span id="nameresult"></span></td>
					</tr>
					<tr>
						<td><label>*핸드폰번호</label></td>
						<td><select id="searchCondition" name="searchCondition" class="text">
								<option>----</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="010">010</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select>- <input type="text" name="tel2" id="tel2" class="text" maxlenght="4">-
							<input type="text" name="tel3" id="tel3" class="text" maxlength="4"></td>
						<td><span id="nameresult"></span></td>
					</tr>
					<tr>
						<td><label>*이메일</label></td>
						<td><input type="email" name="email" id="email" class="text" required>@
							<input type="email" name="email" id="email" class="text" required></td>
						<td><span id="nameresult"></span></td>
					</tr>
					<tr>
						<td>*주소</td>
						<td>
						<input type="text" id="sample6_postcode" class="text" placeholder="우편번호"> &nbsp; 
						<button class="btn btn-outline-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호 찾기</button>
						</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" id="sample6_address" class="text" placeholder="주소">
							&nbsp; <input type="text" id="sample6_detailAddress" class="textt" placeholder="상세주소"></td>
						<td>
					</tr>
				</table>
			</div>


<br><hr><br>
 <div>
            <div>
                <textarea class="container" id="divv">환불약관어쩌고ㅓ저저ㅉ고</textarea>
                 <label>동의</label>&nbsp;<input type="checkbox" id="exampleCheck1"><span id="checkedtext1"></span>

            </div>
            <div>






								<br> <br>
			<div id="content">
					<h4>주문 요약</h4>
					<hr>
					<table id="table1">
						<tr>
							<td width="20%">총 상품금액</td>
							<td width="60%"></td>
							<td width="20%">47,000원</td>
						</tr>
						<tr>
							<td width="20%">배송비</td>
							<td width="60%"></td>
							<td width="20%">무료</td>
						</tr>
						<tr>
							<td width="20%">제주,도서산간배송비</td>
							<td width="60%"></td>
							<td width="20%">0원</td>
						</tr>
						<tr>
							<td width="20%">쿠폰사용</td>
							<td width="60%"></td>
							<td width="20%">0원</td>
						</tr>
						<tr>
							<td width="20%">적립금 사용</td>
							<td width="60%"></td>
							<td width="20%">0원</td>
						</tr>
						<tr>
							<td width="20%">총 상품금액</td>
							<td width="60%"></td>
							<td width="20%"><h4>47,000원</h4></td>
						</tr>
					</table>
					<hr>
					
				</div><br><br><br>
					<div id="buyNow">
					<button id="insertBtn" onclick="" class="btn btn-outline-success">환불하기</button>
					</div>


		</div>
	</section>



	<!-- 우편번호 서비스  -->
	<script>
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
								// 조합된 참고항목을 해당 필드에 넣는다.

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
	</div></div></div></div></div></div></div>
</body>
</html>