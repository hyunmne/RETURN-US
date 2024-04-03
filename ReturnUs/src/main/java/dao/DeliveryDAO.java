package dao;

import java.util.List;

import dto.Delivery;

public interface DeliveryDAO {
	List<Delivery> selectDelList(String id) throws Exception;
	void insertDelivery(Delivery del) throws Exception;
	
}
