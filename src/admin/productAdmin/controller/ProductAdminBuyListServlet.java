package admin.productAdmin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.Petsitter.model.service.AdminPetsitterService;
import admin.productAdmin.service.ProdcutAdminService;
import petsitter.model.vo.PsInfo;
import purchase.model.vo.ProductPurchase;
import purchase.model.vo.Purchase;

/**
 * Servlet implementation class ProductAdminBuyServlet
 */
@WebServlet("/ProductAdminBuyListServlet")
public class ProductAdminBuyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAdminBuyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Purchase> list = new ProdcutAdminService().selectList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/market/adMarketBuy.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
