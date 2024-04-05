package dao;

import java.util.List;

import dto.Faq;

public interface FaqDAO {
	void insertFaq(Faq faq)throws Exception;
	List<Faq> selectFaqList(Integer row) throws Exception;
	Integer selectFaqCount() throws Exception;
	Faq selectFaq(Integer num) throws Exception;
	void updateFaq(Faq faq)throws Exception;
	void deleteFaq(Integer faqNo) throws Exception;
}
