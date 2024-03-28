package dao;

import java.util.List;

import dto.Place;

public interface PlaceDAO {
	List<Place> selectPlaceList(String plaType, String plaRegion, String plaDistrict, Integer row) throws Exception;
	Integer selectPlaceCount(String plaType, String plaRegion, String plaDistrict) throws Exception;
	List<Place> selectCategoryList(String plaType) throws Exception;
}
