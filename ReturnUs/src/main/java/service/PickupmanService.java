package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.PickupMan;

public interface PickupmanService {
	List<PickupMan> pickupManList(String colNum) throws Exception;
	void joinPickMan(HttpServletRequest request) throws Exception; 
	void allPMList(HttpServletRequest request) throws Exception;
}
