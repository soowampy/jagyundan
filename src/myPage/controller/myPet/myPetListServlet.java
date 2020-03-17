//내 개 목록갖고오기
package myPage.controller.myPet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petsitter.model.service.PetInfoService;
import petsitter.model.vo.Pet;
import user.model.vo.User;

/**
 * Servlet implementation class myPetListServlet
 */
@WebServlet("/myPetListServlet")
public class myPetListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public myPetListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 유저별 펫리스트뽑아오기...
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		int userNo = ((User) session.getAttribute("loginUser")).getUserNo();

		ArrayList<Pet> list = new PetInfoService().selectList(userNo);
		System.out.println(list + "!!");
		if (list.isEmpty()) {
			response.sendRedirect("views/myPage/petSitter/myPetInfo4.jsp");
		} else {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/myPage/petSitter/myPetInfo4.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
