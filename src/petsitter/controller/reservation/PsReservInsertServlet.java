package petsitter.controller.reservation;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petsitter.model.service.PsBoardInfoService;
import petsitter.model.service.PsReservInfoService;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsSchedule;
import petsitter.model.vo.Reservation;
import user.model.vo.User;

/**
 * Servlet implementation class PsReservInsertServlet
 */
@WebServlet("/PsReservInsertServlet")
public class PsReservInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PsReservInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//여기서 해야할 부분은
		//1. 예약 내역 테이블에 저장
		//2. 스케줄 변경
		
		request.setCharacterEncoding("utf-8");
		User user = (User)request.getSession().getAttribute("loginUser");
		int userNo = user.getUserNo();
		int psBoardNo = Integer.parseInt(request.getParameter("psBoardNo"));
		int dogSu = Integer.parseInt(request.getParameter("plusDog"));
		int finalPrice = Integer.parseInt(request.getParameter("finalPrice"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String requirment = request.getParameter("requirment");
		
		System.out.println(userNo);
		System.out.println(psBoardNo);
		System.out.println(dogSu);
		System.out.println(finalPrice);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(requirment);

		Reservation reserv = new Reservation(psBoardNo,userNo,dogSu,startDate,endDate,finalPrice,requirment);
		
		int insertResult = new PsReservInfoService().insertReserv(reserv);
		
		if(insertResult<1) {
			//예약 테이블 입력 완료
			System.out.println("예약 입력 오류남");
			request.setAttribute("msg", "펫시터 정보 로드 실패!!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}else {
						PsBoard psBoard = new PsBoardInfoService().selectPsBoard(psBoardNo);
			//펫시터 스케줄을 변경하기 위해서
			int psNo = psBoard.getPsNo();
			
	        String DATE_PATTERN = "yyyyMMdd";
	        String inputStartDate = startDate;
	        String inputEndDate = endDate;
	        SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
			try {
				Date start = sdf.parse(inputStartDate);
				Date end = sdf.parse(inputEndDate);
				
				ArrayList<String> dates = new ArrayList<String>();
			    Date currentDate = start;
			    while (currentDate.compareTo(end) <= 0) {
			    	System.out.println(sdf.format(currentDate));
			        dates.add(sdf.format(currentDate));
			        Calendar c = Calendar.getInstance();
			        c.setTime(currentDate);
			        c.add(Calendar.DAY_OF_MONTH, 1);
			        currentDate = c.getTime();
			    }
			    String reservDate = "";
			    for (int i = 0;i<dates.size();i++) {
			        System.out.println(dates.get(i));
			        if(i == dates.size()-1) {
			        	reservDate = reservDate + dates.get(i).substring(4,8);
			        }else {
			        	reservDate = reservDate + (dates.get(i).substring(4,8)+",");
			        }
			    }
			    
				PsSchedule pschObj = new PsBoardInfoService().selectPsSchedule(psNo); //해당 펫시터의 스케줄 객체를 뽑아오는 부분
				String psch = pschObj.getApDate();
				if(psch.equals("000000")) {
					psch = reservDate;
				}else {
					psch = psch + ","+ reservDate; //예약 날짜와 이전 스케줄을 합치는 부분
				}
				int insertSchedule = new PsReservInfoService().updateSchedule(psch,psNo);
				if(insertSchedule<1) {
					System.out.println("스케줄 수정 오류남");
					request.setAttribute("msg", "펫시터 정보 로드 실패!!");
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
				}else {
					response.sendRedirect("SelectPsBoardList");
				}
				
				
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
