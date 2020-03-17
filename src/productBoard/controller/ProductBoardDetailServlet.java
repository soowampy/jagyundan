package productBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Comment;
import common.model.vo.IMG;
import productBoard.model.service.ProductBoardService;
import productBoard.model.vo.ProductBoard;
import productBoard.model.vo.pComment;

/**
 * Servlet implementation class ProductBoardDetailServlet
 */
@WebServlet("/ProductBoardDetailServlet")
public class ProductBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        int product_No = Integer.parseInt(request.getParameter("product_No"));
		
		// BoardService의 2개의 메소드를 호출하기 위해 참조 변수로 선언
		ProductBoardService pbService= new ProductBoardService();
		
		// 1. 해당 게시판 정보 조회
		ProductBoard productBoard = pbService.selectProductBoard(product_No);
		
		// 2. 해당 게시판의 사진들 리스트 조회
		ArrayList<IMG> fileList = pbService.selectIMG(product_No);
		
		//댓글
		ArrayList<pComment> clist = pbService.selectCommentList(product_No);
		
		if(fileList != null) {
			request.setAttribute("productBoard", productBoard);
			request.setAttribute("fileList", fileList);
			request.setAttribute("clist", clist);

			request.getRequestDispatcher("views/ProductBoard/ProductBoardDetail.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "상품 게시판 상세 보기 실패!!");
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
