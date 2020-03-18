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
 >소셜 사이트에서 제공해주는 소스 입력 후 JSON 이용해 회원 프로필 정보 호출
```sh
					JSONParser parsing2 = new JSONParser();
					Object obj2 = parsing2.parse(response2.toString());
					JSONObject jsonObj2 = (JSONObject) obj2;
					JSONObject resObj2 = (JSONObject) jsonObj2.get("response");

					// 왼쪽 변수 이름은 원하는 대로 정하면 된다.
					// 단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
					String id = (String) resObj2.get("id");
					String email = (String) resObj2.get("email");
					String name = (String) resObj2.get("name");
					String nickName = (String) resObj2.get("nickname");
					String birth = (String) resObj2.get("birth");
					String gender = (String) resObj2.get("gender");
```
