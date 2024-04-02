package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CollectionService;
import service.CollectionServiceImpl;

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
		// 인서트 해야됨 여기서 
		try {
			
			CollectionService service = new CollectionServiceImpl();
			service.insertCollect(request);
			
			System.out.println("InsertCol5 doPost");
			System.out.println("accName:" + request.getParameter("accName"));
			System.out.println("accTel:" + request.getParameter("accTel"));
			System.out.println("accPostCode:" + request.getParameter("accPostCode"));
			System.out.println("accAddr:" + request.getParameter("accAddr"));
			System.out.println("accDetailAddr:" + request.getParameter("accDetailAddr"));
			System.out.println("boxSize:" + request.getParameter("boxSize"));
			
			System.out.println("colPaper:" + request.getParameter("colPaper"));
			System.out.println("colCan:" + request.getParameter("colCan"));
			System.out.println("colBt190:" + request.getParameter("colBt190"));
			System.out.println("colBt400:" + request.getParameter("colBt400"));
			System.out.println("colBt1000:" + request.getParameter("colBt1000"));
			System.out.println("colBt1000Up:" + request.getParameter("colBt1000Up"));
			System.out.println("colPlastic:" + request.getParameter("colPlastic"));
			System.out.println("colPtLid:" + request.getParameter("colPtLid"));
			System.out.println("colPtBody:" + request.getParameter("colPtBody"));
			System.out.println("colPpack:" + request.getParameter("colPpack"));
			
			System.out.println("colTotalPnt:" + request.getParameter("colTotalPnt"));
			System.out.println("colUsePnt:" + request.getParameter("colUsePnt"));
			System.out.println("colPrice:" + request.getParameter("colPrice"));
			
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
