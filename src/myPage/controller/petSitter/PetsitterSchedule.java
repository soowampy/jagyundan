//펫시터 스케줄 등록!
package myPage.controller.petSitter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myPage.mpPetsitter.service.mpPetsitterSerivce;
import petsitter.model.vo.PsInfo;
import user.model.service.UserService;

/**
 * Servlet implementation class PetsitterSchedule
 */
@WebServlet("/PetsitterSchedule")
public class PetsitterSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterSchedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//펫시터 번호와 유저 번호뽑아오자
		int psNo = Integer.parseInt(request.getParameter("psNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		//반복문 돌릴 숫자(=num) 뽑아오기(script 에서 일(日)을 받아올 때마다 지정 변수 값을 +1하여 이를 value로 리턴해옴)
		int num = Integer.parseInt(request.getParameter("num"));
		
		//오늘날짜에서 월 뽑아오기
		Calendar cToday = Calendar.getInstance();
		int month = cToday.get(Calendar.MONTH) + 1;
		
		//ArrayList에다가 일단 담자 (name값이 일(日)을 받아오는 script 변수에서 a1, a2, a3으로 들어오므로 "a"+i 가 됨 )
		ArrayList<String> SchDate=new ArrayList<>();
		for(int i=0;i<num;i++) {
			if(i==(num-1)) {
				SchDate.add(month+request.getParameter("a"+i));
			}else {
				//분류하기 위해 반복문이 끝나지 않을 동안 ',' 를 추가하자
				SchDate.add(month+request.getParameter("a"+i)+",");
			}
		}
		
		//String으로 넣자
		String SceduleDate="";
		for(int i=0; i<SchDate.size();i++) {
			SceduleDate=SceduleDate+(SchDate.get(i));
		}

		//DB에 넣자
		PsInfo psInfo = new mpPetsitterSerivce().updateSch(psNo,userNo,SceduleDate);
		
		response.sendRedirect("PetsitterSelect");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
