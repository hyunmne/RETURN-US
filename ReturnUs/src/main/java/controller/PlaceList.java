package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import dto.Place;
import service.PlaceService;
import service.PlaceServiceImpl;

/**
 * Servlet implementation class PlaceList
 */
@WebServlet("/placeList")
public class PlaceList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			PlaceService service = new PlaceServiceImpl();
			service.placeTypeList(request);
			request.getRequestDispatcher("/views/place/placeList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String plaType = request.getParameter("plaType");
		String plaRegion = request.getParameter("plaRegion");
		String plaDistrict = request.getParameter("plaDistrict");
		
		try {
			PlaceService service = new PlaceServiceImpl();
			List<Place> places = service.placeList(plaType, plaRegion, plaDistrict);
			
			JSONArray jPlaces = new JSONArray();
			for(Place place : places) {
				JSONObject jPlace = new JSONObject();
				jPlace.put("plaNo", place.getPlaNo());
				jPlace.put("plaName", place.getPlaName());
				jPlace.put("plaAddr", place.getPlaAddr());
				jPlace.put("plaType", place.getPlaType());
				jPlace.put("plaLat", place.getPlaLat());
				jPlace.put("plaLong", place.getPlaLong());
				jPlace.put("plaRegion", place.getPlaRegion());
				jPlace.put("plaDistrict", place.getPlaDistrict());
				jPlaces.add(jPlace);
			}
			response.getWriter().write(jPlaces.toJSONString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
