package dao;

import org.apache.ibatis.session.SqlSession;

import dto.Collection;
import util.MybatisSqlSessionFactory;

public class CollectionDAOImpl implements CollectionDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public void insertCollect(Collection col) throws Exception {
		sqlSession.insert("mapper.board.insertCollect", col);
		sqlSession.commit();
	}

}
