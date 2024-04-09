package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.PickupMan;

public interface PickupmanService {
	void pickupManList(HttpServletRequest request) throws Exception;
	void joinPickMan(HttpServletRequest request) throws Exception; 
//	List<PickupMan> allPMList(HttpServletRequest request) throws Exception;
	void allocationPickupMan(String colNum, Integer pmNo, String pmStatus) throws Exception;
	void pickupManInfo(HttpServletRequest request) throws Exception;
	
	void allPMList(HttpServletRequest request) throws Exception;
}
