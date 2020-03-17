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
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/BoardInsertServlet")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	

		String title = request.getParameter("title");

		String content = request.getParameter("content");

		User loginUser = (User)request.getSession().getAttribute("loginUser");

		String userNo = String.valueOf(loginUser.getUserNo());

		
		
		
		
		Board b = new Board();
		
		b.setTitle(title);
		b.setContent(content);
		b.setUserName(userNo);
		int result = new BoardService().insertBoard(b);
	
		
		if(result>0) {
			response.sendRedirect("list.bo");
			
		}else {
			request.setAttribute("msg", "게시판 작성에 실패했습니다.");
			 request.getRequestDispatcher("list.bo").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
