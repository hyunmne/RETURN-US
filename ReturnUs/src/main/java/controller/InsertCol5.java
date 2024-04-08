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
			request.getRequestDispatcher("/views/collection/pickForm(6).jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
