package productBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.IMG;
import productBoard.model.service.ProductBoardService;
import productBoard.model.vo.ProductBoard;

/**
 * Servlet implementation class ProductBoardCateServlet
 */

@WebServlet("/ProductBoardCateServlet")
public class ProductBoardCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBoardCateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String product_Cate = request.getParameter("product_Cate");
		
		ArrayList<ProductBoard> pist = new ProductBoardService().cateList(product_Cate);
		ArrayList<IMG> flist = new ProductBoardService().selectList(2);
		
		request.setAttribute("plist", pist);
		request.setAttribute("flist", flist);
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/ProductBoard/ProductBoard.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
