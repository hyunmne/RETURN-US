package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Collection;
import dto.Delivery;
import util.MybatisSqlSessionFactory;

public class DeliveryDAOImpl implements DeliveryDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<Delivery> selectDelList(String id) throws Exception {
		return sqlSession.selectList("mapper.delivery.selectDelList", id);
	}

}
