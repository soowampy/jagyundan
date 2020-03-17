package purchase.controller;

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
 * Servlet implementation class JjimInsertServlet
 */
@WebServlet("/JjimInsertServlet")
public class JjimInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JjimInsertServlet() {
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
		int productNo = Integer.parseInt(request.getParameter("product_No"));
		
		int result = new PurchaseService().JjimInsert(userNo,productNo);
		
		if (result > 0) {
			request.getSession().setAttribute("msg", "장바구니에 저장 완료.");
			response.sendRedirect("ProductBoardListServlet");
		} else {
			request.setAttribute("msg", "장바구니에 저장 실패.");
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
