package petsitter.controller.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import board.model.service.BoardService;
import board.model.vo.Comment;
import petsitter.model.service.PsBoardInfoService;

/**
 * Servlet implementation class DeleteReply
 */
@WebServlet("/DeleteReply")
public class DeleteReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int psBoardNo = Integer.parseInt(request.getParameter("psBoardNo"));
		int result = new PsBoardInfoService().deleteReply(commentNo);
		PrintWriter out = response.getWriter();
		if(result>0) { //삭제 된것
			ArrayList<Comment> clist = new PsBoardInfoService().selectCommentList(psBoardNo);//삭제 되고나서의 댓글들을 다시 가져옴.
			if(clist.isEmpty()) {
				System.out.println("비어 있음");
			}else{
				for( Comment c : clist) {
					System.out.println(c);
				}
			}
			response.setContentType("application/json; charset=utf-8");
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(clist,response.getWriter());
			//gson을 통해서 commentlist를 보내줌
		}else {//삭제 안된것
			out.print("deleteFail");
		}
		/*
		 * 		Comment cm = new Comment();
		cm.setUserNo(writer);
		cm.setBoardNo(boardNo);
		cm.setContent(content);
		ArrayList<Comment> clist = new BoardService().insertComment(cm);
	
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(clist,response.getWriter());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
