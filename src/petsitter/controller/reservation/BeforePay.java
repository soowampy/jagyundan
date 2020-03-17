package petsitter.controller.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petsitter.model.service.PsBoardInfoService;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfoDetail;
import petsitter.model.vo.Reservation;

/**
 * Servlet implementation class BeforePay
 */
@WebServlet("/BeforePay")
public class BeforePay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeforePay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String startDate = request.getParameter("startDate"); //예약 시작 날짜
		String endDate = request.getParameter("endDate"); //예약 끝나는 날짜
		int plusDog;
		if(request.getParameter("dogSu") == null) {
			plusDog = Integer.parseInt(request.getParameter("dogSu"));
		}else {
			plusDog = Integer.parseInt(request.getParameter("dogSu"));
			
		}
		int psbNo = Integer.parseInt(request.getParameter("psBoardNo")); //펫시터 글 번호
		int servicePrice = Integer.parseInt(request.getParameter("firstPrice"));
		int finalPrice = Integer.parseInt(request.getParameter("finalPrice"));
		String psImage = request.getParameter("psImage"); //펫시터 개인 프로필 사진이름
		String service = request.getParameter("sendService"); //서비스 유형
		//펫시처 게시글 정보를 가져와야함
		PsBoard psb = new PsBoardInfoService().selectPsBoard(psbNo); //펫시터 글 정보 보내주기 위해 받아옴
		
		if(psb!=null) {
			int psNo = psb.getPsNo();
			 Reservation reserv = null;
			if(service.equals("데이케어")) {
				reserv = new Reservation(psbNo,plusDog,startDate,endDate);
			}else {
				reserv = new Reservation(psbNo,plusDog,startDate,endDate);
				service = service+"박";
			}
			PsInfoDetail pid = new PsBoardInfoService().selectPsInfoDetail(psNo);//펫시터 개인정보 보내주기위해 개인정보 받아옴
			if(pid!=null) {
				System.out.println(reserv);
				
				request.setAttribute("reserv", reserv);
				request.setAttribute("psImage", psImage);
				request.setAttribute("pid", pid);
				request.setAttribute("service", service);
				request.setAttribute("servicePrice", servicePrice);
				request.setAttribute("finalPrice", finalPrice);
				request.getRequestDispatcher("views/petsitter/before-pay.jsp").forward(request, response);
				

			}else {
				request.setAttribute("msg", "펫시터 정보 로드 실패!!");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);				
			}
			
		}else {
			request.setAttribute("msg", "펫시터 정보 로드 실패!!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
