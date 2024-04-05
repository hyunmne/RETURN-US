package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CollectionService;
import service.CollectionServiceImpl;
import service.PickupmanService;
import service.PickupmanServiceImpl;

/**
 * Servlet implementation class ColCompletionMgt
 */
@WebServlet("/col-completion")
public class ColCompletionMgt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ColCompletionMgt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CollectionService colService = new CollectionServiceImpl();
			PickupmanService pmService = new PickupmanServiceImpl();
			colService.collectionDetail(request);
			pmService.pickupManInfo(request);
			
			request.getRequestDispatcher("/views/collection_mgt/colCompletionForm.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
