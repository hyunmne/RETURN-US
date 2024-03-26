package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AccountService;
import service.AccountServiceImpl;

/**
 * Servlet implementation class AccountDoubleId
 */
@WebServlet("/accountdoubleid")
public class AccountDoubleId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountDoubleId() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			String accId = request.getParameter("accId");
			AccountService accountService = new AccountServiceImpl();
			boolean doubleId = accountService.accountIdCheck(accId);
			response.getWriter().write(String.valueOf(doubleId));
		}catch (Exception e) {
			response.sendError(500);
		}
	}

}
