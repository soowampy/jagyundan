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
import petsitter.model.service.PetSitterInfoService;
import petsitter.model.vo.PsInfo;
import petsitter.model.vo.PsSchedule;
import petsitter.model.vo.Reservation;
import user.model.vo.User;

//펫시터페이지에 들어갔을 때 정보를 가져오는 서블렛
/**
 * Servlet implementation class PetsitterSelect
 */
@WebServlet("/PetsitterSelect")
public class PetsitterSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userNo = ((User) session.getAttribute("loginUser")).getUserNo();

		//<펫시터정보 갔다오기>
		PsInfo ps = new mpPetsitterSerivce().checkUser(userNo);
		
		//<펫시터스케줄정보 갔다오자>
		PsSchedule sch = new mpPetsitterSerivce().selectSch(userNo);
		
		//스케줄이 없을 경우?(초기값 세팅)
		if(sch==null) {
			//000000으로 초기값을 넣어주자
			new mpPetsitterSerivce().insertSch(ps.getPsNo(),userNo,"000000");
			sch = new mpPetsitterSerivce().selectSch(userNo);
		}
		
		//펫시터넘버를 가져와서 PS_RESERV 테이블갖고 ARRAYLIST에 담는당!!
		int psNo= ps.getPsNo();
		ArrayList<Reservation> rlist = new mpPetsitterSerivce().selectSchList(psNo);
		System.out.println(rlist);
		request.setAttribute("PsInfo", ps);
		request.setAttribute("SchInfo", sch);
		request.setAttribute("rlist", rlist);
		
		request.getRequestDispatcher("views/myPage/petSitter/petSitterPage1.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
