<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, myPage.report.model.vo.*"%>
    <%
	Report r = (Report)request.getAttribute("reportDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>

<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/mypage/report/myReportDetail2.css" />
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


#comment{
width:85%;
}
</style>



</head>
<body>
<%@ include file="../common/mpNavibar.jsp"%>
				<div class="tableArea">
    <div id="">
        <div id="containera">
            <div id="contents2">
                <div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
                    <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                        <div class="title">
                            <h2>
                                <font color="#000000">1 : 1 문의</font>
                            </h2>
                        </div>
                    </div>
                    <form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post" target="_self"
                        enctype="multipart/form-data">
                        <input id="no" name="no" value="1372630" type="hidden" />
                        <input id="bulletin_no" name="bulletin_no" value="698685" type="hidden" />
                        <input id="board_no" name="board_no" value="1" type="hidden" />
                        <input id="member_id" name="member_id" value="sl0917" type="hidden" />
                        <input id="list_url" name="list_url" value="/board/free/list.html?board_no=1" type="hidden" />
                        <input id="bdf_modify_url" name="bdf_modify_url" value="/board/free/modify.html?board_act=edit&amp;no=1372630&amp;board_no=1"
                            type="hidden" />
                        <input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/1" type="hidden" />
                        <input id="bdf_action_type" name="bdf_action_type" value="" type="hidden" />
                        <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002 ">
                            <div class="boardView">
                                <table border="1" summary="">
                                    <caption>게시판 상세</caption>
                                    <tbody>
                                        <tr>
                                            <th scope="row">분류</th>
            <%if(r.getSingo()==1) {%>
            <td>불량 유저 신고</td>
            <%}else if(r.getSingo()==2){ %>
            <td>불량 펫시터 신고</td>
            <%}else if(r.getSingo()==3) {%>
            <td>상품 문의</td>
            <%}else if(r.getSingo()==4) {%>
            <td>배송 문의</td>
            <%}else if(r.getSingo()==5) {%>
            <td>주문/결제 문의</td>
            <%} %>
                                        </tr>
                                        <tr>
                                            <th scope="row">제목</th>
                                            <td><%=r.getTitle() %></td>
                                        </tr>
                                                                                <tr>
                                            <th scope="row">작성일</th>
                                            <td><%=r.getwDate() %></td>
                                        </tr>
                                        
                                        
                                        <tr class="view">
                                            <td colspan="2">
                                                <div class="detail">
                                                    <br><br>
                                                    <p></p>
                                                    <p><%=r.getReason() %></p>
                                                    <br><br>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </form>
                </div>
                <div class="xans-element- xans-board xans-board-commentpackage-4 xans-board-commentpackage xans-board-4 ">
                    <!-- 코멘트 리스트 -->
                    <div class="xans-element- xans-board xans-board-commentlist-4 xans-board-commentlist xans-board-4">
                        <!--
        $delete_page_url = /board/product/comment_del.html
        $delete_success_url = /board/product/read.html
    -->
                        <ul class="boardComment">
                            <li class="first xans-record-">
                            <%if(r.getReply()!=null) {%>
                                <strong class="name">관리자</strong>
                                <span class="grade displaynone"><img src=""
                                        alt="0점" /></span>
                                <span class="button">

                                </span>
                                <p class="comment">
                                    <span id="comment_contents70020"><%=r.getReply() %></span> </p>
                                    <%}else{ %>
                                    <strong class="name">관리자의 답변을 기다리는 중입니다!</strong>
                                    
                                    <%} %>
                            </li>
                        </ul>
                        
                 <!--     <form id="commentWriteForm" name="" action="/exec/front/Board/CommentWrite/6" method="post" target="_self" enctype="multipart/form-data" >
<input id="board_no" name="board_no" value="6" type="hidden"  />
<input id="no" name="no" value="1208844" type="hidden"  />
<input id="comment_no" name="comment_no" value="" type="hidden"  />
<input id="member_id" name="member_id" value="" type="hidden"  /><div class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 ">댓글권한 있음
<div class="">
            <fieldset>
<legend>댓글 입력</legend>
                <p><strong>댓글달기</strong><span class="">이름<input id="comment_name" name="comment_name" fw-filter="isFill" fw-label="댓글작성자" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"  /></span>비밀번호<input id="comment_password" name="comment_password" fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value="" type="password"  /><a href="#none" onclick="" class="displaynone"><img src="http://img.echosting.cafe24.com/design/skin/default/board/btn_comment_admin.gif" alt="관리자답변보기"/></a></p>
                <p>
                    <textarea id="comment" name="comment" fw-filter="isFill" fw-label="댓글내용" fw-msg="" ></textarea>                    <a href="#none" onclick="BOARD_COMMENT.comment_insert('/exec/front/Board/CommentWrite/6');" class=""><img src="http://img.echosting.cafe24.com/design/skin/default/board/btn_comment_submit.gif" alt="확인"/></a>
                </p>
                <p class="grade displaynone"></p>
                <p class="displaynone"> /  byte</p>
                <p class="displaynone">
                    <br/>
                                        * 왼쪽의 문자를 공백없이 입력하세요.(대소문자구분)
                </p>
            </fieldset>
</div>
댓글권한 없음
<div class="displaynone">
            <p>에게만 댓글 작성 권한이 있습니다.</p>
        </div>
</div>
</form>    -->
                        
                        
<div class="btnArea">
                                <a href="<%= request.getContextPath() %>/reportListServlet">목록</a>
                                <a href="" onclick="" class="">삭제</a>
                                <a href="/board/free/modify.html?board_act=edit&no=1372630&board_no=1" class="">수정</a>
                            </div>
                    </div>

                </div>


            </div>
        </div>
        					</div>
	</div>				</div>
					</div>
	</div></div>
				<%@ include file="../../common/footer.jsp"%>
</body>
</html>