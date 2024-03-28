package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AccountService;
import service.AccountServiceImpl;

@WebServlet("/modify-profile")
public class ModifyingProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModifyingProfile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/account/modifyingProfile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			AccountService accountService = new AccountServiceImpl();
			accountService.modifyProfile(request);
			request.getRequestDispatcher("/views/account/modifyingProfile.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
