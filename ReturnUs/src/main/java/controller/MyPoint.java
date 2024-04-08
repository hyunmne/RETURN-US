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
@WebServlet("/my-point")
public class MyPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPoint() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			CollectionService service = new CollectionServiceImpl();
			service.showMyPoint(request);
			request.getRequestDispatcher("/views/account/myPoint.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			CollectionService service = new CollectionServiceImpl();
			String pointType = request.getParameter("pointType");
			System.out.println(pointType);
			
			if(pointType.equals("received")) {
				service.showMyReceivedPoint(request);
				request.getRequestDispatcher("/views/account/myReceivedPoint.jsp").forward(request, response);
			} else if(pointType.equals("used")) {
				service.showMyUsedPoint(request);
				request.getRequestDispatcher("/views/account/myUsedPoint.jsp").forward(request, response);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
