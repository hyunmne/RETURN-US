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
	public Account findIdAccount(String accName) throws Exception {		
		return sqlSession.selectOne("mapper.account.findIdAccount", accName);	
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
	
	public void updateAccountPassword(Account account) throws Exception {
		sqlSession.update("mapper.account.updateAccountPassword", account);
		sqlSession.commit();
	}
	@Override
	public Account checkedDoubleEmail(String accEmail, String accEmailDo) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("accEmail", accEmail);
		param.put("accEmailDo", accEmailDo);
		return sqlSession.selectOne("mapper.account.findEmAccount", param);
		
	}
	@Override
	public void updatePoint(Integer pnt, String id) throws Exception {
		Map<String,Object> params = new HashMap<>();
		params.put("accPnt", pnt);
		params.put("accId", id);
		sqlSession.update("mapper.account.updatePoint", params);
		sqlSession.commit();
	}
	
	@Override
	public void updateBasicDel(Account acc) throws Exception {
		sqlSession.update("mapper.account.updateBasicDel", acc);
		sqlSession.commit();
	}
}
