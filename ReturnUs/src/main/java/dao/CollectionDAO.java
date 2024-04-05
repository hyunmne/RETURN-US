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
	List<Map<String, Object>> selectCollectionListById(String accId, Integer row) throws Exception;
	Integer selectCollectionCountByIdInPreparation(String accId) throws Exception;
	Integer selectCollectionCountByIdInProgress(String accId) throws Exception;
	Integer selectCollectionCountByIdFinished(String accId) throws Exception;
	List<Map<String, Object>> selectCollectionListForPoint(String accId, Integer row) throws Exception;
	List<Map<String, Object>> selectCollectionListForUsingPoint(String accId, Integer row) throws Exception;
	List<Map<String, Object>> selectCollectionListForGettingPoint(String accId, Integer row) throws Exception;
	Integer selectCollectionCountForPoint(String accId) throws Exception;
	Integer selectCollectionCountForUsingPoint(String accId) throws Exception;	
	Integer selectCollectionCountForGettingPoint(String accId) throws Exception;
	Collection selectCollection(String colNum) throws Exception;
	void updateCollectionItemQuantity(Collection collection) throws Exception;
	void updateColPmNo(Integer colPmNo, String colNum) throws Exception;
}

