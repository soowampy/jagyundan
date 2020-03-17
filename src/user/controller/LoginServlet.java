package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet", urlPatterns="/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		User loginUser = new UserService().loginUser(userId, userPwd);
		

			if(loginUser != null) {
				
				
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				
				if(( loginUser.getUserId()).equals("adminjagyun")) {
					request.getSession().setAttribute("msg", "관리자로 로그인하셨습니다");
					response.sendRedirect("views/admin/adminMain.jsp");
				}else {

					request.getSession().setAttribute("msg", loginUser.getUserName()+"님 환영합니다^_^");
					response.sendRedirect("views/common/main.jsp");
				}
			}else {
				// 로그인 실패 화면
				request.getSession().setAttribute("msg", "로그인에  실패하였습니다.");
				response.sendRedirect("views/member/loginForm.jsp");
			}
		}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
