package dao;

import java.util.List;

import dto.Collection;

public interface CollectionDAO {
	void insertCollect(Collection col) throws Exception;
	List<Collection> selectCollectionList(String colStatus) throws Exception;
}

