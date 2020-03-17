package productBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



import productBoard.model.service.ProductBoardService;
import productBoard.model.vo.pComment;

/**
 * Servlet implementation class PinsertCommentServlet
 */
@WebServlet("/PinsertCommentServlet")
public class PinsertCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PinsertCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   int writer = Integer.parseInt(request.getParameter("writer"));
		   int productNo = Integer.parseInt(request.getParameter("productNo"));
		   String content = request.getParameter("content");
		   

		      pComment cm = new pComment();
		      cm.setUserNo(writer);
		      cm.setProductNo(productNo);
		      cm.setContent(content);
		      ArrayList<pComment> clist = new ProductBoardService().insertComment(cm);
		      
		      response.setContentType("application/json; charset=utf-8");
		      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		      gson.toJson(clist,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
