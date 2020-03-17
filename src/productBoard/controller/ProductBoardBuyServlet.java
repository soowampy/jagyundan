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
 * Servlet implementation class ProductBoardBuyServlet
 */
@WebServlet("/ProductBoardBuyServlet")
public class ProductBoardBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBoardBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
        int productNo = Integer.parseInt(request.getParameter("productNo"));
        String size = request.getParameter("size");
        int amount = Integer.parseInt(request.getParameter("amount"));
		
		// BoardService의 2개의 메소드를 호출하기 위해 참조 변수로 선언
		ProductBoardService pbService= new ProductBoardService();
		
		// 1. 해당 게시판 정보 조회
		ProductBoard productBoard = pbService.selectProductBoard(productNo);
		
		// 2. 해당 게시판의 사진들 리스트 조회
		ArrayList<IMG> fileList = pbService.selectIMG(productNo);
		
		if(fileList != null) {
			request.setAttribute("productBoard", productBoard);
			request.setAttribute("fileList", fileList);
			request.setAttribute("size", size);
			request.setAttribute("amount",amount);

			request.getRequestDispatcher("views/ProductBoard/ProductBuy.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "구매실패!");
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
