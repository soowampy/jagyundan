package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import user.model.vo.User;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/NoticeInsertServlet")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");

		String content = request.getParameter("content");
		
		
		Notice n = new Notice();
		
		
		n.setTitle(title);
		n.setContent(content);
		System.out.println(n);
		int result = new NoticeService().insertNotice(n);
	
		
		if(result>0) {
			response.sendRedirect("NoticeListServlet");
			
		}else {
			request.setAttribute("msg", "게시판 작성에 실패했습니다.");
			 request.getRequestDispatcher("NoticeListServlet").forward(request, response);
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
