package controller;

import java.io.Console;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Account;
import service.AccountService;
import service.AccountServiceImpl;

/**
 * Servlet implementation class FindId
 */
@WebServlet("/findid")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/account/findId.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		AccountService accountService = new AccountServiceImpl();
		
		try {
			String accName = request.getParameter("accName");
			String accBirth = request.getParameter("accBirth");
			String accEmail = request.getParameter("accEmail");
			String accEmailDo = request.getParameter("accEmailDo");
			System.out.println(accName);
			System.out.println(accBirth);
			System.out.println(accEmail);
			System.out.println(accEmailDo);
			Account account = accountService.findId(accName,accBirth,accEmail,accEmailDo);
			System.out.println(account);
			request.setAttribute("accId", account.getAccId());
			request.setAttribute("accJoinDt", account.getAccJoinDt());
			request.getRequestDispatcher("/views/account/resultFindId.jsp").forward(request, response);
		}catch (Exception e) {
			e.printStackTrace(); 
			request.getRequestDispatcher("views/account/notFountId.jsp").forward(request, response);
		}
		
	}

}
