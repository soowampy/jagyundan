package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String orginpwd = ((User) session.getAttribute("loginUser")).getUserPwd();
		String inputpwd = request.getParameter("userPwd");
		
		System.out.println(orginpwd);
		System.out.println(inputpwd);
/*		
		if (orginpwd.equals(inputpwd)) {
*/
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			System.out.println(userNo);

			String userId = request.getParameter("userId");
			
			String addr0 = request.getParameter("addr0");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr = addr0+ "," + addr1 + "," + addr2;

			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");

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
		} /*else {
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
