package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Place;

public interface PlaceService {
	void placeTypeList(HttpServletRequest request) throws Exception;
	List<Place> placeList(String plaType, String plaRegion, String plaDistrict) throws Exception;
	
	
	List<Place> regionList(String plaType, String plaRegion) throws Exception;
	List<Place> districtList(String plaType, String plaDistrict) throws Exception;
}
