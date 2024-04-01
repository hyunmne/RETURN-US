package dao;
import java.util.HashMap;
import java.util.Map;

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
	@Override
	public Account findIdAccount(String accName, String accBirth, String accEmail, String accEmailDo) throws Exception {		
		Map<String,Object> param = new HashMap<>();
		param.put("accName", accName);
		param.put("accBirth", accBirth);
		param.put("accEmail", accEmail);
		param.put("accEmailDo", accEmailDo);
		return sqlSession.selectOne("mapper.account.findIdAccount", param);	
	}
	
	@Override
	public String selectAdmin(String accId) throws Exception {
		return sqlSession.selectOne("mapper.account.selectAdmin", accId);
	}
	
	public void updateAccount(Account account) throws Exception {
		sqlSession.update("mapper.account.updateAccount", account);
		sqlSession.commit();
	}
	
	@Override
	public void deleteAccount(String accId) throws Exception {
		sqlSession.delete("mapper.account.deleteAccount", accId);
		sqlSession.commit();
	}
}
