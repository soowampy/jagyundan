package petsitter.controller.psboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petsitter.model.service.PsBoardInfoService;
import petsitter.model.vo.PsBoard;

/**
 * Servlet implementation class PsBoardUpdateServlet
 */
@WebServlet("/PsBoardUpdateServlet")
public class PsBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PsBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int psNo = Integer.parseInt(request.getParameter("psNo"));
		System.out.println(psNo);
		PsBoard findPsBoard = new PsBoardInfoService().checkBoard(psNo); //해당 펫시터가 쓴 글 번호를 가져옴
		int psBoardNo = findPsBoard.getPsBoardNo(); //펫시터 글 번호 뽑아옴
		PsBoard psBoard = new PsBoardInfoService().selectPsBoard(psBoardNo);
		
		request.setAttribute("psBoard", psBoard);
		request.getRequestDispatcher("views/petsitter/fixEnroll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
