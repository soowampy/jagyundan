package admin.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.user.model.service.adminUserService;
import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class adUsermailServlet
 */
@WebServlet("/adUsermailServlet")
public class adUsermailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adUsermailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이메일 알아내기
		request.setCharacterEncoding("UTF-8");

		String irr[] = request.getParameterValues("bId");
		String title= request.getParameter("title");
		String content= request.getParameter("content");
		ArrayList<User> list = new adminUserService().selectList(irr);
		
		
		
		//메일 보내기
        //mail server 설정
        String host = "smtp.naver.com";
        final String user = "b______d1234"; //자신의 네이버 계정
        final String password = "tndhks123!";//자신의 네이버 패스워드
        
        //메일 받을 주소
        /*String to_email = email;*/
        
        //SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
        //인증 번호 생성기

        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
            	 return new PasswordAuthentication(user,password);
            }
        });
        System.out.println(list.size());
        //email 전송
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "자견단"));
            
            for(int i=0; i<list.size(); i++) {
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(list.get(i).getEmail()));
            
            //메일 제목
            msg.setSubject(title);
            //메일 내용
            msg.setText(content);

            Transport.send(msg);
            System.out.println("이메일 전송");
            }

            RequestDispatcher rd = request.getRequestDispatcher("adminUserServlet");  
            rd.forward(request, response);
        }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
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
