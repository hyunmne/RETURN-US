package service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import dao.CollectionDAO;
import dao.CollectionDAOImpl;
import dao.PickupmanDAO;
import dao.PickupmanDAOImpl;
import dto.PickupMan;
import util.PageInfo;

public class PickupmanServiceImpl implements PickupmanService {
	
	PickupmanDAO pmDao = new PickupmanDAOImpl();
	CollectionDAO colDao = new CollectionDAOImpl();
	
	@Override
	public void pickupManList(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String colNum = request.getParameter("colNum");
		List<PickupMan> pmList = pmDao.selectPickupManList(colNum);
		
		request.setAttribute("pmList", pmList);
	}

	@Override
	public void joinPickMan(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String pmName = request.getParameter("pmName");
		String pmTel = request.getParameter("pmTel");
		String pmRegion = request.getParameter("pmRegion");
		String pmProfile = "./resources/img/" + request.getParameter("pmProfile");
		
		PickupMan pm = new PickupMan(pmName, pmTel, pmRegion, pmProfile);
		pmDao.insertPickMan(pm);
	}

//	@Override
//	public List<PickupMan> allPMList(HttpServletRequest request) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		String pmRegion = request.getParameter("pmRegion");
//		System.out.println("serviceImpl pmRegion : " + pmRegion);
//		
//		Integer page = 1;
//		String pageNo = request.getParameter("page");
//		if (pageNo!=null) {
//			page = Integer.parseInt(pageNo);
//		}
//		
//		int maxPage = (int) Math.ceil((double)pmDao.selectAllPMCnt(pmRegion)/10);
//		int startPage = (page-1)/10*10+1;
//		int endPage = startPage+10-1;
//		if(endPage > maxPage) endPage = maxPage;
//		
//		PageInfo pageInfo = new PageInfo();
//		pageInfo.setAllPage(maxPage);
//		pageInfo.setCurPage(page);
//		pageInfo.setStartPage(startPage);
//		pageInfo.setEndPage(endPage);
//		
//		int row = (page-1)*10;
//		
//		List<PickupMan> pmList = pmDao.selectAllPMList(row, pmRegion);
//		
//		int count = pmDao.selectAllPMCnt(pmRegion);
//		System.out.println(count);
//		
//		request.setAttribute("count",  count);
//		request.setAttribute("pageInfo", pageInfo);
//		request.setAttribute("pmList", pmList);
//		request.setAttribute("region", pmRegion);
//		
//		
//		return pmList;
//	}

	@Override
	public void allocationPickupMan(String colNum, Integer pmNo, String pmStatus) throws Exception {
		pmDao.updatePickupManStatus(pmStatus, pmNo);
		colDao.updateColPmNo(pmNo, colNum);
	}

	@Override
	public void pickupManInfo(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String colNum = request.getParameter("colNum");
		 Map<String, Object> pmInfo = pmDao.selectPickupMan(colNum);
		 
		request.setAttribute("pmInfo", pmInfo);
	}

	@Override
	public void allPMList(HttpServletRequest request) throws Exception {
//		Integer page = 1;
//		String pageNo = request.getParameter("page");
		String pmRegion = request.getParameter("pmRegion");
//		System.out.println("pmRegion" + pmRegion);
//		
//		if (pageNo != null) {
//			page = Integer.parseInt(pageNo);
//		}
//		
//		int maxPage = (int)Math.ceil((double) pmDao.selectAllPMCnt(pmRegion)/10);
//		int startPage = (page-1)/10*10+1;
//		int endPage = startPage+10-1;
//		if(endPage > maxPage) {
//			endPage = maxPage;
//		}
//		
//		PageInfo pageInfo = new PageInfo();
//		pageInfo.setAllPage(maxPage);
//		pageInfo.setCurPage(page);
//		pageInfo.setStartPage(startPage);
//		pageInfo.setEndPage(endPage);
		
//		int row = (page-1)*10;
		List<PickupMan> pmList = pmDao.selectAllPMList(pmRegion);
		
		int count = pmDao.selectAllPMCnt(pmRegion);
		System.out.println("count"+count);
//		request.setAttribute("pageList", pageInfo);
		request.setAttribute("pmList", pmList);
		request.setAttribute("count", count);
		
	}


}
