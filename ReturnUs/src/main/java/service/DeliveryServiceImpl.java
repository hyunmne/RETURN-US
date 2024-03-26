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
		    System.out.println("파라미터id: " + id); // 파라미터가 정상적으로 전달되었는지 확인하기 위해 콘솔에 출력
		    
		    List<Delivery> delList = delDao.selectDelList(id);
		    
		    return delList;
	}

}
