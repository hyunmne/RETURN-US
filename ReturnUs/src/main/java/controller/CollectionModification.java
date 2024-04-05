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
 * Servlet implementation class ColModifyManagement
 */
@WebServlet("/collection-modify")
public class CollectionModification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectionModification() {
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
			request.getRequestDispatcher("/views/collection/collectionModification.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			CollectionService service = new CollectionServiceImpl();
			service.modifyMyCollection(request);
			service.collectionDetail(request);						
			request.getRequestDispatcher("/views/collection/collectionDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
