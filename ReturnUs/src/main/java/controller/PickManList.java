package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.PickupmanDAO;
import dao.PickupmanDAOImpl;
import dto.PickupMan;
import service.PickupmanService;
import service.PickupmanServiceImpl;

/**
 * Servlet implementation class PickManList
 */
@WebServlet("/selectPick")
public class PickManList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PickManList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		try {
			PickupmanService service = new PickupmanServiceImpl();
			service.allPMList(request);
			request.getRequestDispatcher("/views/pickupMan/selectPmList.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errTitle", "조회 실패");
			request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		try {
//			PickupmanService service = new PickupmanServiceImpl();
//			service.allPMList(request);
//			request.setAttribute("cnt", request.getParameter("count"));
//			Gson gson = new Gson();
//			String data = gson.toJson(request);
//			response.setCharacterEncoding("utf-8");
//			response.getWriter().write(data);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("errTitle", "조회실패");
//			request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
//		}
//	}

}
