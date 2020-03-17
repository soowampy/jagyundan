//1:1문의 상세보기
package myPage.controller.report;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myPage.report.model.service.ReportService;
import myPage.report.model.vo.Report;

/**
 * Servlet implementation class reportDetailServlet
 */
@WebServlet("/reportDetailServlet")
public class reportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reportDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		
		Report Report = new ReportService().selectReportDetail(reportNo);
		
		String page = "";
		if(Report != null) {
			request.setAttribute("reportDetail", Report);
			request.getRequestDispatcher("views/myPage/report/myReportDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "공지사항 조회에 실패했습니다.");
			page = "views/common/errorPage.jsp";
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
