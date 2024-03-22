package service;

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

}
