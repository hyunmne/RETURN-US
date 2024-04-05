package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.FaqDAO;
import dao.FaqDAOImpl;
import dto.Faq;
import util.PageInfo;

public class FaqServiceImpl implements FaqService {
	FaqDAO faqDAO = new FaqDAOImpl();
	@Override
	public void wrtieFaq(HttpServletRequest request) throws Exception {
		String faqTitle = request.getParameter("faqTitle");
		String faqContent = request.getParameter("faqContent");
		
		Faq faq = new Faq(faqTitle,faqContent);
		faqDAO.insertFaq(faq);
	}
	
	public void faqListByPage(HttpServletRequest request) throws Exception{
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if(paramPage!=null) {
			page = Integer.parseInt(paramPage);
		}
		
		int faqCount = faqDAO.selectFaqCount();
		int maxPage = (int)Math.ceil((double)faqCount/10);
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurPage(page);
		pageInfo.setAllPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		
		int row = (page-1)*10;
		List<Faq> faqList = faqDAO.selectFaqList(row);
		
		request.setAttribute("faqList", faqList);
		request.setAttribute("pageInfo", pageInfo);
	}
	
	@Override
	public Faq faqSelect(HttpServletRequest request) throws Exception {
		Integer faqNo = Integer.parseInt(request.getParameter("faqNo"));
		
		return faqDAO.selectFaq(faqNo);
		
	}
	
	@Override
	public void faqModify(HttpServletRequest request) throws Exception {
		Faq faq = new Faq();
		
		String faqTitle = request.getParameter("faqTitle");
		String faqContent = request.getParameter("faqContent");
		Integer faqNo = Integer.parseInt(request.getParameter("faqNo"));
		System.out.println(faqNo);
		
		faq.setFaqNo(faqNo);
		faq.setFaqTitle(faqTitle);
		faq.setFaqContent(faqContent);
		
		faqDAO.updateFaq(faq);
	}

	@Override
	public void deleteFaq(HttpServletRequest request) throws Exception {
		Integer faqNo = Integer.parseInt(request.getParameter("faqNo"));		
		System.out.println("service:"+faqNo);
		faqDAO.deleteFaq(faqNo);
	}


	
	
}
