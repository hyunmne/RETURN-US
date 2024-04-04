package service;

import java.util.List;

import dto.PickupMan;

public interface PickupmanService {
	List<PickupMan> pickupManList(String colNum) throws Exception;
}
