package user.controller;


import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

import user.model.service.UserService;

/**
 * Servlet implementation class emailCheckServlet
 */
@WebServlet("/emailCheckServlet")
public class emailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emailCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = request.getParameter("memberId");
        String email = request.getParameter("emailCheck");
        
        
        /*      
		int result = new UserService().emailCheck(email);
		PrintWriter out = response.getWriter();
		if(result > 0 ) {
			out.print("fail");
		}else {
			out.print("success");
		}
        
        */
        
        //먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
        int result = new UserService().emailCheck(email);
        if(result > 0 ) {
            request.setAttribute("msg", "중복된 이메일이 존재합니다!");
            request.getRequestDispatcher("views/member/emailCheckForm.jsp").forward(request, response);
            return;
        }
        
        
                //mail server 설정
                String host = "smtp.naver.com";
                final String user = "b______d1234"; //자신의 네이버 계정
                final String password = "tndhks123!";//자신의 네이버 패스워드
                
                //메일 받을 주소
                String to_email = email;;
                
                //SMTP 서버 정보를 설정한다.
                Properties props = new Properties();
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.port", 465);
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.ssl.enable", "true");
                
                //인증 번호 생성기
                StringBuffer temp =new StringBuffer();
                Random rnd = new Random();
                for(int i=0;i<10;i++)
                {
                    int rIndex = rnd.nextInt(3);
                    switch (rIndex) {
                    case 0:
                        // a-z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                        break;
                    case 1:
                        // A-Z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                        break;
                    case 2:
                        // 0-9
                        temp.append((rnd.nextInt(10)));
                        break;
                    }
                }
                String AuthenticationKey = temp.toString();
                System.out.println(AuthenticationKey);
                
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                    	 return new PasswordAuthentication(user,password);
                    }
                });
                
                //email 전송
                try {
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(user, "자견단"));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
                    
                    //메일 제목
                    msg.setSubject("자견단 회원가입 인증 확인 메일입니다!");
                    //메일 내용
                    msg.setText("인증 코드는 "+temp+" 입니다! 정확하게 입력해주세요");

                    
                    Transport.send(msg);
                    System.out.println("이메일 전송");
    
            		String s1 = temp.substring(0,temp.length());
                    System.out.println(s1+"인증코드");
                    request.setAttribute("code", s1);
                    request.setAttribute("email", email);
                    request.setAttribute("msg", "인증번호가 전송되었습니다! 메일을 확인해주세요");
                    RequestDispatcher rd = request.getRequestDispatcher("views/member/emailCheckForm.jsp");  
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