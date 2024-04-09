package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.PickupMan;
import util.MybatisSqlSessionFactory;

public class PickupmanDAOImpl implements PickupmanDAO {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<PickupMan> selectPickupManList(String colNum) throws Exception {
		return sqlSession.selectList("mapper.pickupman.selectPickupManList", colNum);
	}

	@Override
	public void insertPickMan(PickupMan pm) throws Exception {
		sqlSession.insert("mapper.pickupman.insertPickMan", pm);
		sqlSession.commit();
	}

	@Override
	public List<PickupMan> selectAllPMList(String pmRegion) throws Exception {
		Map<String, Object> map = new HashMap<>();
		if (pmRegion != null) {
			map.put("pmRegion", pmRegion);
		}
//		map.put("row", row);
		return sqlSession.selectList("mapper.pickupman.selectAllPMList", map);
	}

	@Override
	public Integer selectAllPMCnt(String pmRegion) throws Exception {
		Map<String, Object> map = new HashMap<>();
		if (pmRegion != null) {
			map.put("pmRegion", pmRegion);
		}
		return sqlSession.selectOne("mapper.pickupman.selectAllPMCnt", map);
	}

	@Override
	public void updatePickupManStatus(String pmStatus, Integer pmNo) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("pmStatus", pmStatus);
		params.put("pmNo", pmNo);
		sqlSession.update("mapper.pickupman.updatePickupManStatus", params);
		sqlSession.commit();
	}

	@Override
	public Map<String, Object> selectPickupMan(String colNum) throws Exception {
		return sqlSession.selectOne("mapper.pickupman.selectPickupMan", colNum);
	}

}
