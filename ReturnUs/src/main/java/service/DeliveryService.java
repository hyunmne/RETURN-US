package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Delivery;

public interface DeliveryService {
	List<Delivery> deliveryList (HttpServletRequest request) throws Exception;
	void insertDelivery(HttpServletRequest request) throws Exception;
}
