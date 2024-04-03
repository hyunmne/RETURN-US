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
 * Servlet implementation class ColDetailManagement
 */
@WebServlet("/col-detail-mgt")
public class ColDetailMgt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ColDetailMgt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CollectionService service = new CollectionServiceImpl();
			service.collectionDetail(request);
			request.getRequestDispatcher("/views/collection_mgt/colDetailManagement.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
