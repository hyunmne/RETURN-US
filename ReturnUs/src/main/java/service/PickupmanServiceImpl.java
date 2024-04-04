package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.PickupmanDAO;
import dao.PickupmanDAOImpl;
import dto.PickupMan;
import util.PageInfo;

public class PickupmanServiceImpl implements PickupmanService {
	
	PickupmanDAO pmDao = new PickupmanDAOImpl();
	
	@Override
	public List<PickupMan> pickupManList(String colNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void joinPickMan(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String pmName = request.getParameter("pmName");
		String pmTel = request.getParameter("pmTel");
		String pmRegion = request.getParameter("pmRegion");
		String pmProfile = "./resources/image/" + request.getParameter("pmProfile");
		
		PickupMan pm = new PickupMan(pmName, pmTel, pmRegion, pmProfile);
		pmDao.insertPickMan(pm);
	}

	@Override
	public void allPMList(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Integer page = 1;
		String pageNo = request.getParameter("page");
		if (pageNo!=null) {
			page = Integer.parseInt(pageNo);
		}
		
		int maxPage = (int) Math.ceil((double)pmDao.selectAllPMCnt()/10);
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage > maxPage) endPage = maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10;
		List<PickupMan> allPmList = pmDao.selectAllPMList(row);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("pmList", allPmList);
	}


}
