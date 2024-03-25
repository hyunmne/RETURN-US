package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertCol3
 */
@WebServlet("/collect3")
public class InsertCol3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCol3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/collection/pickForm(3).jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String accName = request.getParameter("accName");
			String accTel = request.getParameter("accTel");
			String accPc = request.getParameter("accPostCode");
			String accAdr = request.getParameter("accAddr");
			String accDAdr = request.getParameter("accDetailAddr");
			
			System.out.println(accName +  accTel + accPc + accAdr + accDAdr);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
