package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Collection;
import service.CollectionService;
import service.CollectionServiceImpl;
import service.PickupmanService;
import service.PickupmanServiceImpl;

/**
 * Servlet implementation class ColModifyManagement
 */
@WebServlet("/col-modify-mgt")
public class ColModifyMgt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ColModifyMgt() {
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
		Integer colPaperFin = Integer.parseInt(request.getParameter("colPaperFin"));
		Integer colPtBodyFin = Integer.parseInt(request.getParameter("colPtBodyFin"));
		Integer colPtLidFin = Integer.parseInt(request.getParameter("colPtLidFin"));
		Integer colBt190Fin = Integer.parseInt(request.getParameter("colBt190Fin"));
		Integer colBt400Fin = Integer.parseInt(request.getParameter("colBt400Fin"));
		Integer colBt1000Fin = Integer.parseInt(request.getParameter("colBt1000Fin"));
		Integer colBt1000UpFin = Integer.parseInt(request.getParameter("colBt1000UpFin"));
		Integer colPpackFin = Integer.parseInt(request.getParameter("colPpackFin"));
		Integer colPlasticFin = Integer.parseInt(request.getParameter("colPlasticFin"));
		Integer colCanFin = Integer.parseInt(request.getParameter("colCanFin"));
		Integer colTotalPnt = Integer.parseInt(request.getParameter("colTotalPnt"));
		String colRejection = request.getParameter("colRejection");
		String colStatus = request.getParameter("colStatus");
		String colResult = "";
		
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
		
		// 수거수량과 신청수량 갯수 비교 (변경 여부 확인)
		if (colPaperFin == colPaper && colPtBodyFin == colPtBody && colPtLidFin == colPtLid && colBt190Fin == colBt190 &&
		    colBt400Fin == colBt400 && colBt1000Fin == colBt1000 && colBt1000UpFin == colBt1000Up &&
		    colPpackFin == colPpack && colPlasticFin == colPlastic && colCanFin == colCan) {
		    colResult = "정상지급";
		} else if (colPaperFin == 0 && colPtBodyFin == 0 && colPtLidFin == 0 && colBt190Fin == 0 && colBt400Fin == 0 
				&& colBt1000Fin == 0 && colBt1000UpFin == 0 && colPpackFin == 0 && colPlasticFin == 0 && colCanFin == 0 ) {
		    colResult = "전체반려";
		} else if (colPaperFin != colPaper || colPtBodyFin != colPtBody || colPtLidFin != colPtLid ||
		           colBt190Fin != colBt190 || colBt400Fin != colBt400 || colBt1000Fin != colBt1000 ||
		           colBt1000UpFin != colBt1000Up || colPpackFin != colPpack || colPlasticFin != colPlastic || colCanFin != colCan) {
		    colResult = "부분반려";
		} 
		
		//픽업맨 업무상태 변경을 위해 받아온 파라미터
		Integer pmNo = Integer.parseInt(request.getParameter("pmNo"));
		String pmStatus = request.getParameter("pmStatus");
		
		try {
			CollectionService colService = new CollectionServiceImpl();
			PickupmanService pmService = new PickupmanServiceImpl();
			
			Collection col = new Collection(colNum, colStatus, colPaperFin, colPtBodyFin, colPtLidFin, colBt190Fin, colBt400Fin, colBt1000Fin, 
											colBt1000UpFin, colPpackFin, colPlasticFin, colCanFin,colRejection, colTotalPnt, colResult);
			colService.modifyCollectionFin(col);
			colService.collectionDetail(request);
			pmService.allocationPickupMan(colNum, pmNo, pmStatus);
			pmService.pickupManInfo(request);
			request.getRequestDispatcher("/views/collection_mgt/colCompletionForm.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
