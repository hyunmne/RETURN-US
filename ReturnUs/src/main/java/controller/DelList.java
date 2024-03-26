package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.Delivery;
import service.DeliveryService;
import service.DeliveryServiceImpl;

/**
 * Servlet implementation class DelList
 */
@WebServlet("/delivery")
public class DelList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        String id = request.getParameter("accId");
        
        try {
            DeliveryService delService = new DeliveryServiceImpl();
            List<Delivery> delList =  delService.deliveryList(request);
            Gson gson = new Gson();
            String data = gson.toJson(delList);
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(data);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
