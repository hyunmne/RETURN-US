package service;

import javax.servlet.http.HttpServletRequest;

public interface AccountService {
	void join(HttpServletRequest request) throws Exception;
}
