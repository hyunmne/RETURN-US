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

}
