package service;

import javax.servlet.http.HttpServletRequest;

import dto.Account;

public interface AccountService {
	void join(HttpServletRequest request) throws Exception;
	void login(HttpServletRequest request) throws Exception;
	boolean accountIdCheck(String id) throws Exception;
	Account findId(String accName, String accBirth, String accEmail, String accEmailDo) throws Exception;
	void modifyProfile(HttpServletRequest request) throws Exception;
}
