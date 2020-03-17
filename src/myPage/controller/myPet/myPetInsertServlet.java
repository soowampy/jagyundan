//개 등록하기
package myPage.controller.myPet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petsitter.model.service.PetInfoService;
import petsitter.model.vo.Pet;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class myPetInsertServlet
 */
@WebServlet("/myPetInsertServlet")
public class myPetInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPetInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		//개 정보 갖고오자
		String dogName = request.getParameter("dogName");
		String gender = request.getParameter("gender");
		String size = request.getParameter("size");
		String neutralize = request.getParameter("neutralize");
		String vaccination = request.getParameter("vaccination");
		int age = Integer.parseInt(request.getParameter("age"));
		String toiletTrain = request.getParameter("toiletTrain");
		int userNo = ((User) session.getAttribute("loginUser")).getUserNo();
		User user = ((User) session.getAttribute("loginUser"));
		
		//DB등록하자
		Pet pet = new Pet(dogName,gender,size,neutralize,vaccination,age,toiletTrain,userNo);
		int result = new PetInfoService().insertPet(pet);
		
		if(result > 0) {
			//갖고있는 반려견수 +1 하기!
			User updateDogsu = new PetInfoService().updateDogSu(user);
			
			//ㄹㅣ스트갖고온다
			ArrayList<Pet> list = new PetInfoService().selectList(userNo);
			
			//넣자넣자
			request.setAttribute("list", list);
			request.getSession().setAttribute("loginUser", updateDogsu);
			request.getRequestDispatcher("views/myPage/petSitter/myPetInfo4.jsp").forward(request, response);
			
		}
		// 실패시 "회원 가입 실패!!" 메세지 가지고 errorPage.jsp로
		else {
			request.setAttribute("msg", "실패!!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
