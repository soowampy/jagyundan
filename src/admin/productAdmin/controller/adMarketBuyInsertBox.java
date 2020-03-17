package admin.productAdmin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.Petsitter.model.service.AdminPetsitterService;
import admin.productAdmin.service.ProdcutAdminService;

/**
 * Servlet implementation class adMarketBuyInsertBox
 */
@WebServlet("/adMarketBuyInsertBox")
public class adMarketBuyInsertBox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adMarketBuyInsertBox() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boxNum = request.getParameter("boxNum");
		int buyNo = Integer.parseInt(request.getParameter("buyNo"));
		int result = new ProdcutAdminService().adMarketBuyInsertBox(boxNum,buyNo);
		
		if (result>=1) {

			response.sendRedirect("ProductAdminBuyListServlet");
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
