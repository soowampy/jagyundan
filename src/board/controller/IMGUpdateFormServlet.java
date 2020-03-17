package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import common.model.vo.IMG;

/**
 * Servlet implementation class IMGUpdateFormServlet
 */
@WebServlet("/IMGUpdateFormServlet")
public class IMGUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IMGUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		
		Board board = new BoardService().selectIMGBoradNoCnt(boardNo);
		ArrayList<IMG> fileList = new BoardService().selectIMG(boardNo);
		
		if(board != null) {
			request.setAttribute("board", board);
			request.setAttribute("flist", fileList);
			request.getRequestDispatcher("views/board/imageBoard/imageUpdateForm.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("msg", "수정할 게시글을 불러오는데 실패했습니다.");
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
