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
import board.model.vo.PageInfo;
import common.model.vo.IMG;

/**
 * Servlet implementation class IMGListServlet
 */
@WebServlet("/IMGListServlet")
public class IMGListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IMGListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*페이징 처리를 위한 부분*/
		BoardService bService = new BoardService();
		// cate가 2인녀석들만 가져오기
		int listCount = bService.getIMGListCount();
				
	
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
		
		ArrayList<Board> blist = bService.IMGselectList(currentPage,boardLimit,1);
		
		ArrayList<IMG> flist = bService.IMGselectList(currentPage, boardLimit, 2);
		
		if(blist != null && flist != null) {
			request.setAttribute("blist", blist);
			request.setAttribute("flist", flist);
			request.setAttribute("pi",pi);
			request.getRequestDispatcher("views/board/imageBoard/imageBoard.jsp").forward(request, response);
			
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
