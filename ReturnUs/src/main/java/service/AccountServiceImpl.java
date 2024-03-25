package service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import dao.AccountDAO;
import dao.AccountDAOImpl;
import dto.Account;

public class AccountServiceImpl implements AccountService {
	private AccountDAO accountDao = new AccountDAOImpl();
	
	@Override
	public void join(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String accId = request.getParameter("accId");
		Account sacc = accountDao.selectAccount(accId);
		if(sacc!=null) throw new Exception("아이디가 중복됩니다");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //데이터 형식으로 가져오기 위해 설정
		
		String accPassword = request.getParameter("accPassword");
		String accName = request.getParameter("accName");
		Date accBirth = null;
		try {
		    accBirth = (Date) sdf.parse(request.getParameter("accBirth"));
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		String accTel = request.getParameter("accTel");
		String accEmail = request.getParameter("accEmail");
		String accPostCode = request.getParameter("accPostCode");
		String accAddr = request.getParameter("accAddr");
		String accDetailAddr = request.getParameter("accDteailAddr");
		
		Account account = new Account(accId,accPassword,accName,accBirth,accTel,accEmail,accPostCode,accAddr,accDetailAddr);
	}

}
