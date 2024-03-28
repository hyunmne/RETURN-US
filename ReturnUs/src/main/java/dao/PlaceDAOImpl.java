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
	public List<Place> selectPlaceList(String plaType, String plaRegion, String plaDistrict,Integer row) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("plaType", plaType);
		if(plaRegion != null) {
			params.put("plaRegion", plaRegion);
		}
		if(plaDistrict != null) {
			params.put("plaDistrict", plaDistrict);
		}
		params.put("row", row);
		return sqlSession.selectList("mapper.place.selectPlaceList", params);
	}

	@Override
	public Integer selectPlaceCount(String plaType, String plaRegion, String plaDistrict) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("plaType", plaType);
		if(plaRegion != null) {
			params.put("plaRegion", plaRegion);
		}
		if(plaDistrict != null) {
			params.put("plaDistrict", plaDistrict);
		}
		return sqlSession.selectOne("mapper.place.selectPlaceCount", params);
	}
	
	@Override
	public List<Place> selectCategoryList(String plaType) throws Exception {
		return sqlSession.selectList("mapper.place.selectCategoryList", plaType);
	}

}
