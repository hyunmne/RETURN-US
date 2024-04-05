package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Account;

public interface AccountService {
	void join(HttpServletRequest request) throws Exception;
	void login(HttpServletRequest request,HttpServletResponse response) throws Exception;
	boolean accountIdCheck(String id) throws Exception;
	Account findId(String accName, String accBirth, String accEmail, String accEmailDo) throws Exception;
	void modifyProfile(HttpServletRequest request) throws Exception;
	void closeAccount(HttpServletRequest request) throws Exception;
	void changePassword(HttpServletRequest request) throws Exception;
	void checkPassword(String accId, String email) throws Exception;
	
}
