<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, purchase.model.vo.* , common.model.vo.*"%>
	<%
	
	ArrayList<ProductPurchase> plist = (ArrayList<ProductPurchase>)request.getAttribute("plist");
	
	ArrayList<IMG> flist = (ArrayList<IMG>)request.getAttribute("flist");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/mypage/market/myMarket3.css" />
<style>
.tableArea {
	width: 70%;
	padding: 1%;
	margin-left: 7%;
	margin-top: 1%;
}

.container2 {
	margin-top: 2%; width : 100%;
}
*{
font-size:11pt;
}
</style>
</head>
<body>
<%@ include file="../common/mpNavibar.jsp"%>
<div class="tableArea">
<div id="">
								<div class="orderHistory">
									<div class="xans-element- xans-myshop xans-myshop-orderhistorytab ">
										<ul>
											<li class="selected"><a
												href="/myshop/order/list.html?history_start_date=2019-09-09&history_end_date=2019-12-08&past_year=2018">주문내역조회
													(<%=plist.size() %>)</a></li>

										</ul>
									</div>

									<form method="GET" id="OrderHistoryForm"
										name="OrderHistoryForm">
										<div
											class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">

											<ul>

												<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
												<li>주문취소는 배송 전 문의게시판을 이용해주세요.</li>
											</ul>
										</div>
										<input id="mode" name="mode" value="" type="hidden" /> <input
											id="term" name="term" value="" type="hidden" />
									</form>
									<div
										class="xans-element- xans-myshop xans-myshop-orderhistorylistitem">
										<div class="titleArea"></div>
										<table border="1" summary="">
											<caption>주문주문 상품 정보 상품 정보 목록</caption>
											<thead>
												<tr>
													<th scope="col" class="number">주문일자<br>[주문번호]
													</th>
													<th scope="col" class="product">상품정보</th>
													<th scope="col" class="quantity">수량</th>
													<th scope="col" class="price">상품구매금액</th>
													<th scope="col" class="state">주문처리상태</th>
													<th scope="col" class="service">주문취소</th>
												</tr>
											</thead>
											<tbody class="">			
											<!-- 구매내역 리스트  -->
											<%if (!(plist.isEmpty())) {%>
											<% for(ProductPurchase pb : plist){ %>
												<tr class="xans-record-">
												   <input type="hidden" value="<%= pb.getProduct_no() %>"> 
													<td class="number "><%= pb.getBuy_date() %>
														<p><!-- detail.html?order_id=20191201-0003711&page=1&history_start_date=2019-09-09&history_end_date=2019-12-08 -->
															<a href="<%= request.getContextPath() %>/myMarketDetail?bId=<%=pb.getBuy_no()%>">[<%= pb.getBuy_no() %>]</a>
														</p> <a href="#none" class="displaynone" onclick="OrderHistory.orderCancel('20191201-0003711')"><img src="" alt="주문취소" /></a>
													</td>
													<td class="product">
												<% for(IMG at : flist){ %>
						                            <% if(pb.getProduct_no() == at.getProductNo()){ %>
													<span class="thumb">
													 <a href=""><img src="<%= request.getContextPath() %>/resources/productBoard/<%= at.getChangeName() %>"/></a>
													</span>
													<% } %>
					                            <% } %>
														<p>
															<a href="<%= request.getContextPath() %>/ProductBoardDetailServlet?product_No=<%=pb.getProduct_no()%>"><%= pb.getProduct_name() %></a>
														</p>
														<p class="free displaynone"></p></td>
													<td><%= pb.getAmount() %></td>
													<td><strong><%= pb.getPrice() %>원</strong>
														<div class="displaynone"></div></td>
													<td class="state">
													
													<% if(pb.getBox_num().equals("N")){ %>
														<p>배송준비</p>
														<% }else{ %>
														<p>배송완료</p>
														<p class="">
															우체국택배
														</p>
														<p class="">
															<a href="#none" class="line" onclick="window.open('http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=<%=pb.getBox_num() %>', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;">[<%=pb.getBox_num() %>]</a>
														</p>
														<% } %>
														
													</td>
                                                    <td class="service">
														<p class="displaynone">
															<a href="#none" onclick="OrderHistory.getDetailInfo('?product_no=9991&cate_no=64&order_id=20191201-0003711&ord_item_code=20191201-0003711-01');" class="line">[상세정보]</a>
														</p>
														<form action="<%= request.getContextPath() %>/RefundInsertServlet" method="post">
					                                       <input id="buy_no" name="buy_no" type="hidden" value="<%= pb.getBuy_no() %>"> 
														<% if(pb.getRefund().equals("N")){ %>
														<button id="refundNow">환불하기</button>
														<%}else if(pb.getRefund().equals("O")){ %>
														 <p>환불 완료</p>
														<%}else {%>
														 <p>환불 대기</p>
														<%} %>
														</form>
													</td>
												</tr>
												</tbody>
									<% } %>
<%}else{ %>
											

											<tbody >
												<tr>
													<td colspan="6" class="empty">주문 내역이 없습니다</td>
												</tr>
											</tbody>
											<%} %>
										</table>
									</div>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

</body>
<%@ include file="../../common/footer.jsp"%>
</html>