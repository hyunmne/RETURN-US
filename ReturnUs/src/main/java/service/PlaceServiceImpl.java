package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.PlaceDAO;
import dao.PlaceDAOImpl;
import dto.Place;
import util.PageInfo;

public class PlaceServiceImpl implements PlaceService {
	private PlaceDAO placeDao = new PlaceDAOImpl();

	@Override
	public void placeTypeList(HttpServletRequest request) throws Exception {
		Integer page = 1;
		String pageNo = request.getParameter("page");
		String plaType = request.getParameter("plaType");
		String plaRegion = request.getParameter("plaRegion");
		String plaDistrict = request.getParameter("plaDistrict");
		
		if(pageNo != null) {
			page = Integer.parseInt(pageNo);
		}
		
		int maxPage = (int)Math.ceil((double)placeDao.selectPlaceCount(plaType)/10);
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10;
		List<Place> plaTypeList = placeDao.selectPlaceTypeList(plaType, plaRegion, plaDistrict, row);
		List<Place> categoryList = placeDao.selectCategoryList(plaType);
		
		//지역 카테고리(중복X)
		Set<String> regionCategory = new HashSet<>();
		//구 카테고리(중복X)
		Map<String, List<String>> districtCategory = new HashMap<>();
		
		for(Place place : categoryList) {
			String region = place.getPlaRegion();
			String district = place.getPlaDistrict();
			
			if (!regionCategory.contains(region)) {
		        regionCategory.add(region);
		        List<String> districts = new ArrayList<>();
		        districts.add(district);
		        districtCategory.put(region, districts);
		    } else {
		        if (districtCategory.containsKey(region)) {
		            List<String> districts = districtCategory.get(region);
		            if (!districts.contains(district)) {
		                districts.add(district);
		            }
		        }
		    }
		}
		
		request.setAttribute("pageList", pageInfo);
		request.setAttribute("plaType", plaType);
		request.setAttribute("plaTypeList", plaTypeList);
		request.setAttribute("regionCategory", regionCategory);
		request.setAttribute("districtCategory", districtCategory);
		request.setAttribute("plaRegion", plaRegion==null? "0":plaRegion);
		request.setAttribute("plaDistrict", plaDistrict==null? "0":plaDistrict);
	}

	@Override
	public List<Place> placeList(String plaType, String plaRegion, String plaDistrict) throws Exception {
		return placeDao.selectPlaceList(plaType, plaRegion, plaDistrict);
	}

	
	
	
	@Override
	public List<Place> regionList(String plaType, String plaRegion) throws Exception {
		return placeDao.selectRegionList(plaType, plaRegion);
	}
	
	@Override
	public List<Place> districtList(String plaType, String plaDistrict) throws Exception {
		return placeDao.selectDistrictList(plaDistrict, plaType);
	}

}
