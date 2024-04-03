package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Collection;
import util.MybatisSqlSessionFactory;

public class CollectionDAOImpl implements CollectionDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public void insertCollect(Collection col) throws Exception {
		sqlSession.insert("mapper.collection.insertCollect", col);
		sqlSession.commit();
	}

	@Override
	public List<Map<String, Object>> selectCollectionList(String colStatus, Integer row) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("colStatus", colStatus);
		params.put("row", row);
		return sqlSession.selectList("mapper.collection.selectCollectionList", params);
	}

	@Override
	public Integer selectCollectionCount(String colStatus) throws Exception {
		return sqlSession.selectOne("mapper.collection.selectCollectionCount", colStatus);
	}

	@Override
	public Map<String, Object> selectCollectionDetail(String colNum) throws Exception {
		return sqlSession.selectOne("mapper.collection.selectCollectionDetail", colNum);
	}

	@Override
	public void updateColStatus(String colNum, String colStatus) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("colNum", colNum);
		params.put("colStatus", colStatus);
		sqlSession.update("mapper.collection.updateColStatus", params);
		sqlSession.commit();
	}

	@Override
	public void updateCollectionFin(Collection collection) throws Exception {
		sqlSession.update("mapper.collection.updateCollectionFin", collection);
		sqlSession.commit();
	}

}
