package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AccountService;
import service.AccountServiceImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/account/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String accId = request.getParameter("accId");
		String accPassword = request.getParameter("accPassword");
		try {
			AccountService service = new AccountServiceImpl();			
			//login success시 cookie check & 저장
			String autologin = request.getParameter("autologin");
			
			Cookie autoLoginCookie = null;
			Cookie accIdCookie = null;
			Cookie accPasswordCookie = null;
			if(autologin!=null) {
				autoLoginCookie = new Cookie ("autologin", autologin);
				autoLoginCookie.setMaxAge(365 * 24 * 60 * 60); 
				accIdCookie = new Cookie("accId", accId);
				accIdCookie.setMaxAge(365 * 24 * 60 * 60);                
				accPasswordCookie = new Cookie("accPassword", accPassword);
				accPasswordCookie.setMaxAge(365 * 24 * 60 * 60);	
			}else {
				autoLoginCookie = new Cookie("autologin", "");
                autoLoginCookie.setMaxAge(0);
                accIdCookie = new Cookie("accId", "");   
                accIdCookie.setMaxAge(0);
                accPasswordCookie = new Cookie("accPassword", "");
                accPasswordCookie.setMaxAge(0);
			}			
			response.addCookie(autoLoginCookie);
			response.addCookie(accIdCookie);
			response.addCookie(accPasswordCookie);
			//session 저장
			request.getSession().setAttribute("account", accId);
			service.login(request);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
