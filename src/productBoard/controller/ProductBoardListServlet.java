package productBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.model.vo.IMG;
import productBoard.model.service.ProductBoardService;
import productBoard.model.vo.ProductBoard;

/**
 * Servlet implementation class ProductBoardListServlet
 */
@WebServlet("/ProductBoardListServlet")
public class ProductBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 관련 즉 사진 게시판을 위해 Attachment VO 클래스를 먼저 만들자~~
		
		
				ProductBoardService pbService = new ProductBoardService();
				
				// 사진 게시판은 일반 게시판과 달리 페이징 처리를 하지 않고 해보자!
				
				// 1. 우선 사진 게시판 리스트 정보를 불러오자(btype이 2인 게시글)
				ArrayList<ProductBoard> plist = pbService.selectList(1);
				
				// 2. 사진 리스트도 불러오자(attachment 테이블에 담겨있는 fileLevel이 0인 파일들)
				ArrayList<IMG> flist = pbService.selectList(2);

				if(plist != null  && flist != null) {
					request.setAttribute("plist", plist);
					request.setAttribute("flist", flist);
					request.getRequestDispatcher("views/ProductBoard/ProductBoard.jsp").forward(request,response);
				}else {
					request.setAttribute("msg", "사진 게시판 조회 실패");
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
