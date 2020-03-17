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
 * Servlet implementation class updatePwd
 */
@WebServlet(name="UpdatePwdServlet", urlPatterns="/updatePwd")
public class updatePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		// 현재 비밀번호
		String userPwd = request.getParameter("userPwd");
		// 새로운 비밀번호
		String newPwd = request.getParameter("newPwd");

		User updateUser = new UserService().updatePwd(userId, userPwd, newPwd);
		System.out.println(updateUser);
		if(updateUser != null) {
			request.getSession().setAttribute("msg", "성공적으로 비밀번호를 변경하였습니다.");
			request.getSession().setAttribute("loginUser", updateUser);
			//response.sendRedirect("views/myPage/myPageMain.jsp");
			request.getRequestDispatcher("views/myPage/myPageMain2.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("msg", "비밀번호가 맞지 않습니다!");
			request.getRequestDispatcher("views/myPage/user/myPwdUpdate.jsp").forward(request, response);
		}
		
		//request.getRequestDispatcher("views/member/pwdUpdateForm.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
