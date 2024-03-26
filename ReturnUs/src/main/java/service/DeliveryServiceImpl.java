package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.DeliveryDAO;
import dao.DeliveryDAOImpl;
import dto.Delivery;

public class DeliveryServiceImpl implements DeliveryService {
	
	private DeliveryDAO delDao = new DeliveryDAOImpl();

	@Override
	public List<Delivery> deliveryList(HttpServletRequest request) throws Exception {
		 String id = request.getParameter("accId");
		    List<Delivery> delList = delDao.selectDelList(id);
		    return delList;
	}

}
