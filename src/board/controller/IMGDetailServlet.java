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
import common.model.vo.IMG;

/**
 * Servlet implementation class IMGDetailServlet
 */
@WebServlet("/IMGDetailServlet")
public class IMGDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IMGDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		
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
				board = new BoardService().selectIMGBoard(boardNo);
				
				Cookie c1 = new Cookie("boardNo"+boardNo, String.valueOf(boardNo));
				c1.setMaxAge(1*24*60*60); // 하루동안 저장
				response.addCookie(c1);
				
			}else {
				// 조회수 증가하지 않고 select
				board = new BoardService().selectIMGBoradNoCnt(boardNo);
				
				
			}
			
			
		ArrayList<IMG> fileList = new BoardService().selectIMG(boardNo);
		System.out.println(fileList);
		System.out.println(board);
		
		
		
		
		// 댓글 구현 기능 공간-----------
					ArrayList<Comment> clist = new BoardService().selectCommentList(boardNo);
					
					
					
		if(fileList!=null) {
			request.setAttribute("board", board);
			request.setAttribute("flist", fileList);
			request.setAttribute("clist", clist);
			request.getRequestDispatcher("views/board/imageBoard/imageBoardDetail.jsp").forward(request, response);
			}else {
			//request.setAttribute("msg", "사진 게시판 상세보기에 실패했습니다,");
			//request.getRequestDispatcher("views/board/imageBoard/imageBoard.jsp").forward(request, response);
			System.out.println("사진게시판 상세보기 실패");
			}
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
