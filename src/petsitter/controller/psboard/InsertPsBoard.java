package petsitter.controller.psboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import common.model.vo.IMG;
import petsitter.model.service.PetSitterInfoService;
import petsitter.model.service.PsBoardInfoService;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfo;
import user.model.vo.User;

/**
 * Servlet implementation class InsertPsBoard
 */
@WebServlet("/InsertPsBoard")
public class InsertPsBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPsBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) { //multipartContent일때
			
			int maxSize = 1024*1024*10;
			
			//지금 우리 프로그램이 저장해있는 위치
			String root = request.getSession().getServletContext().getRealPath("/");
			//내가 게시판 사진을 저장할 위치
			String savePath = root+"/resources/psboard/";
			
			//내가 저장할 위치랑 저장최대 크기 그리고 파일명 바꾸는 방법과 텍스트 형식을 저장한다.
			MultipartRequest multipartRequest
				= new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			//바뀐 파일명이 저장될 list
			ArrayList<String> changeFiles = new ArrayList<>();
			//원래 파일명이 저장될 list
			ArrayList<String> originFiles = new ArrayList<>();
			//jsp에서 form태그로 전송이 되어진 파일 리스트들의 name 값들을 저장한곳
			Enumeration<String> files = multipartRequest.getFileNames();
			
			
			//submit되어진 파일들이 더이상 없을때까지 하나하나에 접근하여서 바뀐 파일 이름과 원래 이름을 
			//list에 저장시키는 기능을 하는 부분
			while(files.hasMoreElements()) {
				String name = files.nextElement(); // form태그에서 submit한 태그의 name
				
				if(multipartRequest.getFilesystemName(name)!=null) {
					//multipartRequest에서 submit되어진 name으로 파일이 비어있지 않을때 진입
					
					String changeName = multipartRequest.getFilesystemName(name);
					//이름 바꿔와서 저장
					
					String originName = multipartRequest.getOriginalFileName(name);
					//원래 파일이름을 저장
					
					changeFiles.add(changeName);
					originFiles.add(originName);
				}
			}
			
			//psboard 제목 
			String title = multipartRequest.getParameter("title");
			System.out.println(title);
			//content
			String content = multipartRequest.getParameter("content");
			System.out.println(content);
			//service
			String[] serviceArr = multipartRequest.getParameterValues("service");
			String service = "";
			for(int i = 0; i<serviceArr.length;i++) {
				if(i == serviceArr.length-1) { //마지막 부분이면 ,를 넣지 않기 위해서
					service+=serviceArr[i];
				}else {
					service+=serviceArr[i]+",";//각각의 서비스를 ,로 구분해서 넣음
				}
			}
			System.out.println(service);
			
			//사이즈
			String[] sizeArr = multipartRequest.getParameterValues("size");
			String size = "";
			for(int i = 0; i<sizeArr.length;i++) {
				if(i == sizeArr.length-1) { //마지막 부분이면 ,를 넣지 않기 위해서
					size+=sizeArr[i];
				}else {
					size+=sizeArr[i]+",";//각각의 서비스를 ,로 구분해서 넣음
				}
			}
			System.out.println(size);
			
			//나이
			String[] ageArr = multipartRequest.getParameterValues("age");
			String age = "";
			for(int i = 0; i<ageArr.length;i++) {
				if(i == ageArr.length-1) { //마지막 부분이면 ,를 넣지 않기 위해서
					age+=ageArr[i];
				}else {
					age+=ageArr[i]+",";//각각의 서비스를 ,로 구분해서 넣음
				}
			}
			System.out.println(age);
			
			//체크인/체크아웃
			String checkIn = multipartRequest.getParameter("checkIn");
			System.out.println(checkIn);
			String checkOut = multipartRequest.getParameter("checkOut");
			System.out.println(checkOut);
			
			//가격
			int hourPrice = Integer.parseInt(multipartRequest.getParameter("hourPrice"));
			System.out.println(hourPrice);
			int oneDayPrice = Integer.parseInt(multipartRequest.getParameter("onedayPrice"));
			System.out.println(oneDayPrice);
			
			//해당 USER psNo뽑아오기
			User user = (User)request.getSession().getAttribute("loginUser");
			String userId = user.getUserId();

			//userNo를 가져오기 위해서
			int userNo = new PetSitterInfoService().getUserNo(userId);
			System.out.println(userNo);
			//psInfo를 가져오기 위해서
			PsInfo ps = new PetSitterInfoService().checkUser(userNo);
			System.out.println(ps);
			int psNo = 0;
			if(ps == null) { //받아온 펫시터 정보가 null일때
				request.setAttribute("msg", "펫시터에 지원을 하지 않았습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}else { //비어 있지 않을때 진입
				if(ps.getApproval().equals("O")) {
					//비어있지 않고 승인 여부가 O인 애
					psNo = ps.getPsNo();
					
				}else {
					request.setAttribute("msg", "펫시터 승인이 아직 나질 않았습니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			}
			//PsBoard 객체 생성
			PsBoard pb = new PsBoard(hourPrice,service,size,age,psNo,
					checkIn,checkOut,oneDayPrice,title,content);
			
			System.out.println(pb);
			System.out.println("originFiles size : "+originFiles.size());
			ArrayList<IMG> fileList = new ArrayList<>();
			//사진의 바뀐 이름과 fileLevel들을 저장한 이미지 한개당 한개씩 만들어지는 IMG객체를 담는 list
			//사진들은 태그들을 순서가 역순으로 저장되는데 제일 마지막에 있는애가 제일먼저 저장이되고
			//제일 처음에 있는애가 제일 마지막으로 저장이 된다. 그래서 마지막에 있는애부터 접근 해야함
			int fileLevel = 0;
			for(int i = originFiles.size()-1;i>=0;i--) {
				IMG img = new IMG();
				img.setFilePath(savePath);
				img.setOriginName(originFiles.get(i));
				img.setChangeName(changeFiles.get(i));
				img.setCategory(3);
				if(i == originFiles.size()-1) {
					//순서가 제일 마지막일때
					img.setFileLevel(fileLevel++);
				}else {
					img.setFileLevel(fileLevel++);
				}
				System.out.println(img);
				fileList.add(img);
			}
			//여기까지 이제 객체를 생성해서 fileList랑 보드 객체를 만듬 이제 저장하면 됨
			System.out.println("fileList size : "+fileList.size());
			//저장을 위해 service로 넘겨주는 부분
			int result = new PsBoardInfoService().insertPsBoard(pb,fileList);
			
			if(result>0) {
				response.sendRedirect("SelectPsBoardList");
			}else {
				System.out.println("입력 실패");
				request.getSession().setAttribute("msg", "펫시터 글 등록 실패");
				response.sendRedirect("views/common/error.jsp");
			}
			
		
		}//multipartRequest일때 들어간다는 if문 괄호
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
