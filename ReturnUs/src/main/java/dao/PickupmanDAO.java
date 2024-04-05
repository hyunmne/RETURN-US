package dao;

import java.util.List;

import dto.PickupMan;

public interface PickupmanDAO {
	List<PickupMan> selectPickupManList(String colNum) throws Exception;
	void insertPickMan(PickupMan pm) throws Exception;
	List<PickupMan> selectAllPMList(Integer row, String pmRegion) throws Exception;
	Integer selectAllPMCnt(String pmRegion) throws Exception;
}
