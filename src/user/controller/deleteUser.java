package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class deleteUser
 */
@WebServlet(name="deleteUser", urlPatterns="/deleteUser")
public class deleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd = request.getParameter("userPwd");
		
		int deleteUser = new UserService().deleteUser(userPwd);
		if(deleteUser>0) {
			request.getSession().invalidate();
			request.getSession().setAttribute("msg", "성공적으로 탈퇴되었습니다! 재가입은 2주 후에 가능하며 지금까지 이용해주셔서 감사합니다");
			RequestDispatcher view = request.getRequestDispatcher("views/common/main.jsp");
			view.forward(request, response);
		}else {
			request.getSession().setAttribute("msg", "비밀번호가 맞지 않습니다");
			response.sendRedirect("views/myPage/user/deleteUser.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
