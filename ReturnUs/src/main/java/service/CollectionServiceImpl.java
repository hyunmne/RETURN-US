package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.CollectionDAO;
import dao.CollectionDAOImpl;
import dto.Collection;

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
		String colStatus = request.getParameter("colStatus");
		
		List<Collection> collectionList = colDao.selectCollectionList(colStatus);
		
		request.setAttribute("colStatus", colStatus);
		request.setAttribute("collectionList", collectionList);
	}

}
