package service;

import javax.servlet.http.HttpServletRequest;

import dto.Account;

public interface AccountService {
	void join(HttpServletRequest request) throws Exception;
	void login(HttpServletRequest request) throws Exception;
	boolean accountIdCheck(String id) throws Exception;
	Account findId(String accName, String accBirthSt, String accTel) throws Exception;
	
}
