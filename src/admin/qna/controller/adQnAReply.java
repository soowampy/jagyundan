package admin.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.productAdmin.service.ProdcutAdminService;
import admin.qna.model.service.adQnaService;

/**
 * Servlet implementation class adQnAReply
 */
@WebServlet("/adQnAReply")
public class adQnAReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adQnAReply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String reply= request.getParameter("reply");
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		int result = new adQnaService().adQnaReply(reportNo,reply);
		
		if (result>=1) {

			response.sendRedirect("adQnaListServlet");
		} else {
			request.setAttribute("msg", " 수정에 실패했습니다.");
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
