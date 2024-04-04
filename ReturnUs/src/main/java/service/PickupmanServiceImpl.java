package service;

import java.util.List;

import dao.PickupmanDAO;
import dao.PickupmanDAOImpl;
import dto.PickupMan;

public class PickupmanServiceImpl implements PickupmanService {
	
	PickupmanDAO pmDao = new PickupmanDAOImpl();
	
	@Override
	public List<PickupMan> pickupManList(String colNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
