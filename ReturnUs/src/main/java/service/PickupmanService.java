package service;

import javax.servlet.http.HttpServletRequest;

public interface PickupmanService {
	void pickupManList(HttpServletRequest request) throws Exception;
	void joinPickMan(HttpServletRequest request) throws Exception; 
	void allPMList(HttpServletRequest request) throws Exception;

}
