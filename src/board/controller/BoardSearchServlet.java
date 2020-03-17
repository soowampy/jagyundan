package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/BoardSearchServlet")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardService bService = new BoardService();
		String searchCondition = request.getParameter("searchCondition");
		String search = request.getParameter("search");
		
		int listCount = bService.getListCount();
		
		
		int currentPage; 
		int pageLimit;
		int maxPage; 
		int startPage; 
		int endPage;
		
		int boardLimit = 10; 

		currentPage = 1;

		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit =10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
	
		startPage = (currentPage -1)/pageLimit * pageLimit +1;
	
		endPage = startPage + pageLimit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
						
		PageInfo pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		
		
		ArrayList<Board> list = new BoardService().searchBoard(search, searchCondition);
		
		
		
		
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("searchCondition", searchCondition);
		request.setAttribute("search", search);
		request.setAttribute("pi",pi);
		RequestDispatcher view = request.getRequestDispatcher("views/board/board/board.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
