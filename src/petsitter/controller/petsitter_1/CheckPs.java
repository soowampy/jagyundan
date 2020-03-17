package petsitter.controller.petsitter_1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petsitter.model.service.PetSitterInfoService;
import petsitter.model.vo.PsInfo;
import user.model.vo.User;

/**
 * Servlet implementation class CheckPs
 */
@WebServlet("/CheckPs")
public class CheckPs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("loginUser");
		String userId = user.getUserId();
		int userNo = new PetSitterInfoService().getUserNo(userId);
		System.out.println(userNo);
		PsInfo ps = new PetSitterInfoService().checkUser(userNo);
		System.out.println(ps);
		
		//ajax를 활용해서 값을 바로가져온다.
		PrintWriter out = response.getWriter();
		
		//펫시터에 지원하지 않은 경우
		if(ps == null) {
			System.out.println("펫시터 지원안함");
			out.print("ap-no");
			
		}else { //펫시터에 지원한 경우
			System.out.println("일단 지원은 했음");
			String check = ps.getApproval();
			System.out.println(check);
			switch(check) {
			case "O": //승인완료
				System.out.println("승인 완료 됨");
				out.print("ps-ok");
				break;
			case "N": //승인 대기
				out.print("not-yet");
				System.out.println("아직 관리자 승인이 안남");
				break;
			case "X": //승인 거절
				out.print("fail");
				System.out.println("관리자 승인 거절");
				break;
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
