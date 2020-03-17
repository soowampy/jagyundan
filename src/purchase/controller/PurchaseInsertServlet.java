package purchase.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.model.vo.IMG;
import productBoard.model.service.ProductBoardService;
import productBoard.model.vo.ProductBoard;
import purchase.model.service.PurchaseService;
import purchase.model.vo.Purchase;
import user.model.vo.User;


/**
 * Servlet implementation class PurchaseInsertServlet
 */
@WebServlet("/PurchaseInsertServlet")
public class PurchaseInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		    HttpSession session = request.getSession();
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			int productNo = Integer.parseInt(request.getParameter("productNo"));

		    String userName = request.getParameter("name");
			
			
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address = address1+ "," + address2 + "," + address3;

			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			String phone = tel1 + "," + tel2 + "," + tel3;
			
		    int amount = Integer.parseInt(request.getParameter("amount"));
		    int finalPrice = Integer.parseInt(request.getParameter("finalPrice"));
		    
		    
			Purchase pu = new Purchase();
			
			pu.setUser_no(userNo);
			pu.setProduct_no(productNo);
			pu.setGet_people(userName);
			pu.setGet_where(address);
			pu.setGet_phone(phone);
			pu.setAmount(amount);
			pu.setPrice(finalPrice);
			
			int result = new PurchaseService().InsertPurchase(pu);
			
			ProductBoardService pbService = new ProductBoardService();
			ArrayList<ProductBoard> blist = pbService.selectList(1);
			ArrayList<IMG> flist = pbService.selectList(2);
			
			if (result > 0) {
				request.getSession().setAttribute("msg", "구매가 완료되었습니다.");
				request.setAttribute("blist", blist);
				request.setAttribute("flist", flist);
				
				response.sendRedirect("ProductBoardListServlet");
				
			} else {
				request.setAttribute("msg", "구매 실패요.");
			}
		} /*else {
			request.getSession().setAttribute("msg", "올바른 비밀번호를 입력해 주세요");
			response.sendRedirect("views/myPage/user/myInfoUpdate.jsp");
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
