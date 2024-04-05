package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Faq;
import util.MybatisSqlSessionFactory;

public class FaqDAOImpl implements FaqDAO{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public void insertFaq(Faq faq) throws Exception {
		sqlSession.insert("mapper.faq.insertFaq",faq);
		sqlSession.commit();
	}
	@Override
	public List<Faq> selectFaqList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.faq.selectFaqList", row);
	}
	@Override
	public Integer selectFaqCount() throws Exception {
		return sqlSession.selectOne("mapper.faq.selectFaqCount");
	}
	@Override
	public Faq selectFaq(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.faq.selectFaq", num);
	}
	@Override
	public void updateFaq(Faq faq) throws Exception {
		sqlSession.update("mapper.faq.updateFaq", faq);
		sqlSession.commit();
	}
	@Override
	public void deleteFaq(Integer faqNo) throws Exception {
		sqlSession.delete("mapper.faq.deleteFaq", faqNo);
		sqlSession.commit();
	}
	
}
