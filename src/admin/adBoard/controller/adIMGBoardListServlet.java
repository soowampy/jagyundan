package admin.adBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.adBoard.model.service.adBoardService;
import board.model.service.BoardService;
import board.model.vo.Board;
import common.model.vo.IMG;

/**
 * Servlet implementation class adIMGBoardListServlet
 */
@WebServlet("/adIMGBoardListServlet")
public class adIMGBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adIMGBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Board> list = new adBoardService().selectIMGList();
		ArrayList<Board> fileList = new adBoardService().selectIMG();
		request.setAttribute("list", list);
		request.setAttribute("fileList", fileList);
		request.getRequestDispatcher("views/admin/board/adPicBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
