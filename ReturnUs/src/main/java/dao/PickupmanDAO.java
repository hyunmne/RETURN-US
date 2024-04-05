package dao;

import java.util.List;
import java.util.Map;

import dto.PickupMan;

public interface PickupmanDAO {
	List<PickupMan> selectPickupManList(String colNum) throws Exception;
	void insertPickMan(PickupMan pm) throws Exception;
	List<PickupMan> selectAllPMList(Integer row, String pmRegion) throws Exception;
	Integer selectAllPMCnt(String pmRegion) throws Exception;
	void updatePickupManStatus(String pmStatus, Integer pmNo) throws Exception;
	Map<String, Object> selectPickupMan(String colNum) throws Exception;
}
