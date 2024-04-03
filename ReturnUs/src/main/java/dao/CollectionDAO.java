package dao;

import java.util.List;
import java.util.Map;

import dto.Collection;

public interface CollectionDAO {
	void insertCollect(Collection col) throws Exception;
	List<Map<String, Object>> selectCollectionList(String colStatus, Integer row) throws Exception;
	Integer selectCollectionCount(String colStatus) throws Exception;
	Map<String, Object> selectCollectionDetail(String colNum) throws Exception;
	void updateColStatus(String colNum, String colStatus) throws Exception;
	void updateCollectionFin(Collection collection) throws Exception;
}

