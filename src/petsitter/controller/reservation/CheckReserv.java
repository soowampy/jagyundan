package petsitter.controller.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petsitter.model.service.PsReservInfoService;
import petsitter.model.vo.Reservation;

/**
 * Servlet implementation class CheckReserv
 */
@WebServlet("/CheckReserv")
public class CheckReserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckReserv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int psBoardNo = Integer.parseInt(request.getParameter("psBoardNo"));
		
		System.out.println(userNo);
		System.out.println(psBoardNo);
		
		Reservation reserv = new PsReservInfoService().checkUserNo(userNo,psBoardNo);
		PrintWriter out = response.getWriter();
		if(reserv == null) {
			System.out.println("예약한적 없음");
			out.print("no-reserv");
		}else{
			System.out.println("예약한적 있음");
			//이사람이 해당 펫시터 게시글에 댓글을 달았는지 확인
			out.print("yes-reserv");
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
