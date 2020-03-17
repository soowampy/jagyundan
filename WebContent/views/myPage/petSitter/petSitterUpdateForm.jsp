<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자견단</title>
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/mypage/css/myInfoUpdate.css" />
	<style>
		textarea{
		width:80%;
		height:100%;
		}
	</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>
		<div class="container">
		  <form id="editForm" name="editForm" action="/exec/front/Member/edit/" method="post" target="_self" enctype="multipart/form-data">
            <div class="xans-element- xans-member xans-member-edit">
                <h3>펫시터 정보</h3>
                <div class="boardWrite">
                    <table border="1" summary="">
                        <caption>회원정보</caption>
                        <tbody>
                            <tr>
                                <th scope="row">지원 동기</th>
                                <td>
                                    <textarea>zzz</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">직업여부</th>
                                <td>
                                    <textarea>zz</textarea>
                                </td>
                            </tr>                            <tr>
                                <th scope="row">반려견 유무</th>
                                <td>
                                   <input  type="text">
                                </td>
                            </tr>                            <tr>
                                <th scope="row">돌봄경험</th>
                                <td>
                                    <textarea>zz</textarea>
                                </td>
                            </tr>                            <tr>
                                <th scope="row">관련 자격증</th>
                                <td>
                                    <textarea>zz</textarea>
                                </td>
                            </tr>                            

                        </tbody>
                    </table>
                </div>
                <div class="btnArea">

                    </span>
                    <a href="/index.html"><img src="" alt="취소" /></a>
                    <a href="#none" onclick="memberEditAction()"><img src="" alt="회원정보수정" /></a>
                </div>
            </div>
        </form>
</div></div>
</body>
</html>