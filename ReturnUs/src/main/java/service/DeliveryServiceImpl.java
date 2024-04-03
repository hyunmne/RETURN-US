package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.AccountDAOImpl;
import dao.DeliveryDAO;
import dao.DeliveryDAOImpl;
import dto.Account;
import dto.Delivery;

public class DeliveryServiceImpl implements DeliveryService {
	
	private DeliveryDAO delDao = new DeliveryDAOImpl();

	@Override
	public List<Delivery> deliveryList(HttpServletRequest request) throws Exception {
		 String id = request.getParameter("accId");
		    List<Delivery> delList = delDao.selectDelList(id);
		    return delList;
	}

	@Override
	public void insertDelivery(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("acc");
		AccountDAO accDao = new AccountDAOImpl();
		
		String addrNm = request.getParameter("addrNm");
		String accTel = request.getParameter("accTel");
		String accPc = request.getParameter("accPostCode");
		String accAddr = request.getParameter("accAddr");
		String accDadr = request.getParameter("accDetailAddr");
		String isChecked = request.getParameter("radio");
		String delType;
		
		if (isChecked.equals("basic")) {
			delType = "baisc";
			Account delAcc = new Account(acc.getAccId(), accTel, accPc, accAddr, accDadr);
			accDao.updateBasicDel(delAcc);
			System.out.println("account 테이블 배송지 변경");
		} else {
			delType= "none";
		}
		
		System.out.println(acc.getAccId());
		Delivery del = new Delivery (acc.getAccId(), addrNm, accTel, delType, accPc, accAddr, accDadr);
		del.setAccId(acc.getAccId());
		delDao.insertDelivery(del);
	}

}
