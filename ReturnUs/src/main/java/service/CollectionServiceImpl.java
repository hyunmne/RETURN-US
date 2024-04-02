package service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.CollectionDAO;
import dao.CollectionDAOImpl;
import dto.Account;
import dto.Collection;
import util.PageInfo;

public class CollectionServiceImpl implements CollectionService {

	private CollectionDAO colDao = new CollectionDAOImpl();
	
	@Override
	public void insertCollect(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Account acc = (Account)session.getAttribute("acc");
		System.out.println(acc.getAccId());
		String colAddr = request.getParameter("accAddr") + " "+request.getParameter("accDetailAddr");
		int colPost = Integer.parseInt(request.getParameter("boxSize"));
		
		int colPaper = Integer.parseInt(request.getParameter("colPaper"));
		int colCan = Integer.parseInt(request.getParameter("colCan"));
		int colBt190 = Integer.parseInt(request.getParameter("colBt190"));
		int colBt400 = Integer.parseInt(request.getParameter("colBt400"));
		int colBt1000 = Integer.parseInt(request.getParameter("colBt1000"));
		int colBt1000Up = Integer.parseInt(request.getParameter("colBt1000Up"));
		int colPlastic = Integer.parseInt(request.getParameter("colPlastic"));
		int colPtLid = Integer.parseInt(request.getParameter("colPtLid"));
		int colPtBody = Integer.parseInt(request.getParameter("colPtBody"));
		int colPpack = Integer.parseInt(request.getParameter("colPpack"));
		
		int colTotalPnt = Integer.parseInt(request.getParameter("colTotalPnt"));
		int colPrice = Integer.parseInt(request.getParameter("colPrice"));
		int colUsePnt = Integer.parseInt(request.getParameter("colUsePnt")); 
		
		Collection col = new Collection(acc.getAccId(), colAddr, colPost, colUsePnt, colPrice, 
										colPaper, colPtBody, colPtLid, colBt190, colBt400, colBt1000, colBt1000Up,
										colPpack, colPlastic, colCan, colTotalPnt);
		colDao.insertCollect(col);
	}

	@Override
	public void collectionList(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		Integer page = 1;
		String pageNo = request.getParameter("page");
		String colNum = request.getParameter("colNum");
		String colStatus = request.getParameter("colStatus");
		
		if(pageNo != null) {
			page = Integer.parseInt(pageNo);
		}
		
		int maxPage = (int)Math.ceil((double)colDao.selectCollectionCount(colStatus)/10);
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pageInfo = new PageInfo();
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10;
		
		List<Map<String, Object>> collectionList = colDao.selectCollectionList(colStatus, row);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("colStatus", colStatus);
		request.setAttribute("collectionList", collectionList);

		colDao.updateColStatus(colNum, colStatus);
	}

	@Override
	public void collectionDetail(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");;
		String colNum = request.getParameter("colNum");
		
		Map<String, Object> collectionDetail = colDao.selectCollectionDetail(colNum);
		
		request.setAttribute("colNum", colNum);
		request.setAttribute("colDetail", collectionDetail);

	}

	@Override
	public void modifyCollection(Collection collection) throws Exception {
		colDao.updateCollection(collection);
	}

}
