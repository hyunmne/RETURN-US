package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PickupmanService;
import service.PickupmanServiceImpl;

/**
 * Servlet implementation class JoinPM
 */
@WebServlet("/joinPick")
public class JoinPM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinPM() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		request.getRequestDispatcher("/views/pickupMan/joinPick.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PickupmanService service = new PickupmanServiceImpl();
			service.joinPickMan(request);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errTitle", "사원 계정 등록 불가");
			request.setAttribute("errTitle", e.getMessage());
			request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
		}
	}

}
