package petsitter.controller.psboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.IMG;
import petsitter.model.service.PetSitterInfoService;
import petsitter.model.service.PsBoardInfoService;
import petsitter.model.vo.PsBList;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfo;
import user.model.vo.User;

/**
 * Servlet implementation class SelectPsBoardList
 */
@WebServlet("/SelectPsBoardList")
public class SelectPsBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPsBoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("servlet : SelectPsBoardListServlet");
		
		PsBoardInfoService psb = new PsBoardInfoService();
		
		ArrayList<PsBList> bList = psb.selectList(1);
		if(bList.isEmpty()) {
			System.out.println("게시판 비어있음");
		}
		//게시글 사진
		ArrayList<IMG> iList = psb.selectList(2);
		if(bList.isEmpty()) {
			System.out.println("게시판 사진 비어있음");
		}
		//게시글 올린 사람 프로필 사진
		ArrayList<IMG> pList = psb.selectList(3);
		if(bList.isEmpty()) {
			System.out.println("프로필 사진 비어있음");
		}
		if(!bList.isEmpty() && !iList.isEmpty() && !pList.isEmpty()) {
			request.setAttribute("bList", bList);
			request.setAttribute("iList", iList);
			request.setAttribute("pList", pList);
			request.getRequestDispatcher("views/petsitter/psList.jsp").forward(request, response);
		}else {
			System.out.println("다 비어있음");
			request.setAttribute("empty", "empty");
			request.getRequestDispatcher("views/petsitter/psList.jsp").forward(request, response);
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
