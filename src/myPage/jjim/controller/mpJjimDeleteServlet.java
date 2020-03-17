package myPage.jjim.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.Petsitter.model.service.AdminPetsitterService;
import myPage.jjim.model.service.mpJjimService;

/**
 * Servlet implementation class mpJjimDeleteServlet
 */
@WebServlet("/mpJjimDeleteServlet")
public class mpJjimDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mpJjimDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String irr[] = request.getParameterValues("jjimList");
		int result = new mpJjimService().DeleteJjim(irr);
		
		if (result>=1) {
			request.getSession().setAttribute("msg", "삭제되었습니다!");
			response.sendRedirect("mpJjimListServlet");
		} else {
			request.setAttribute("msg", "펫ㅅ시터 정보 수정에 실패했습니다.");
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
