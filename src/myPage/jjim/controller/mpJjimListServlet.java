package myPage.jjim.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.adBoard.model.service.adBoardService;
import board.model.vo.Board;
import common.model.vo.IMG;
import myPage.jjim.model.service.mpJjimService;
import myPage.jjim.model.vo.jjim;
import productBoard.model.service.ProductBoardService;
import user.model.vo.User;

/**
 * Servlet implementation class mpJjimListServlet
 */
@WebServlet("/mpJjimListServlet")
public class mpJjimListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mpJjimListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProductBoardService pbService = new ProductBoardService();
		int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
		ArrayList<jjim> list = new mpJjimService().selectList(userNo);
		ArrayList<IMG> flist = pbService.selectList(3);
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		request.getRequestDispatcher("views/myPage/market/jjim.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
