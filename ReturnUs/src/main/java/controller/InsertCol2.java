package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Delivery;


/**
 * Servlet implementation class InsertCol2
 */
@WebServlet("/collect2")
public class InsertCol2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCol2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/views/collection/pickForm(2).jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			String accName = request.getParameter("accName");
			String accTel = request.getParameter("accTel");
			String accPc = request.getParameter("accPostCode");
			String accAddr = request.getParameter("accAddr");
			String accDAdr = request.getParameter("accDetailAddr");
			
			request.setAttribute("accName", accName);
			request.setAttribute("accTel", accTel);
			request.setAttribute("accPostCode", accPc);
			request.setAttribute("accAddr", accAddr);
			request.setAttribute("accDetailAddr", accDAdr);
			
			request.getRequestDispatcher("/views/collection/pickForm(3).jsp").forward(request, response);
		} catch(Exception e) {
			
			request.setAttribute("errTitle", "데이터를 전송할 수 없음");
			request.setAttribute("errContent", "askdf;kasf;al");
			request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
		}
	}

}
