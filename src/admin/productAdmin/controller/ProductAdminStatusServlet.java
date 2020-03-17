package admin.productAdmin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import productBoard.model.service.ProductBoardService;

/**
 * Servlet implementation class ProductAdminStatusServlet
 */
@WebServlet("/ProductAdminStatusServlet")
public class ProductAdminStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAdminStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_No[] = request.getParameterValues("product_No");
		String status= request.getParameter("status");
		
		int result =new ProductBoardService().deleteAdminProduct(product_No,status);

		if(result > 0) {
			response.sendRedirect("ProductAdminListServlet");
		} else {
			response.sendRedirect("ProductAdminListServlet");
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
