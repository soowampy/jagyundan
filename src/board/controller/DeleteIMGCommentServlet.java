package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class DeleteIMGCommentServlet
 */
@WebServlet("/DeleteIMGCommentServlet")
public class DeleteIMGCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteIMGCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int boardNo = Integer.parseInt(request.getParameter("cBoardNo"));
		System.out.println("dcs:"+boardNo);
		System.out.println("dcs:"+commentNo);
		int result = new BoardService().deleteComment(commentNo);
		
		
		
		
		if(result>0) {
			response.sendRedirect("IMGDetailServlet?boardNo="+boardNo);
		}else {
			request.getSession().setAttribute("msg", "댓글 삭제에 실패했습니다.");
			response.sendRedirect("IMGListServlet");
		}

		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
