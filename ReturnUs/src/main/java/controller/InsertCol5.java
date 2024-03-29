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
@WebServlet("/collect5")
public class InsertCol5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCol5() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		request.getRequestDispatcher("/views/collection/pickForm(5).jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
			
			request.setAttribute("accName", request.getParameter("accName"));
			request.setAttribute("accTel", request.getParameter("accTel"));
			request.setAttribute("accPostCode", request.getParameter("accPostCode"));
			request.setAttribute("accAddr", request.getParameter("accAddr"));
			request.setAttribute("accDetailAddr", request.getParameter("accDetailAddr"));
			request.setAttribute("boxSize", request.getParameter("boxSize"));

			request.setAttribute("colPaper", request.getParameter("colPaper"));
			request.setAttribute("colCan", request.getParameter("colCan"));
			request.setAttribute("colBt190", request.getParameter("colBt190"));
			request.setAttribute("colBt400", request.getParameter("colBt400"));
			request.setAttribute("colBt1000", request.getParameter("colBt1000"));
			request.setAttribute("colBt1000Up", request.getParameter("colBt1000Up"));
			request.setAttribute("colPlastic", request.getParameter("colPlastic"));
			request.setAttribute("colPtLid", request.getParameter("colPtLid"));
			request.setAttribute("colPtBody", request.getParameter("colPtBody"));
			request.setAttribute("colPpack", request.getParameter("colPpack"));
			
			
			request.getRequestDispatcher("/views/collection/pickForm(6).jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
