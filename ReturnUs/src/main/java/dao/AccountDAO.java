package dao;

import dto.Account;

public interface AccountDAO {
	void insertAccount (Account account) throws Exception;
	Account selectAccount (String accId) throws Exception;
}
