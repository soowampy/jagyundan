package user.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import common.model.service.IMGService;
import common.model.vo.IMG;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet(name = "InsertMemberServlet2", urlPatterns = "/InsertMemberServlet2")
public class InsertMemberServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertMemberServlet2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 한글이 있을 경우 인코딩 처리
		request.setCharacterEncoding("UTF-8");

		// 2. request에 담겨있는 값들 꺼내서 변수에 저장 및 객체 생성

		// ----------------------------------------------------------------------------
		// 사진첨부^_^
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
	
			String root = request.getSession().getServletContext().getRealPath("/");

			
			// 프사 저장 경로
			String savePath = root + "/resources/userimg/";

			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			String changeFiles = "";
			String originFiles = "";

			Enumeration<String> files = multipartRequest.getFileNames();
			String name = files.nextElement();

			// System.out.println("name : " + name);

			// 파일이 null이 아닌 경우
			if (multipartRequest.getFilesystemName(name) != null) {
					// getFilessystemName() --> 리네임 된 파일명 리턴
					String changeName = multipartRequest.getFilesystemName(name);
					// getOriginFileName() --> 사용자가 업로드한 파일명 리턴
					String originName = multipartRequest.getOriginalFileName(name);

					changeFiles=changeName;
					originFiles=originName;
			}else {
				changeFiles="index.png";
				originFiles="index.png";
			}
			

			IMG fileList = new IMG();
			fileList.setFilePath(savePath);
			fileList.setOriginName(originFiles);
			fileList.setChangeName(changeFiles);
			fileList.setFileLevel(0);
			//=======================================================
			
			String userId = multipartRequest.getParameter("userId");

			String userPwd =  multipartRequest.getParameter("userPwd");

			
			//====================================================비밀번호암호화
			String encPwd = null;
			MessageDigest md = null;
			try {
				md = MessageDigest.getInstance("SHA-512");
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			encPwd=Base64.getEncoder().encodeToString(md.digest());
			//====================================================
			String userName =  multipartRequest.getParameter("userName");

			String gender1 =  multipartRequest.getParameter("gender");
			String gender = "";
			if (gender1.equals("man")) {
				gender = "M";
			} else {
				gender = "F";
			}
			;
			String email =  multipartRequest.getParameter("email");
			String postCode =  multipartRequest.getParameter("addr");
			// 도로명주소
			String doro =  multipartRequest.getParameter("addr1");
			// 상세주소
			String detail =  multipartRequest.getParameter("addr2");
			String address = postCode + "," + doro + "," + detail;

			// 폰주소
			String phone1 =  multipartRequest.getParameter("phone1") + ",";
			String phone2 =  multipartRequest.getParameter("phone2") + ",";
			String phone3 =  multipartRequest.getParameter("phone3");
			String phone = phone1 + phone2 + phone3;

			// 개 수 초기값 0
			int dogCount = 0;
			String birth =  multipartRequest.getParameter("birth");

			
			
			
			
			User mem = new User(userId, encPwd, userName, gender, email, address, dogCount, phone, birth);
			
			// 3. 유저정보넣었음
			int result = new UserService().insertUser(mem);

			// 4. 해당유저정보 가져와서 유저넘버갖고오긔
			User selectUser = new UserService().userNOSelect(userId);
			int userNo=selectUser.getUserNo();
			
			fileList.setUserNo(userNo);

			// 5. IMG에 유저정보 넣음

			int result2= new UserService().insertUserIMG(fileList);

			if (result > 0 && result2>0) {
				// menubar.jsp에서 alert창 출력하도록 설정
				request.getSession().setAttribute("msg", "회원 가입 성공! 반려견 등록은 마이페이지에서 해주세요 ^__^");
				response.sendRedirect("views/common/main.jsp");

			}
			// 실패시 "회원 가입 실패!!" 메세지 가지고 errorPage.jsp로
			else {
				request.setAttribute("msg", "회원 가입 실패!!");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
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
