package test1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import common.model.vo.IMG;
import user.model.service.UserService;
import user.model.vo.User;

import java.io.InputStream;
import java.net.*;

/**
 * Servlet implementation class nTest
 */
@WebServlet("/nTest")
public class nTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public nTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String clientId = "CE47JkQPlYj3Dwfbptra";
		String clientSecret = "CSWqZChrjZ";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://192.168.10.26:8800/jagyun1210/", "UTF-8");

		StringBuffer apiURL = new StringBuffer();
		apiURL.append("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&");
		apiURL.append("client_id=" + clientId);
		apiURL.append("&client_secret=" + clientSecret);
		apiURL.append("&redirect_uri=" + redirectURI);
		apiURL.append("&code=" + code);
		apiURL.append("&state=" + state);
		String access_token = "";
		String refresh_token = "";
		String result = apiURL.toString();
		System.out.println(result);
		try {

			URL url = new URL(result);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // ?????? ??????
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // ?????? ??????
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();

			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(res.toString());
			JSONObject jsonObj = (JSONObject) obj;

			access_token = (String) jsonObj.get("access_token");
			refresh_token = (String) jsonObj.get("refresh_token");

			if (access_token != null) { // access_token??? ??? ???????????????
				String token = access_token;// ????????? ????????? ?????? ??????;
				String header = "Bearer " + token; // Bearer ????????? ?????? ??????
				try {
					String apiURL2 = "https://openapi.naver.com/v1/nid/me";
					URL url2 = new URL(apiURL2);
					HttpURLConnection con2 = (HttpURLConnection) url2.openConnection();
					con2.setRequestMethod("GET");
					con2.setRequestProperty("Authorization", header);
					int responseCode2 = con2.getResponseCode();

					System.out.println(responseCode2);

					BufferedReader br2;
					if (responseCode2 == 200) { // ?????? ??????
						br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
					} else { // ?????? ??????
						br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream()));
					}
					String inputLine2;
					StringBuffer response2 = new StringBuffer();
					while ((inputLine2 = br2.readLine()) != null) {
						response2.append(inputLine2);
					}
					br2.close();
					System.out.println(response2.toString());

					// ------------------------
					JSONParser parsing2 = new JSONParser();
					Object obj2 = parsing2.parse(response2.toString());
					JSONObject jsonObj2 = (JSONObject) obj2;
					JSONObject resObj2 = (JSONObject) jsonObj2.get("response");

					// ?????? ?????? ????????? ????????? ?????? ????????? ??????.
					// ???, ????????? get()?????? ???????????? ?????? ????????? ?????? ?????? ?????? ????????? ??????????????? ??????.
					String id = (String) resObj2.get("id");
					String email = (String) resObj2.get("email");
					String name = (String) resObj2.get("name");
					String nickName = (String) resObj2.get("nickname");
					String birth = (String) resObj2.get("birth");
					String gender = (String) resObj2.get("gender");
					
					if(gender.equals("M")) {
						gender="M";
					}else if(gender.equals("F")) {
						gender="F";
					}else {
						gender=null;
					}
					//DB??? ???????????? ??????????????? ??????
					int r = new UserService().idCheck(id);
					
					
					if(r>0) {//???????????? ????????? ?????? ?????????
						
						User loginUser3 = new UserService().loginUser2(id);
						HttpSession session = request.getSession();
						session.setAttribute("loginUser", loginUser3);
						response.sendRedirect("views/common/main.jsp");
						
						
					}else {//????????? insert ?????? ?????????
						User mem = new User(id, null, name, gender, email, null, 0, null, null);
						//User mem = new User(userId, encPwd, userName, gender, email, address, dogCount, phone, birth);
						// 3. ?????????????????????
						int result3 = new UserService().insertUser(mem);
						

						String root = request.getSession().getServletContext().getRealPath("/");						
						// ?????? ?????? ??????
						String savePath = root + "/resources/userimg/";
						String changeFiles = "naverLogin.png";
						String originFiles = "naverLogin.png";
						IMG fileList = new IMG();
						fileList.setFilePath(savePath);
						fileList.setOriginName(originFiles);
						fileList.setChangeName(changeFiles);
						fileList.setFileLevel(0);
						
						
						User loginUser = new UserService().userNOSelect(id);
						fileList.setUserNo(loginUser.getUserNo());
						
						
						
						int result2= new UserService().insertUserIMG(fileList);	
	                    request.setAttribute("naverId", id);
	                    RequestDispatcher rd = request.getRequestDispatcher("views/member/naverJoinPlusForm.jsp");  
	                    rd.forward(request, response);
					}
					
					
					
					
				} catch (Exception e) {
					System.out.println(e);
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
