package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.model.service.BoardService;
import board.model.vo.Board;
import user.model.vo.User;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/BoardUpdateServlet")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title=request.getParameter("title");
		
		String content = request.getParameter("content");
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		String userNo = String.valueOf(loginUser.getUserNo());
		// boardNo이 정상적으로 넘어오지 않음 - 문제를 찾아보자
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Board b = new Board();
		b.setBoardNo(boardNo);
		b.setTitle(title);
		b.setContent(content);
		b.setUserName(userNo);
	
		int result = new BoardService().updateBoard(b);
		if(result>0) {
		
			request.setAttribute("boardNo", boardNo);
			request.getRequestDispatcher("boardDetailServlet").forward(request, response);
			
		}else {
		
	request.getSession().setAttribute("msg", "게시판 수정에 실패했습니다.");
			response.sendRedirect("boardDetailServlet");
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
