package service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.AccountDAOImpl;
import dto.Account;
import util.NaverMailSendToChangePassword;

public class AccountServiceImpl implements AccountService {
	private AccountDAO accountDao = new AccountDAOImpl();
	 private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // SimpleDateFormat 객체 추가
	
	@Override
	public void join(HttpServletRequest request) throws Exception {
		  request.setCharacterEncoding("utf-8");

	        String accId = request.getParameter("accId");
	        String accEmail = request.getParameter("accEmail");
	        String accEmailDo = request.getParameter("accEmailDo");
	        Account sacc = accountDao.selectAccount(accId);
	        if(sacc != null) throw new Exception("아이디가 중복됩니다");
	        Account eacc = accountDao.checkedDoubleEmail(accEmail, accEmailDo);
	        if(eacc != null) throw new Exception("등록된 이메일입니다.");

	        String accPassword = request.getParameter("accPassword");
	        String accName = request.getParameter("accName");
	        Date accBirth = null;
	        try {
	            String accBirthString = request.getParameter("accBirth");
	            if (accBirthString != null && !accBirthString.isEmpty()) {
	                accBirth = new Date(sdf.parse(accBirthString).getTime()); // SimpleDateFormat 객체 사용하여 날짜 파싱
	            }
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        String accTel = request.getParameter("accTel");;
	        String accPostCode = request.getParameter("accPostCode");
	        String accAddr = request.getParameter("accAddr");
	        String accDetailAddr = request.getParameter("accDetailAddr");
		
		Account account = new Account(accId,accPassword,accName,accBirth,accTel,accEmail,accEmailDo,accPostCode,accAddr,accDetailAddr);
		accountDao.insertAccount(account);
	}

	@Override
	public void login(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("accId");
		String pw = request.getParameter("accPassword");
		Account acc = accountDao.selectAccount(id);
		
		if (acc == null) throw new Exception("아이디 오류");
		if(!acc.getAccPassword().equals(pw)) throw new Exception("비밀번호 오류");
		
		HttpSession session = request.getSession();
		acc.setAccPassword("");
		session.setAttribute("acc", acc);
		
		String adminCheck = accountDao.selectAdmin(id);
		if(adminCheck != null || adminCheck.equals("admin")) {
			session.setAttribute("adminCheck", adminCheck);
		}
		
	}

	@Override
	public boolean accountIdCheck(String accId) throws Exception {
		Account account = accountDao.selectAccount(accId);
		if(account==null) return false;
		return true;
	}

	@Override
	public Account findId(String accName, String accBirth, String accEmail, String accEmailDo) throws Exception {
		
		return accountDao.findIdAccount(accName, accBirth, accEmail, accEmailDo);
	}

	@Override
	public void modifyProfile(HttpServletRequest request) throws Exception {
		String id = request.getParameter("accId");
		String pw = request.getParameter("accPassword");
		String birth = request.getParameter("accBirth");
		Date accBirth = new Date(sdf.parse(birth).getTime());		
				
		Account account = accountDao.selectAccount(id);
		if(!account.getAccPassword().equals(pw)) throw new Exception("비밀번호가 틀립니다");
		
		account.setAccName(request.getParameter("accName"));
		account.setAccBirth(accBirth);
		account.setAccTel(request.getParameter("accTel"));
		account.setAccEmail(request.getParameter("accEmail"));
		account.setAccPostCode(request.getParameter("accPostCode"));
		account.setAccAddr(request.getParameter("accAddr"));
		account.setAccDetailAddr(request.getParameter("accDetailAddr"));
		accountDao.updateAccount(account);
		
		HttpSession sessionOld = request.getSession();
		sessionOld.invalidate();		
				
		HttpSession session = request.getSession();
		account.setAccPassword("");
		session.setAttribute("acc", account);
		
		String adminCheck = accountDao.selectAdmin(id);
		if(adminCheck.equals("admin")) {
			session.setAttribute("adminCheck", adminCheck);
		}		
	}

	@Override
	public void closeAccount(HttpServletRequest request) throws Exception {
		String id = request.getParameter("accId");
		String pw = request.getParameter("accPassword");
		Account account = accountDao.selectAccount(id);
		
		if(!account.getAccPassword().equals(pw)) throw new Exception("비밀번호 오류");		
		
		HttpSession session = request.getSession();
		session.invalidate();
		accountDao.deleteAccount(id);
	}

	@Override
	public void changePassword(HttpServletRequest request) throws Exception {
		String id = request.getParameter("accId");
		String pw = request.getParameter("accPassword");
		String pwConfirmation = request.getParameter("accNewPasswordConfirmation");
				
		Account account = accountDao.selectAccount(id);
		if(!account.getAccPassword().equals(pw)) throw new Exception("비밀번호가 틀립니다");
		if(!request.getParameter("accNewPassword").equals(pwConfirmation)) throw new Exception("비밀번호가 다릅니다");
		
		account.setAccPassword(request.getParameter("accNewPassword"));
		accountDao.updateAccountPassword(account);
		
		HttpSession sessionOld = request.getSession();
		sessionOld.invalidate();
		
	}
	

	@Override
	public void checkPassword(String accId, String email) throws Exception {
		Account sacc = accountDao.selectAccount(accId);
		if(sacc==null) {
			throw new Exception("아이디 오류");
		}else if(!email.equals(sacc.getAccEmail()+"@"+sacc.getAccEmailDo())) {
			throw new Exception("이메일 오류");
		}
		NaverMailSendToChangePassword naverMailSendToChangePassword = new NaverMailSendToChangePassword();
		String authPassword = naverMailSendToChangePassword.sendEmail(email);
		accountDao.updateAccountPassword(new Account(accId,authPassword));
	}
	
}
