package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Place;
import util.MybatisSqlSessionFactory;

public class PlaceDAOImpl implements PlaceDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<Place> selectPlaceTypeList(String plaType, String plaRegion, String plaDistrict,Integer row) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("plaType", plaType);
		if(plaRegion!=null) {
			params.put("plaRegion", plaRegion);
		}
		if(plaDistrict!=null) {
			params.put("plaDistrict", plaDistrict);
		}
		params.put("row", row);
		return sqlSession.selectList("mapper.place.selectPlaceTypeList", params);
	}

	@Override
	public Integer selectPlaceCount(String plaType) throws Exception {
		return sqlSession.selectOne("mapper.place.selectPlaceCount", plaType);
	}
	
	@Override
	public List<Place> selectCategoryList(String plaType) throws Exception {
		return sqlSession.selectList("mapper.place.selectCategoryList", plaType);
	}

	@Override
	public List<Place> selectPlaceList(String plaType, String plaRegion, String plaDistrict) throws Exception {
		Map<String, Object> params = new HashMap<>();
	    params.put("plaType", plaType);
	    params.put("plaRegion", plaRegion);
	    params.put("plaDistrict", plaDistrict);
	    return sqlSession.selectList("mapper.place.selectPlaceList", params);
	}

	
	
	
	@Override
	public List<Place> selectRegionList(String plaType, String plaRegion) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("plaType", plaType);
		params.put("plaRegion", plaRegion);
		return sqlSession.selectList("mapper.place.selectRegionList", params);
	}

	@Override
	public List<Place> selectDistrictList(String plaType, String plaDistrict) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("plaType", plaType);
		params.put("plaDistrict", plaDistrict);
		return sqlSession.selectList("mapper.place.selectDistrictList", params);
	}


}
