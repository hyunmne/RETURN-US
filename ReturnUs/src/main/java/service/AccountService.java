package service;

import javax.servlet.http.HttpServletRequest;

public interface AccountService {
	void join(HttpServletRequest request) throws Exception;
	void login(HttpServletRequest request) throws Exception;
	boolean accountIdCheck(String id) throws Exception;
	
}
