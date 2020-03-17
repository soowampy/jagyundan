package myPage.controller.myMarket;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import purchase.model.service.PurchaseService;
import user.model.vo.User;

/**
 * Servlet implementation class RefundInsertServlet
 */
@WebServlet("/RefundInsertServlet")
public class RefundInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
		int buy_no = Integer.parseInt(request.getParameter("buy_no"));
		
		
		int result = new PurchaseService().RefundInsert(userNo,buy_no);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "취소 요청이 완료되었습니다.");
			
			response.sendRedirect("MyMarketList");
			
		} else {
			request.setAttribute("msg", "취소 실패요.");
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
