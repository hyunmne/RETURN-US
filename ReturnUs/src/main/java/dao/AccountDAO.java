package dao;

import dto.Account;

public interface AccountDAO {
	void insertAccount (Account account) throws Exception;
	Account selectAccount (String accId) throws Exception;
	public Account findIdAccount(String accName) throws Exception;
	String selectAdmin(String accId) throws Exception;
	void updateAccount(Account account) throws Exception;
	void deleteAccount(String accId) throws Exception;
	void updateAccountPassword(Account account) throws Exception;
	Account checkedDoubleEmail(String accEmail, String accEmailDo) throws Exception;
	
	void updatePoint(Integer pnt, String id) throws Exception;
	void updateBasicDel(Account acc) throws Exception;
}
