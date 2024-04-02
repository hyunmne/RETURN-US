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
@WebServlet("/collect4")
public class InsertCol4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCol4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		request.getRequestDispatcher("/views/collection/pickForm(4).jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 10. pickForm4에서 받아온 데이터를 다시 request에 세팅하여 pickForm5로 이동한다.
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
			
			Integer colPaper = Integer.parseInt(request.getParameter("colPaper"));
			Integer colCan = Integer.parseInt(request.getParameter("colCan"));
			Integer colBt190 = Integer.parseInt(request.getParameter("colBt190"));
			Integer colBt400 = Integer.parseInt(request.getParameter("colBt400"));
			Integer colBt1000 = Integer.parseInt(request.getParameter("colBt1000"));
			Integer colBt1000Up = Integer.parseInt(request.getParameter("colBt1000Up"));
			Integer colPlastic = Integer.parseInt(request.getParameter("colPlastic"));
			Integer colPtLid = Integer.parseInt(request.getParameter("colPtLid"));
			Integer colPtBody = Integer.parseInt(request.getParameter("colPtBody"));
			Integer colPpack = Integer.parseInt(request.getParameter("colPpack"));

			request.setAttribute("colPaper", colPaper);
			request.setAttribute("colCan", colCan);
			request.setAttribute("colBt190", colBt190);
			request.setAttribute("colBt400", colBt400);
			request.setAttribute("colBt1000", colBt1000);
			request.setAttribute("colBt1000Up", colBt1000Up);
			request.setAttribute("colPlastic", colPlastic);
			request.setAttribute("colPtLid", colPtLid);
			request.setAttribute("colPtBody", colPtBody);
			request.setAttribute("colPpack", colPpack);
			
			request.getRequestDispatcher("/views/collection/pickForm(5).jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
