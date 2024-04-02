package service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import dao.CollectionDAO;
import dao.CollectionDAOImpl;
import dto.Collection;
import util.PageInfo;

public class CollectionServiceImpl implements CollectionService {

	private CollectionDAO colDao = new CollectionDAOImpl();
	
	@Override
	public void insertCollect(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Collection col = new Collection();
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
