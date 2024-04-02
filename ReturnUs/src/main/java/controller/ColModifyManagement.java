package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Collection;
import service.CollectionService;
import service.CollectionServiceImpl;

/**
 * Servlet implementation class ColModifyManagement
 */
@WebServlet("/col-modify-mgt")
public class ColModifyManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ColModifyManagement() {
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
			request.getRequestDispatcher("/views/collection_mgt/colModifyManagement.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String colNum = request.getParameter("colNum");
		
		//수거수량 갯수 (변경된 수량)
		Integer colPaper = Integer.parseInt(request.getParameter("colPaper"));
		Integer colPtBody = Integer.parseInt(request.getParameter("colPtBody"));
		Integer colPtLid = Integer.parseInt(request.getParameter("colPtLid"));
		Integer colBt190 = Integer.parseInt(request.getParameter("colBt190"));
		Integer colBt400 = Integer.parseInt(request.getParameter("colBt400"));
		Integer colBt1000 = Integer.parseInt(request.getParameter("colBt1000"));
		Integer colBt1000Up = Integer.parseInt(request.getParameter("colBt1000Up"));
		Integer colPpack = Integer.parseInt(request.getParameter("colPpack"));
		Integer colPlastic = Integer.parseInt(request.getParameter("colPlastic"));
		Integer colCan = Integer.parseInt(request.getParameter("colCan"));
		Integer colTotalPnt = Integer.parseInt(request.getParameter("colTotalPnt"));
		String colRejection = request.getParameter("colRejection");
		String colStatus = request.getParameter("colStatus");
		String colResult = "";
		
		//신청수량 갯수 (변경되기 전 수량)
		Integer prevColPaper = Integer.parseInt(request.getParameter("prevColPaper"));
		Integer prevColPtBody = Integer.parseInt(request.getParameter("prevColPtBody"));
		Integer prevColPtLid = Integer.parseInt(request.getParameter("prevColPtLid"));
		Integer prevColBt190 = Integer.parseInt(request.getParameter("prevColBt190"));
		Integer prevColBt400 = Integer.parseInt(request.getParameter("prevColBt400"));
		Integer prevColBt1000 = Integer.parseInt(request.getParameter("prevColBt1000"));
		Integer prevColBt1000Up = Integer.parseInt(request.getParameter("prevColBt1000Up"));
		Integer prevColPpack = Integer.parseInt(request.getParameter("prevColPpack"));
		Integer prevColPlastic = Integer.parseInt(request.getParameter("prevColPlastic"));
		Integer prevColCan = Integer.parseInt(request.getParameter("prevColCan"));
		
		// 수거수량과 신청수량 갯수 비교 (변경 여부 확인)
		if (colPaper == prevColPaper && colPtBody == prevColPtBody && colPtLid == prevColPtLid && colBt190 == prevColBt190 &&
		    colBt400 == prevColBt400 && colBt1000 == prevColBt1000 && colBt1000Up == prevColBt1000Up &&
		    colPpack == prevColPpack && colPlastic == prevColPlastic && colCan == prevColCan) {
		    colResult = "정상지급";
		} else if (colPaper == 0 && colPtBody == 0 && colPtLid == 0 && colBt190 == 0 && colBt400 == 0 
				&& colBt1000 == 0 && colBt1000Up == 0 && colPpack == 0 && colPlastic == 0 && colCan == 0 ) {
		    colResult = "전체반려";
		} else if (colPaper != prevColPaper || colPtBody != prevColPtBody || colPtLid != prevColPtLid ||
		           colBt190 != prevColBt190 || colBt400 != prevColBt400 || colBt1000 != prevColBt1000 ||
		           colBt1000Up != prevColBt1000Up || colPpack != prevColPpack || colPlastic != prevColPlastic || colCan != prevColCan) {
		    colResult = "부분반려";
		} 
		
		try {
			CollectionService service = new CollectionServiceImpl();
			Collection col = new Collection(colNum, colResult, colPaper, colPtBody, colPtLid, colBt190, colBt400, colBt1000, colBt1000Up,
											colPpack, colPlastic, colCan, colTotalPnt, colRejection, colStatus);
			service.modifyCollection(col);
			String encodedColStatus = URLEncoder.encode("수거진행중", "UTF-8");
			response.sendRedirect("col-management?colStatus="+encodedColStatus);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
