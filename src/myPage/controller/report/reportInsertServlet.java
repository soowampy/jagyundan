//1:1문의 인서트
package myPage.controller.report;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myPage.report.model.service.ReportService;
import myPage.report.model.vo.Report;
import notice.model.service.NoticeService;
import user.model.vo.User;

/**
 * Servlet implementation class reportInsertServlet
 */
@WebServlet("/reportInsertServlet")
public class reportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reportInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// DB에 저장시 
		String reason = request.getParameter("reason");
		int category = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String refer = request.getParameter("refer");
		int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
		
		Report n = new Report(reason,category,title,refer,userNo);
		
		int result = new ReportService().InsertReport(n);
		
		if(result > 0) {
			// 새로 갱신된 list를 불러오는 Servlet을 실행해야되기 때문에 다음과 같이 작업하자!!
			
			request.getSession().setAttribute("msg", "성공적으로 등록되었습니다.");
			response.sendRedirect("reportListServlet");
		}else {
			request.setAttribute("msg", "공지사항 등록 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
