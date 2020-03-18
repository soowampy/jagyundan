# 프로젝트 소개
 - 애견 관련 서비스를 제공하는 사이트입니다. <br>
 - MVC Model 2로 작업한 4인 팀프로젝트로 2019. 11. 04 ~ 2019. 12. 27 까지의 작업기간을 거쳤습니다.
# 개발 환경
 - Java 1.8 / JSP, JSTL / Servlet / MVC2<br>
 - JDBC / ORACLE<br>
 - Javascript / JQuery / Ajax<br>
 - Html / CSS3 / Bootstrap<br>

# 구현 기능
 - 회원가입, 로그인, 마이페이지, 관리자 페이지 기능을 구현하였습니다.
 
# 주요 코드
 - 네이버 개발자 센터에서 배포하는 소셜 로그인 방식을 이용한 SNS 로그인 기능을 구현하였습니다.<br>
 <br><br>
 > 소셜 사이트에서 제공해주는 소스 입력 후 JSON 이용해 회원 프로필 정보 호출
```sh
	JSONParser parsing2 = new JSONParser();
	Object obj2 = parsing2.parse(response2.toString());
	JSONObject jsonObj2 = (JSONObject) obj2;
	JSONObject resObj2 = (JSONObject) jsonObj2.get("response");
	
	String id = (String) resObj2.get("id");
	String email = (String) resObj2.get("email");
	String name = (String) resObj2.get("name");
	String nickName = (String) resObj2.get("nickname");
	String birth = (String) resObj2.get("birth");
	String gender = (String) resObj2.get("gender");
```
<br><br>

 > 소셜 로그인을 처음 시도하는지, 이미 계정 정보가 있는지 확인하는 코드
 ```sh
	//DB에 아이디가 존재하는지 확인
	int r = new UserService().idCheck(id);
				
	if(r>0) {
	//아이디가 있다면 정상 로그인		
		User loginUser3 = new UserService().loginUser2(id);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser3);
		response.sendRedirect("views/common/main.jsp");					
	}else {
	//없다면 insert 후에 로그인
		User mem = new User(id, null, name, gender, email, null, 0, null, null);
		// 3. 유저정보넣기
		int result3 = new UserService().insertUser(mem);
		
		// 4. RequestDispatcher를 이용해 추가 입력 폼으로 이동
		RequestDispatcher rd = request.getRequestDispatcher("views/member/naverJoinPlusForm.jsp");  
	        rd.forward(request, response);
	}
 
```
