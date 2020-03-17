package board.controller;

import java.io.File;
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

import board.model.service.BoardService;
import board.model.vo.Board;
import common.MyFileRenamePolicy;
import common.model.vo.IMG;
import user.model.vo.User;

/**
 * Servlet implementation class IMGInsertServlet
 */
@WebServlet("/IMGInsertServlet")
public class IMGInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IMGInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize=1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "/resources/board/image/";
	
			
			MultipartRequest multipartRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
	

			ArrayList<String> changeFiles = new ArrayList<>();
			
			ArrayList<String> originFiles = new ArrayList<>();
			
			Enumeration<String>files = multipartRequest.getFileNames();
			System.out.println(files);
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multipartRequest.getFilesystemName(name)!=null) {
					
					String changeName = multipartRequest.getFilesystemName(name);
					
					String originName = multipartRequest.getOriginalFileName(name);
				
					changeFiles.add(changeName);
					
					originFiles.add(originName);
				
					
				
			}
		}
			
				String title=multipartRequest.getParameter("title");
				String content = multipartRequest.getParameter("content");
				String userNo = String.valueOf(((User)request.getSession().getAttribute("loginUser")).getUserNo());
				Board b = new Board();
				b.setTitle(title);
				b.setContent(content);
				b.setUserName(userNo);
		
				ArrayList<IMG> fileList = new ArrayList<>();
				for(int i=originFiles.size()-1;i>=0;i--) {
					IMG image = new IMG();
					image.setFilePath(savePath);
					image.setOriginName(originFiles.get(i));
					image.setChangeName(changeFiles.get(i));
					
					if(i==originFiles.size()-1) {
						image.setFileLevel(0);
					}else if(i==originFiles.size()-2) {
						image.setFileLevel(1);
					}else if(i==originFiles.size()-3) {
						image.setFileLevel(2);
					}else if(i==originFiles.size()-4) {
						image.setFileLevel(3);
					}
					fileList.add(image);
				}
				System.out.println(fileList);
				int result = new BoardService().insertIMG(b, fileList);
				
				if(result>0) {
					response.sendRedirect("IMGListServlet");
				}else {
					for(int i=0;i<changeFiles.size();i++) {
						// 파일 시스템에 저장된 이름으로 파일 객체 생성
						File failedFile =new File(savePath+changeFiles.get(i));
						failedFile.delete();
						
					}	
					System.out.println("삭제실패!");
				}
			
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
