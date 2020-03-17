package petsitter.controller.psboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petsitter.model.service.PetSitterInfoService;
import petsitter.model.service.PsBoardInfoService;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfo;
import user.model.vo.User;

/**
 * Servlet implementation class CheckPsBoard
 */
@WebServlet("/CheckPsBoard")
public class CheckPsBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPsBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인된 사람의 userId로 userNo를 가져오는 부분
		User user = (User)request.getSession().getAttribute("loginUser");
		String userId = user.getUserId();
		int userNo = new PetSitterInfoService().getUserNo(userId);
		System.out.println(userNo);
		//해당 userNo로 PsInfo값을 가져오는 부분
		PsInfo ps = new PetSitterInfoService().checkUser(userNo);
		System.out.println(ps);
		PrintWriter out = response.getWriter();
		
		//ps가 null일떄 즉 지원을 하지 않았을때
		if(ps == null) {
			System.out.println("아예 펫시터가 아님");
			out.print("ap-no");
		}else { //ps가 null이 아닐때
			
			int psNo = ps.getPsNo();
			System.out.println(psNo);
			//펫시터 게시글에 해당 펫시터 번호로 작성한걸 찾아내기 위해
			PsBoard pb = new PsBoardInfoService().checkBoard(psNo);
			
			if(pb == null) {//펫시터가 작성을 하지 않았으면 진입
				System.out.println("글 작성 안함");
				String approval = ps.getApproval();
				System.out.println(approval);
				switch(approval) {
				case "X":
					System.out.println("승인 거절");
					out.print("fail");
					break;
				case "N":
					System.out.println("승인 대기");
					out.print("not-yet");
					break;
				case "O":
					System.out.println("승인 완료");
					out.print("ps-ok");
					break;
				}
			}else { //펫시터가 게시글을 작성을 했을때
				System.out.println("글 작성함");
				out.print("written");
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
