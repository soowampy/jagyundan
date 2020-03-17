package petsitter.controller.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Comment;
import petsitter.model.service.PsBoardInfoService;
import petsitter.model.service.PsReservInfoService;
import user.model.vo.User;

/**
 * Servlet implementation class InsertReply
 */
@WebServlet("/InsertReply")
public class InsertReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String checkFix = request.getParameter("commentNo");
		if(checkFix == null) { //댓글 입력 구문
			User user = (User)request.getSession().getAttribute("loginUser");
			int userNo = user.getUserNo();
			int score = Integer.parseInt(request.getParameter("score"));
			int psBoardNo = Integer.parseInt(request.getParameter("psBoardNo"));
			String reply = request.getParameter("comment");
			
			System.out.println("-----------------");
			System.out.println(userNo);
			System.out.println(score);
			System.out.println(psBoardNo);
			System.out.println(reply);
			
			Comment comment = new Comment(reply,userNo,psBoardNo);
			System.out.println(comment);
			int result1 = new PsReservInfoService().insertReply(comment); //해당 댓글을 저장했는지 안했는지 확인하기 위해서
			int result2 = new PsReservInfoService().insertScore(score,userNo,psBoardNo); //점수를 점수테이블에 입력했는지 안했는지 체크하기위해
			int result3  = 0;
			if(result2>0) { //점수 입력을 성공했을때 이제 해당 게시글 번호의 평균 점수를 구함
				double avgScore = new PsReservInfoService().getAvgScore(psBoardNo);
				if(avgScore>0) {
					//글을 쓴 펫시터 번호 가져와서 그 번호의 점수를 수정한다.
					int psNo = new PsBoardInfoService().selectPsBoard(psBoardNo).getPsNo();
					int avgScore2 = (int)Math.round(avgScore);
					result3 = new PsReservInfoService().insertScore2(avgScore2,psNo);
				}
			}
			
			if(result1<1 || result2<1 || result3<1) {
				System.out.println("입력 실패");
				request.getSession().setAttribute("msg", "펫시터 글 등록 실패");
				response.sendRedirect("views/common/error.jsp");
			}else {
				PrintWriter out = response.getWriter();
				
				   String str="";
				   str = "<script language='javascript'>";
				   str += "opener.window.location.reload();";  //오프너 새로고침  window open한 부모를 새로고침하는 부분
				   str += "self.close();";   // 창닫기
				    str += "</script>";
				    
				    out.print(str);
			}
		}else { //수정할때
			System.out.println(checkFix);
			int commentNo = Integer.parseInt(checkFix);
			User user = (User)request.getSession().getAttribute("loginUser");
			int userNo = user.getUserNo();
			int score = Integer.parseInt(request.getParameter("score"));
			int psBoardNo = Integer.parseInt(request.getParameter("psBoardNo"));
			String reply = request.getParameter("comment");
			
			System.out.println("-----------------");
			System.out.println(userNo);
			System.out.println(score);
			System.out.println(psBoardNo);
			System.out.println(reply);
			
			Comment comment = new Comment(reply,userNo,psBoardNo);
			System.out.println(comment);
			int result = new PsReservInfoService().updateReply(comment,commentNo);
			int result2 = new PsReservInfoService().updateScore(score,userNo,psBoardNo); //점수를 업데이트 했는지 안했는지 체크하기 위한 변수
			int result3  = 0;
			if(result2>0) { //점수 입력을 성공했을때 이제 해당 게시글 번호의 평균 점수를 구함
				double avgScore = new PsReservInfoService().getAvgScore(psBoardNo);
				if(avgScore>0) {
					//글을 쓴 펫시터 번호 가져와서 그 번호의 점수를 수정한다.
					int psNo = new PsBoardInfoService().selectPsBoard(psBoardNo).getPsNo();
					int avgScore2 = (int)Math.round(avgScore);
					result3 = new PsReservInfoService().insertScore2(avgScore2,psNo);
				}
			}
			if(result<1) {
				System.out.println("입력 실패");
				request.getSession().setAttribute("msg", "펫시터 글 등록 실패");
				response.sendRedirect("views/common/error.jsp");
			}else {
				PrintWriter out = response.getWriter();
				
				   String str="";
				   str = "<script language='javascript'>";
				   str += "opener.window.location.reload();";  //오프너 새로고침  window open한 부모를 새로고침하는 부분
				   str += "self.close();";   // 창닫기
				    str += "</script>";
				    
				    out.print(str);
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
