package dto;

public class Delivery {
	private Integer delNo;
	private String delName;
	private String delTel;
	private String delType;
	private String delPostCode;
	private String delAddr;
	private String delDetailAddr;
	
	public Delivery() {}
	public Delivery(Integer delNo, String delName, String delTel, String delType, String delPostCode, String delAddr,
			String delDetailAddr) {
		super();
		this.delNo = delNo;
		this.delName = delName;
		this.delTel = delTel;
		this.delType = delType;
		this.delPostCode = delPostCode;
		this.delAddr = delAddr;
		this.delDetailAddr = delDetailAddr;
	}
	public Integer getDelNo() {
		return delNo;
	}
	public void setDelNo(Integer delNo) {
		this.delNo = delNo;
	}
	public String getDelName() {
		return delName;
	}
	public void setDelName(String delName) {
		this.delName = delName;
	}
	public String getDelTel() {
		return delTel;
	}
	public void setDelTel(String delTel) {
		this.delTel = delTel;
	}
	public String getDelType() {
		return delType;
	}
	public void setDelType(String delType) {
		this.delType = delType;
	}
	public String getDelPostCode() {
		return delPostCode;
	}
	public void setDelPostCode(String delPostCode) {
		this.delPostCode = delPostCode;
	}
	public String getDelAddr() {
		return delAddr;
	}
	public void setDelAddr(String delAddr) {
		this.delAddr = delAddr;
	}
	public String getDelDetailAddr() {
		return delDetailAddr;
	}
	public void setDelDetailAddr(String delDetailAddr) {
		this.delDetailAddr = delDetailAddr;
	}
	
	
}
