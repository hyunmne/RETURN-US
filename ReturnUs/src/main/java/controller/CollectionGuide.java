package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/collection-guide")
public class CollectionGuide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CollectionGuide() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/guide/collectionGuide.jsp").forward(request, response);
	}

}
