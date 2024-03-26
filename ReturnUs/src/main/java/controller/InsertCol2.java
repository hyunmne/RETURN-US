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
			String del = request.getParameter("colForm");
			System.out.println("del : "+del);
			
			String boxSize = request.getParameter("boxSize"); // 받아옴
			System.out.println(boxSize);
			String accName = request.getParameter("accName");
			String accTel = request.getParameter("accTel");
			String accPc = request.getParameter("accPostCode");
			String accAdr = request.getParameter("accAddr");
			String accDAdr = request.getParameter("accDetailAddr");
			
			System.out.println(accName +  accTel + accPc + accAdr + accDAdr);
			
			request.getRequestDispatcher("/views/collection/pickForm(3).jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
