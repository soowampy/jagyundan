package test1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class nTest2
 */
@WebServlet("/nTest2")
public class nTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nTest2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String naverId=request.getParameter("naverId");
		System.out.println(naverId);
		String postCode =  request.getParameter("addr");
		// 도로명주소
		String doro =  request.getParameter("addr1");
		// 상세주소
		String detail =  request.getParameter("addr2");
		String address = postCode + "," + doro + "," + detail;
		String birth = request.getParameter("birth");
		// 폰주소
		String phone1 =  request.getParameter("phone1") + ",";
		String phone2 = request.getParameter("phone2") + ",";
		String phone3 =  request.getParameter("phone3");
		String phone = phone1 + phone2 + phone3;
		
		int dogCount = 0;
		
		User updateUser = new UserService().naverInsertUser(naverId,address,phone,birth,dogCount);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", updateUser);
		response.sendRedirect("views/common/main.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
