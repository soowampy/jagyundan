<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, purchase.model.vo.* , common.model.vo.*"%>
	<%
	
	ProductPurchase pb =(ProductPurchase)request.getAttribute("plist");
	
	ArrayList<IMG> flist = (ArrayList<IMG>)request.getAttribute("flist");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/mypage/market/myMarketDetailView2.css" />
<style>


#contents2 {
	width: 100%;
	height: 100%;
}

.boardOrder {
	width: 100%;
}



.container2 {
	margin-top: 2%;
	width: 100%;
	margin-bottom: 15%;
	font-size: 11pt;
}

.tableArea {
	width: 70%;
	padding: 1%;
	margin-left: 7%;
	margin-top: 1%;
}
</style>

</head>
<body>

				<%@ include file="../common/mpNavibar.jsp"%>
				<div class="tableArea">

				<h1>주문내역 조회</h1>
					<div id="wrapa">
						<div id="contents2">
							<form id="detailForm" name="detailForm">
								<input id="order_id" name="order_id" 
									fw-label="주문번호" 
									type="hidden" />
								<div class="xans-element- xans-myshop xans-myshop-orderhistorydetail xans-record-">
									<div class="orderArea">
										<div class="boardView">
											<table border="1" summary="">
												<tbody>
													<tr>
														<th scope="row">주문번호</th>
														<td><%=pb.getProduct_no() %></td>
													</tr>
													<tr>
														<th scope="row">주문일자</th>
														<td><%=pb.getBuy_date() %></td>
													</tr>
													<tr>
														<th scope="row">주문자</th>
														<td><span class="authssl_order_name"><%=pb.getGet_people() %></span></td>
													</tr>
													<tr>
														<th scope="row">주문처리상태</th>
														<td>
														<% if(pb.getBox_num().equals("N")){ %>
														<p><b>배송준비</b></p>
														<% }else{ %>
														<p><b>배송완료</b>
														우체국택배 <a href="#none" class="line" onclick="window.open('http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=<%=Integer.parseInt(pb.getBox_num()) %>', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;">[<%=pb.getBox_num() %>]</a>
														
														</p>

															
														<% } %></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="orderArea">
										<h3>배송지 정보</h3>
										<div class="boardView">
											<table border="1" summary="">
												<caption>배송지 정보</caption>
												<tbody>
													<tr>
														<th scope="row">수취인</th>
														<td><span class="authssl_delivery_name"><%=pb.getGet_people() %></span></td>
													</tr>
													<tr>
														<th scope="row">주소</th>
														<td><span class="authssl_delivery_addr"><%=pb.getGet_where() %></span></td>
													</tr>
													<tr>
														<th scope="row">연락처</th>
														<td><span class="authssl_delivery_phone"><%=pb.getGet_phone().substring(0,3) %> - 
														<%=pb.getGet_phone().substring(4,8) %> -
														<%=pb.getGet_phone().substring(9,13) %></span></td>
													</tr>
													<tr>
														<th scope="row">배송메세지</th>
														<td><span class="authssl_delivery_message"></span></td>
													</tr>

												</tbody>
											</table>
										</div>
									</div>
									<div class="orderList">
										<h3>주문 상품 정보</h3>

										<table border="1" summary="" class="boardOrder ">
											<caption>기본 배송 주문서</caption>
											<colgroup>
											<col width="73px" />
												<col width="90px" />
												<col width="auto" />
												<col width="87px" />
												
												<col width="70px" />
												<col width="62px" />
												<col width="80px" />
												<col width="62px" />
												<col width="62px" />
											</colgroup>
											<thead>
												<tr>
												<th scope="col">상품번호</th>
													<th scope="col">이미지</th>
													<th scope="col">상품명</th>
													<th scope="col">판매가</th>
													
													<th scope="col">수량</th>
													<th scope="col">처리상태</th>
													<th scope="col">배송관련</th>
													<th scope="col" colspan="2">배송추적</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<td colspan="9"><strong class="type">[ 기본 배송
															]</strong> 상품구매금액 <strong><%=pb.getPrice() %></strong> 
														+ 특수지역배송비 <strong>0</strong> = <strong class="total">합계
															: <%=pb.getPrice() %> 원</strong></td>
												</tr>
											</tfoot>
											<tbody
												class="xans-element- xans-myshop xans-myshop-orderhistorydetailbasic">
												<tr class="xans-record-">
												<td class="mileage"><%=pb.getBuy_no() %></td>
													<td class="thumb">											<% for(IMG at : flist){ %>
						                            <% if(pb.getProduct_no() == at.getProductNo()){ %>
													
													 <a href=""><img src="<%= request.getContextPath() %>/resources/productBoard/<%= at.getChangeName() %>"/></a>
													
													<% } %>
					                            <% } %></td>
													<td class="prduct">
															 														<p>
															<a href="<%= request.getContextPath() %>/ProductBoardDetailServlet?product_No=<%=pb.getProduct_no()%>"><%=pb.getProduct_name() %></a>
														</p></strong>
													</td>
													<td class="sell"><%=pb.getPrice() %></td>
													
													<td><%=pb.getAmount() %></td>
													<td>기본배송</td>
													
													
													<td class="state">
													<% if(pb.getBox_num().equals("N")){ %>
														<p>배송준비</p>
														<% }else{ %>
														<p>배송완료</p>
														<td>
															우체국
														<p class="">
															<a href="#none" class="line" onclick="window.open('http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=<%=Integer.parseInt(pb.getBox_num()) %>', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;">[<%=pb.getBox_num() %>]</a>
														</p>
														<% } %>
													</td>

													<td></td>
												</tr>
											
											</tbody>
										</table>
									</div>
									<div
										class="xans-element- xans-myshop xans-myshop-orderhistorydetailpayment orderArea">
										<h3>결제 정보</h3>
										<div class="boardList">
											<table border="1" summary="">
												<caption>결제 정보</caption>
												<colgroup>
													<col width="20%" />
													<col width="30%" />
													<col width="auto" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col">결제방법</th>
														<th scope="col">결제금액</th>
														<th scope="col">세부내역</th>
													</tr>
												</thead>
												<tbody>
													<tr class="xans-record-">
														<th scope="row">총 주문금액</th>
														<td class="center"><%=pb.getPrice() %> 원</td>
														<td class="detail"></td>

													</tr>
													<tr class="xans-record-">
														<th scope="row">카카오페이</th>
														<td class="center">59,600원</td>
														<td class="detail"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
							</form>

							<div class="help">
								<b>거래명세서 발행 안내</b>
								<ul>
									<li>거래명세서는 영수증용도로도 사용이 가능합니다.</li>
								</ul>
								<b>신용카드매출전표 발행 안내</b>
								<ul>
									<li>신용카드 결제는 사용하는 PG사 명의로 발행됩니다.</li>
								</ul>
								<b>세금계산서 발행 안내</b>
								<ul>
									<li>부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수
										있습니다.</li>
									<li>세금계산서는 사업자만 신청하실 수 있습니다.</li>
									<li>배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
									<li>[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스()로 사업자등록증사본을
										보내셔야 세금계산서 발생이 가능합니다.</li>
									<li>[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
									<li>세금계산서는 실결제금액에 대해서만 발행됩니다.(적립금과 할인금액은 세금계산서 금액에서 제외됨)</li>
								</ul>
								<b>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경 안내</b>
								<ul>
									<li>변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서
										발행이 불가하며 신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
									<li>상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을
										양지하여 주시기 바랍니다.</li>
								</ul>
								<b>현금영수증 이용안내</b>
								<ul>
									<li>현금영수증은 5,000원 이상의 거래에 대해 발행이 됩니다.</li>
									<li>현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
									<li>발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
									<li>현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수
										있습니다.)</li>
									<li>현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
					</div>
	</div>				</div>
					</div>
	</div>
				<%@ include file="../../common/footer.jsp"%>
</body>
</html>