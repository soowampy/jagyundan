package admin.productAdmin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.model.vo.IMG;
import purchase.model.service.PurchaseService;
import purchase.model.vo.ProductPurchase;
import user.model.vo.User;

/**
 * Servlet implementation class RefundSelectServlet
 */
@WebServlet("/RefundSelectServlet")
public class RefundSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

		
		PurchaseService pService = new PurchaseService();
		
		ArrayList<ProductPurchase> plist = pService.RefundSelect();

		if(plist != null) {
			request.setAttribute("plist", plist);
			request.getRequestDispatcher("views/admin/market/adMarketCancel.jsp").forward(request,response);
		}else {
			request.setAttribute("msg", "주문 내역이 없습니다.");
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
