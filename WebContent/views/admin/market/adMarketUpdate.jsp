<!-- 관리자▶마켓▶상품목록▶ 수정버튼 눌렀을 때 value값 받아옴-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.outer {
   margin: auto;
   margin-top: 50px;
}

.tt {
   width: 100%;
   border: 1px solid rgba(0, 128, 0, 0.507);
}
#inner{

width:100%;
margin-bottom:3%;
}
</style>

</head>

<body><!-- value값 불러온다 -->
 	<%@ include file="../common/adminNavibar.jsp" %>
 	<body id="page-top">
  <!-- Page Wrapper -->
  <div id="inner">
   <section class="page-section" id="portfolio">
      <div class="container">
         <div class="row">
            <div class="outer">
               <br>
               <h2 align="center">상품 입력</h2>
               <hr>
               <div class="tableArea">
                  <form action="" method="post">
                     <fieldset>
                        <table>
                           <tr>
                              <td colspan="6"><h5><strong>상품 번호 : </strong></h5><br></td>
                           </tr>
                           <tr>
                              <td colspan="6"><h5><strong>대표 이미지</strong></h5></td>
                           </tr>
                           <tr>
                              <td colspan="6">
                                 <div id="titleImgArea">
                                    <img id="titleImg" width="350" height="200" class="tt">
                                 </div>
                              </td>
                           </tr>

                           <tr>
                              
                              <td colspan="6"><h5><strong>옵션</strong></h5></td>
                           </tr>

                           <tr>
                              <td>분야</td>
                              <td><select name="category" class="tt">
                                    <option>----</option>
                                    <option value="10">야외용품</option>
                                    <option value="20">패션</option>
                                    <option value="30">장난감</option>
                                    <option value="40">훈련용품</option>
                                    <option value="50">음식</option>
                                    <option value="60">기타</option>
                              </select></td>
                              <td>사이즈</td>
                              <td><select id="searchCondition" name="searchCondition"
                                 class="tt">
                                    <option>----</option>
                                    <option value="S">S</option>
                                    <option value="M">M</option>
                                    <option value="L">L</option>
                              </select></td>
                              <td>가격</td>
                              <td><input type="number" size="58" name="title" min="0"
                                 class="tt"></td>
                           </tr>

                           <tr>
                              <td colspan="6"><h5><strong>제목</strong></h5></td>
                           </tr>
                           <tr>
                              <td colspan="6"><input type="text" size="58" name="title"
                                 class="tt"></td>
                           </tr>
                           <tr>
                              <td colspan="6"><h5><strong>내용</strong></h5></td>
                           </tr>
                           <tr>
                              <td colspan="6"><textarea rows="15" cols="60"
                                    name="content" style="resize: none;" class="tt"></textarea></td>
                           </tr>
                        </table>
                        <br>
                        <div align="center">
                           <button id="submit" type="submit"
                              class="btn btn-outline-success">변경하기</button>
                           <button id="pp" type="submit" class="btn btn-outline-success">사진등록</button>
                           <div id="fileupload">
                              <input type="file" id="thumbnailImg1" name="thumbnailImg1"
                                 onchange="loadImg(this,1)"> <input type="file"
                                 id="thumbnailImg2" name="thumbnailImg2"
                                 onchange="loadImg(this,2)">
                           </div>
                           <br>
                           <script>
                              $(function() {
                                 $("#fileupload").hide();

                                 $("#titleImgArea").click(
                                       function() {
                                          $("#thumbnailImg1")
                                                .click();
                                       });
                                 $("#pp").click(function() {
                                    $("#thumbnailImg2").click();
                                 });
                              });
                           </script>
                        </div>
                     </fieldset>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </section></div></div></div></div></div></div></div></div></div></div>

</body>

</html>