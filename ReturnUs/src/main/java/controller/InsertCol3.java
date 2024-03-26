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
		request.setCharacterEncoding("utf-8");
		
		request.getRequestDispatcher("/views/collection/pickForm(3).jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
			String accName = request.getParameter("accName");
			String accTel = request.getParameter("accTel");
			String accPostCode = request.getParameter("accPostCode");
			String accAddr = request.getParameter("accAddr");
			String accDetailAddr = request.getParameter("accDetailAddr");
			String boxSize = request.getParameter("boxSize");
			
			request.setAttribute("accName", accName);
			request.setAttribute("accTel", accTel);
			request.setAttribute("accPostCode", accPostCode);
			request.setAttribute("accAddr", accAddr);
			request.setAttribute("accDetailAddr", accDetailAddr);
			request.setAttribute("boxSize", boxSize);
			
			System.out.println("insertcol3 : "+accName +  accTel + accPostCode + accAddr + accDetailAddr+boxSize);
			
			request.getRequestDispatcher("/views/collection/pickForm(4).jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
