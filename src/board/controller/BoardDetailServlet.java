package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Comment;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/boardDetailServlet")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("BoardDetailServlet : "+boardNo);
		
		Board board = null;
		
		boolean isGet =false;
		Cookie[] cookies = request.getCookies();
		if(cookies !=null) {
			for(Cookie c : cookies) {
				//1. boradNo 쿠키가 있는 경우
				if(c.getName().equals("boardNo"+boardNo)) {
					isGet = true;
				}
			}
			
			//2. bId쿠키가 없는 경우
			if(!isGet) {
				board = new BoardService().selectBoard(boardNo);
				
				Cookie c1 = new Cookie("boardNo"+boardNo, String.valueOf(boardNo));
				c1.setMaxAge(1*24*60*60); // 하루동안 저장
				response.addCookie(c1);
				
			}else {
				// 조회수 증가하지 않고 select
				board = new BoardService().selectBoradNoCnt(boardNo);
				
				
			}
			// 댓글 구현 기능 공간-----------
			ArrayList<Comment> clist = new BoardService().selectCommentList(boardNo);
						
			//---------------------------------
			
			if(board != null) {
			request.setAttribute("board", board);
			request.setAttribute("clist", clist);
			request.getRequestDispatcher("views/board/board/boardDetail.jsp").forward(request, response);
			}
		}
			

	
		// 댓글은 여기서 처리
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
