package admin.Petsitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.Petsitter.model.service.AdminPetsitterService;
import admin.user.model.service.adminUserService;

/**
 * Servlet implementation class adUpdatePetsitterRequestServlet
 */
@WebServlet("/adUpdatePetsitterRequestServlet")
public class adUpdatePetsitterRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**syso
     * @see HttpServlet#HttpServlet()
     */
    public adUpdatePetsitterRequestServlet() {
        super(); 
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 펫시터 승인하기!!!!!!! ㅋㅋ
		
		String irr[] = request.getParameterValues("bId");
		String status = request.getParameter("status");
		int result = new AdminPetsitterService().adUpdatePetsitterRequest(irr,status);
	
		if (result>=1) {

			response.sendRedirect("adpetSitterRequestServlet");
		} else {

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
