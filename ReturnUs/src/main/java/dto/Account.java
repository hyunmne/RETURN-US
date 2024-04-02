package dto;

import java.sql.Date;

public class Account {
	private String accId;
	private String accPassword;
	private String accName;
	private Date accBirth;
	private String accTel;
	private String accEmail;
	private String accEmailDo;
	private String accAdmin;
	private String accPostCode;
	private String accAddr;
	private String accDetailAddr;
	private Integer accPnt;
	private Date accJoinDt;
	private Integer accJoinDays;
	
	
	public Date getAccJoinDt() {
		return accJoinDt;
	}

	public void setAccJoinDt(Date accJoinDt) {
		this.accJoinDt = accJoinDt;
	}

	public Integer getAccJoinDays() {
		return accJoinDays;
	}

	public void setAccJoinDays(Integer accJoinDays) {
		this.accJoinDays = accJoinDays;
	}

	public Account() {}
	
	
	
	public Account(String accId, String accPassword) {
		super();
		this.accId = accId;
		this.accPassword = accPassword;
	}

	public Account(String accId, String accPassword, String accName, Date accBirth, String accTel, String accEmail,
			String accEmailDo, String accPostCode, String accAddr, String accDetailAddr) {
		super();
		this.accId = accId;
		this.accPassword = accPassword;
		this.accName = accName;
		this.accBirth = accBirth;
		this.accTel = accTel;
		this.accEmail = accEmail;
		this.accEmailDo = accEmailDo;
		this.accPostCode = accPostCode;
		this.accAddr = accAddr;
		this.accDetailAddr = accDetailAddr;
	}



	public String getAccId() {
		return accId;
	}
	public void setAccId(String accId) {
		this.accId = accId;
	}
	public String getAccPassword() {
		return accPassword;
	}
	public void setAccPassword(String accPassword) {
		this.accPassword = accPassword;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public Date getAccBirth() {
		return accBirth;
	}
	public void setAccBirth(Date accBirth) {
		this.accBirth = accBirth;
	}
	public String getAccTel() {
		return accTel;
	}
	public void setAccTel(String accTel) {
		this.accTel = accTel;
	}
	public String getAccEmail() {
		return accEmail;
	}
	public void setAccEmail(String accEmail) {
		this.accEmail = accEmail;
	}
	public String getAccEmailDo() {
		return accEmailDo;
	}

	public void setAccEmailDo(String accEmailDo) {
		this.accEmailDo = accEmailDo;
	}

	public String getAccAdmin() {
		return accAdmin;
	}
	public void setAccAdmin(String accAdmin) {
		this.accAdmin = accAdmin;
	}
	public String getAccPostCode() {
		return accPostCode;
	}
	public void setAccPostCode(String accPostCode) {
		this.accPostCode = accPostCode;
	}
	public String getAccAddr() {
		return accAddr;
	}
	public void setAccAddr(String accAddr) {
		this.accAddr = accAddr;
	}
	public String getAccDetailAddr() {
		return accDetailAddr;
	}
	public void setAccDetailAddr(String accDetailAddr) {
		this.accDetailAddr = accDetailAddr;
	}
	public Integer getAccPnt() {
		return accPnt;
	}
	public void setAccPnt(Integer accPnt) {
		this.accPnt = accPnt;
	}
	public Date getAccSubDate() {
		return accJoinDt;
	}
	public void setAccSubDate(Date accJoinDt) {
		this.accJoinDt = accJoinDt;
	}
	

}
