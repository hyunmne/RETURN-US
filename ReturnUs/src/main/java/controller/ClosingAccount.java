package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AccountService;
import service.AccountServiceImpl;

@WebServlet("/close-account")
public class ClosingAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ClosingAccount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/account/closingAccount.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			AccountService accountService = new AccountServiceImpl();
			accountService.closeAccount(request);
			response.sendRedirect("main");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
