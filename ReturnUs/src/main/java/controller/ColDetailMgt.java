package controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import service.CollectionService;
import service.CollectionServiceImpl;
import service.PickupmanService;
import service.PickupmanServiceImpl;

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
			CollectionService colService = new CollectionServiceImpl();
			PickupmanService pmService = new PickupmanServiceImpl();
			colService.collectionDetail(request);
			pmService.pickupManList(request);
			request.getRequestDispatcher("/views/collection_mgt/colDetailManagement.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String jsonStr = request.getParameter("pickman");
		
		Gson gson = new Gson();
		//type에 맞게 객체로 변환
		Type type = new TypeToken<Map<String,String>>(){}.getType();
		Map<String, String> pickupManData = gson.fromJson(jsonStr, type);
		
		String colNum = pickupManData.get("colNum");
		Integer pmNo = Integer.parseInt(pickupManData.get("pmNo"));
		String pmStatus = pickupManData.get("pmStatus");
		
		try {
			PickupmanService pmService = new PickupmanServiceImpl();
			pmService.allocationPickupMan(colNum, pmNo, pmStatus);
			String encodedStatus = URLEncoder.encode("수거진행중", StandardCharsets.UTF_8);
			response.sendRedirect("col-management?colNum=" + colNum + "&colStatus=" + encodedStatus);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
