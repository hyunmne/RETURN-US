package dao;

import org.apache.ibatis.session.SqlSession;

import dto.Account;
import util.MybatisSqlSessionFactory;

public class AccountDAOImpl implements AccountDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public void insertAccount(Account account) throws Exception {
		sqlSession.insert("mapper.account.insertAccount", account);
		sqlSession.commit();

	}
	@Override
	public Account selectAccount(String accId) throws Exception {
		return sqlSession.selectOne("mapper.account.selectAccount", accId);	
	}
	

}
