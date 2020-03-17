package myPage.controller.myMarket;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.IMG;
import myPage.mpMarket.service.mpMarketService;
import purchase.model.service.PurchaseService;
import purchase.model.vo.ProductPurchase;

/**
 * Servlet implementation class myMarketDetail
 */
@WebServlet("/myMarketDetail")
public class myMarketDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myMarketDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));
		PurchaseService pService = new PurchaseService();
		
		ProductPurchase p = new mpMarketService().selectDetail(bId);
		ArrayList<IMG> flist = pService.selectFList();
		
		request.setAttribute("plist", p);
		request.setAttribute("flist", flist);
		System.out.println("!!"+p);
		request.getRequestDispatcher("views/myPage/market/myMarketDetail.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
