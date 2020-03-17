package petsitter.controller.petsitter_1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petsitter.model.service.PetSitterInfoService;
import petsitter.model.service.PsBoardInfoService;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfo;

/**
 * Servlet implementation class SelectPsListDetail
 */
@WebServlet("/SelectPsListDetail")
public class SelectPsListDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPsListDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int psbNo = Integer.parseInt(request.getParameter("psb"));
		System.out.println(psbNo);
		PsBoard psb = new PsBoardInfoService().selectPsBoard(psbNo);
		//PsInfo ps = new PetSitterInfoService().selectDetail(psNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
