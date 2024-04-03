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
 * Servlet implementation class MyCollection
 */
@WebServlet("/my-collection")
public class MyCollection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyCollection() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			CollectionService service = new CollectionServiceImpl();
			service.showMyCollection(request);
			request.getRequestDispatcher("/views/account/myCollection.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
