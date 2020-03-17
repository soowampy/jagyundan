//내 펫 삭제하기
package myPage.controller.myPet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petsitter.model.service.PetInfoService;
import user.model.vo.User;

/**
 * Servlet implementation class myPetDeleteServlet
 */
@WebServlet("/myPetDeleteServlet")
public class myPetDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPetDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//개 번호 갖고오기
		int dogNum = Integer.parseInt(request.getParameter("dogNum"));		

		//DB가서 개 지우고오기
		int result = new PetInfoService().deletePet(dogNum);
		

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		if(result > 0) {
			//업뎃된 정보로 유저 정보 갖고오기
			User user = ((User) session.getAttribute("loginUser"));
			User updateDogsu = new PetInfoService().updateDogSu2(user);
			
			//업뎃된 정보로 로그인 유저 세션에 넣기
			request.getSession().setAttribute("loginUser", updateDogsu);
			
			//다시 리스트 서블렛으로~~
			response.sendRedirect("myPetListServlet");
		} else {

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
