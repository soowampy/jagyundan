package productBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import productBoard.model.service.ProductBoardService;

/**
 * Servlet implementation class PdeleteCommentServlet
 */
@WebServlet("/PdeleteCommentServlet")
public class PdeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PdeleteCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		   int product_No = Integer.parseInt(request.getParameter("productNo"));
		   System.out.println("pcommentdeleteServlet : "+product_No);
		   
		   int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		   		   
		   int result = new ProductBoardService().deleteComment(commentNo);

		   
		   
		   if(result>0) {
			   
		      response.sendRedirect("ProductBoardDetailServlet?product_No="+product_No);
		   }else {
		      request.getSession().setAttribute("msg", "게시판 삭제에 실패했습니다.");
		      response.sendRedirect("list.bo");
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
