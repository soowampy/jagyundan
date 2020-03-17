package petsitter.controller.psboard;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Comment;
import common.model.vo.IMG;
import petsitter.model.service.PetSitterInfoService;
import petsitter.model.service.PsBoardInfoService;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfoDetail;
import petsitter.model.vo.PsSchedule;
import user.model.vo.User;

/**
 * Servlet implementation class SelectPsBoardListDetail
 */
@WebServlet("/SelectPsBoardListDetail")
public class SelectPsBoardListDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPsBoardListDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int psBoardNo = Integer.parseInt(request.getParameter("psb"));
		System.out.println(psBoardNo);
		PsBoard psBoard = new PsBoardInfoService().selectPsBoard(psBoardNo);
		if(psBoard == null) {
			System.out.println("펫시터 글 로드 실패");
			request.setAttribute("msg", "펫시터 글 로드 실패!!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}else {
			System.out.println("펫시터 글 로드 성공");
			int psNo = psBoard.getPsNo();
			System.out.println(psNo);
			PsInfoDetail pid = new PsBoardInfoService().selectPsInfoDetail(psNo); //펫시터 글쓴사람의 개인정보를 담는곳
			
			int userNo = pid.getUserNo();
			IMG psImg =  new PsBoardInfoService().selectPsImage(userNo); //펫시터 글 쓴 사람의 프로필 사진을 넣는곳
			System.out.println(psImg);
			String psImgFileName = psImg.getChangeName();
			ArrayList<IMG> iList = new PsBoardInfoService().selectBoardImg(psBoardNo); //펫시터 글의 이미지를 저장하는곳
			
			PsSchedule pschObj = new PsBoardInfoService().selectPsSchedule(psNo); //해당 펫시터의 스케줄 객체를 뽑아오는 부분

			ArrayList<Comment> clist = new PsBoardInfoService().selectCommentList(psBoardNo); //이 글에 해당하는 댓글을 view에서 뽑아 오는 부분 이걸 psBoardNo로 찾아옴
			
			Comment comment = null;
			User user = (User)request.getSession().getAttribute("loginUser");
			if(user != null) {
				int loginUserNo = user.getUserNo();
				comment = new PsBoardInfoService().checkComment(loginUserNo,psBoardNo);
			}
			
			
			if(pid == null || iList.isEmpty()|| pschObj == null) {
				System.out.println("펫시터 정보 로드 실패");
				System.out.println("펫시터 글사진 로드 실패");
				System.out.println("펫시터 스케줄 로드 실패");
				request.setAttribute("msg", "펫시터 정보 로드 실패!!");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}else {
				//펫시터 글 로드해오고 그 글을 쓴 사람의 정보와 사진을 가져오기 위해서
				String psch = pschObj.getApDate();
				System.out.println(psch);
				System.out.println(psBoard);
				System.out.println(pid);
				for(IMG img : iList) { //해당 게시글 사진 가져오는 부분
					System.out.println(img);
				}
				for(Comment c : clist) { //해당 게시글 댓글 가져오는 부분
					System.out.println(c);
				}
				Date today = new Date();
				System.out.println(today);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String today1 = sdf.format(today); //지나간 날짜는 표기하지 않기 위해서

				int todayNum = Integer.parseInt(today1);
				request.setAttribute("psBoard", psBoard);
				request.setAttribute("pid", pid);
				request.setAttribute("iList", iList);
				request.setAttribute("psImage", psImgFileName); //펫시터 글 쓴 사람의 프로필 사진 넘겨줌
				request.setAttribute("psSchedule",psch);//펫시터 스케줄 보냄
				request.setAttribute("today", todayNum);
				request.setAttribute("clist", clist);
				request.setAttribute("checkComment", comment);
				request.getRequestDispatcher("views/petsitter/PsDetail.jsp").forward(request, response);
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
