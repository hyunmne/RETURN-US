package service;

import javax.servlet.http.HttpServletRequest;

public interface CollectionService {
	void insertCollect(HttpServletRequest request) throws Exception;
	void collectionList(HttpServletRequest request) throws Exception;
}
