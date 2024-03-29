package dao;

import java.util.List;

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

	@Override
	public List<Collection> selectCollectionList(String colStatus) throws Exception {
		return sqlSession.selectList("mapper.collection.selectCollectionList", colStatus);
	}

}
