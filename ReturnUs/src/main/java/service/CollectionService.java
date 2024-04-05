package service;

import javax.servlet.http.HttpServletRequest;

import dto.Collection;

public interface CollectionService {
	void insertCollect(HttpServletRequest request) throws Exception;
	void collectionList(HttpServletRequest request) throws Exception;
	void collectionDetail(HttpServletRequest request) throws Exception;
	void modifyCollectionFin(Collection collection) throws Exception;
	void showMyCollection(HttpServletRequest request) throws Exception;
	void modifyMyCollection(HttpServletRequest request) throws Exception;
	void showMyPoint(HttpServletRequest request) throws Exception;
}
