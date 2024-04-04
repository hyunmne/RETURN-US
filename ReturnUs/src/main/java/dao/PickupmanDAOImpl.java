package dao;

import java.util.List;

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
	public List<PickupMan> selectAllPMList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.pickupman.selectAllPMList", row);
	}

	@Override
	public Integer selectAllPMCnt() throws Exception {
		return sqlSession.selectOne("mapper.pickupman.selectAllPMCnt");
	}

}
