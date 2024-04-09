package service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.AccountDAOImpl;
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
		AccountDAO accDao = new AccountDAOImpl();
		Integer pnt = acc.getAccPnt() - colUsePnt; 
		
		accDao.updatePoint(pnt, acc.getAccId());
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
		request.setCharacterEncoding("utf-8");
		String colNum = request.getParameter("colNum");
		
		Map<String, Object> collectionDetail = colDao.selectCollectionDetail(colNum);

		request.setAttribute("colNum", colNum);
		request.setAttribute("colDetail", collectionDetail);
	}

	@Override
	public void modifyCollectionFin(Collection col) throws Exception {
		colDao.updateCollectionFin(col);
	}

	@Override
	public void showMyCollection(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("acc");
		String accId = account.getAccId();
		int collectionCountInPreparation = colDao.selectCollectionCountByIdInPreparation(accId);
		int collectionCountInProgress = colDao.selectCollectionCountByIdInProgress(accId);
		int collectionCountFinished = colDao.selectCollectionCountByIdFinished(accId);
		int collectionCount = collectionCountInPreparation + collectionCountInProgress + collectionCountFinished;
		
		Integer page = 1;
		String pageNo = request.getParameter("page");
		
		if(pageNo != null) {
			page = Integer.parseInt(pageNo);
		}
		
		int maxPage = (int)Math.ceil((double) collectionCount /10);
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
		
		List<Map<String, Object>> collectionList = colDao.selectCollectionListById(accId, row);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("collectionCount", collectionCount);
		request.setAttribute("collectionCountInPreparation", collectionCountInPreparation);
		request.setAttribute("collectionCountInProgress", collectionCountInProgress);
		request.setAttribute("collectionCountFinished", collectionCountFinished);
		request.setAttribute("collectionList", collectionList);		
	}
	
	public void modifyMyCollection(HttpServletRequest request) throws Exception {		
		String colNum = request.getParameter("colNum");
		Collection collection = colDao.selectCollection(colNum);
		
		Integer colPaperInputted = Integer.parseInt(request.getParameter("colPaperInputted"));
		Integer colPtBodyInputted = Integer.parseInt(request.getParameter("colPtBodyInputted"));
		Integer colPtLidInputted = Integer.parseInt(request.getParameter("colPtLidInputted"));
		Integer colBt190Inputted = Integer.parseInt(request.getParameter("colBt190Inputted"));
		Integer colBt400Inputted = Integer.parseInt(request.getParameter("colBt400Inputted"));
		Integer colBt1000Inputted = Integer.parseInt(request.getParameter("colBt1000Inputted"));
		Integer colBt1000UpInputted = Integer.parseInt(request.getParameter("colBt1000UpInputted"));
		Integer colPpackInputted = Integer.parseInt(request.getParameter("colPpackInputted"));
		Integer colPlasticInputted = Integer.parseInt(request.getParameter("colPlasticInputted"));
		Integer colCanInputted = Integer.parseInt(request.getParameter("colCanInputted"));
		Integer colTotalPnt = Integer.parseInt(request.getParameter("colTotalPnt"));
		
		collection.setColPaper(colPaperInputted);
		collection.setColPtBody(colPtBodyInputted);
		collection.setColPtLid(colPtLidInputted);
		collection.setColBt190(colBt190Inputted);
		collection.setColBt400(colBt400Inputted);
		collection.setColBt1000(colBt1000Inputted);
		collection.setColBt1000Up(colBt1000UpInputted);
		collection.setColPpack(colPpackInputted);
		collection.setColPlastic(colPlasticInputted);
		collection.setColCan(colCanInputted);
		collection.setColTotalPnt(colTotalPnt);
		
		colDao.updateCollectionItemQuantity(collection);
	}

	@Override
	public void showMyPoint(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("acc");
		String accId = account.getAccId();
		
		Integer page = 1;
		String pageNo = request.getParameter("page");
		if(pageNo != null) {
			page = Integer.parseInt(pageNo);
		}		
		int pointCount=0;
		List<Map<String, Object>> pointList = null;
		int row = (page-1)*10;
		
		String pointType = request.getParameter("pointType");
		if(pointType==null) {
			pointCount = colDao.selectCollectionCountForPoint(accId);
			pointList = colDao.selectCollectionListForPoint(accId, row);
		} else if(pointType.trim().equals("used")) {
			pointCount = colDao.selectCollectionCountForUsingPoint(accId);
			pointList = colDao.selectCollectionListForUsingPoint(accId, row);
		} else if(pointType.trim().equals("received")) {
			pointCount = colDao.selectCollectionCountForGettingPoint(accId);
			pointList = colDao.selectCollectionListForGettingPoint(accId, row);
		}
		
		int maxPage = (int)Math.ceil((double) pointCount /10);
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
		
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("pointList", pointList);
		request.setAttribute("pointType", pointType);
	}
}
