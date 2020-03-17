package user.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import common.model.vo.IMG;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdateServlet2")
public class UserUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserUpdateServlet2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("z");
		request.setCharacterEncoding("utf-8");
		if (ServletFileUpload.isMultipartContent(request)) {
			HttpSession session = request.getSession();
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			// 프사 저장 경로
			String savePath = root + "/resources/userimg/";

			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			int userNo = Integer.parseInt(multipartRequest.getParameter("userNo"));
			
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
					
					IMG fileList = new IMG();
					fileList.setFilePath(savePath);
					fileList.setOriginName(originFiles);
					fileList.setChangeName(changeFiles);
					fileList.setFileLevel(0);
					
					// 5. IMG에 유저정보 넣음
					fileList.setUserNo(userNo);
					int result2= new UserService().UpdateUserIMG(fileList);
			}else {
/*				changeFiles="index.png";
				originFiles="index.png";*/
			}
			
			String userId = multipartRequest.getParameter("userId");
			
			String addr0 = multipartRequest.getParameter("addr0");
			String addr1 = multipartRequest.getParameter("addr1");
			String addr2 = multipartRequest.getParameter("addr2");
			String addr = addr0+ "," + addr1 + "," + addr2;

			String phone1 = multipartRequest.getParameter("phone1");
			String phone2 = multipartRequest.getParameter("phone2");
			String phone3 = multipartRequest.getParameter("phone3");

			String phone = phone1 + "," + phone2 + "," + phone3;
			User u = new User(userNo, userId, addr, phone);

			User updateUser = new UserService().updateUser(u);
			System.out.println("업데이트" + updateUser);
			
			if (updateUser != null) {
				request.getSession().setAttribute("msg", "회원정보를 수정했습니다.");
				request.getSession().setAttribute("loginUser", updateUser);
				response.sendRedirect("views/myPage/user/myInfoUpdate.jsp");
			} else {
				request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
			}
		}
	}/*else {
			request.getSession().setAttribute("msg", "올바른 비밀번호를 입력해 주세요");
			response.sendRedirect("views/myPage/user/myInfoUpdate.jsp");
		}
	}
*/
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
