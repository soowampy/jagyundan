package myPage.controller.petSitter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myPage.mpPetsitter.service.mpPetsitterSerivce;
import petsitter.model.vo.PsInfo;
import petsitter.model.vo.Reservation;
import user.model.vo.User;

/**
 * Servlet implementation class PetsitterUseList
 */
@WebServlet("/PetsitterUseList")
public class PetsitterUseList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterUseList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//펫시터 이용내역 조회 서블렛
		
		//유저번호를뽑아온당
		HttpSession session = request.getSession();
		int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
		
		 ArrayList<Reservation>  userReserve = new mpPetsitterSerivce().petsitterUseList(userNo);
			request.setAttribute("list", userReserve);
			
			request.getRequestDispatcher("views/myPage/petSitter/myPetSitterList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

