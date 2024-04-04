package dao;

import java.util.List;

import dto.PickupMan;

public interface PickupmanDAO {
	List<PickupMan> selectPickupManList(String colNum) throws Exception;
}
