package myPage.controller.myMarket;

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
import purchase.model.vo.Purchase;
import user.model.vo.User;

/**
 * Servlet implementation class MyMarketList
 */
@WebServlet("/MyMarketList")
public class MyMarketList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMarketList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
		
		PurchaseService pService = new PurchaseService();
		
		ArrayList<ProductPurchase> plist = pService.selectList(userNo);
		
		ArrayList<IMG> flist = pService.selectFList();

		if(plist != null  && flist != null) {
			request.setAttribute("plist", plist);
			request.setAttribute("flist", flist);
			request.getRequestDispatcher("views/myPage/market/myMarketList2.jsp").forward(request,response);
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
