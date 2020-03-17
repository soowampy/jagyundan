package petsitter.controller.petsitter_1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petsitter.model.service.PetSitterInfoService;
import petsitter.model.vo.PsInfo;
import user.model.vo.User;

/**
 * Servlet implementation class PsInsertServlet
 */
@WebServlet("/PsInsertServlet")
public class PsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PsInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		User user = (User)request.getSession().getAttribute("loginUser");
		System.out.println(user);
		
		int userNo = new PetSitterInfoService().getUserNo(user.getUserId());
		System.out.println(userNo);
		
		String reason  = request.getParameter("reason");
		String job = request.getParameter("checkJob");
		String pet = request.getParameter("checkPet");
		String dogExp = request.getParameter("dogExp");
		String certific = request.getParameter("certific");
		
		PsInfo ps = new PsInfo(userNo,reason,job,pet,dogExp,certific);
		System.out.println(ps);
		int result = new PetSitterInfoService().insertPs(ps);
		System.out.println(result);
		if(result>0) {
			System.out.println("제대로 들어감");
			request.getSession().setAttribute("msg", "펫시터 지원을 완료하였습니다. 관리자의 승인이 완료되면 마이페이지에서 확인하실수 있습니다.");
			response.sendRedirect("views/common/main.jsp");
		}else {
			System.out.println("제대로 안 들어감");
			request.setAttribute("msg", "회원 가입 실패!!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
