package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;


/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/NoticeUpdateServlet")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title=request.getParameter("title");

		String content = request.getParameter("content");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	Notice n = new Notice();
	n.setTitle(title);
	n.setContent(content);
	n.setNoticeNo(noticeNo);

	int result = new NoticeService().updateNotice(n);
	if(result>0) {		
		request.setAttribute("noticeNo", noticeNo);
		request.getRequestDispatcher("NoticeDetailServlet").forward(request, response);
		
	}else {
	
		request.getSession().setAttribute("msg", "공지사항 업데이트에 실패했습니다.");
		response.sendRedirect("NoticeDetailServlet");
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
