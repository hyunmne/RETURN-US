package service;

import javax.servlet.http.HttpServletRequest;

import dto.Faq;

public interface FaqService {
	void wrtieFaq(HttpServletRequest request)throws Exception;
	void faqListByPage(HttpServletRequest request) throws Exception;
	Faq faqSelect(HttpServletRequest request)throws Exception;
	void faqModify(HttpServletRequest request)throws Exception;
	void deleteFaq(HttpServletRequest request)throws Exception;
}
