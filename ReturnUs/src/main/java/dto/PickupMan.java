package dto;

public class PickupMan {
	private int pmNo;
	private String colNum;
	private String pmName;
	private String pmTel;
	private String pmStatus;
	private String pmRegion;
	private String pmProfile;
	
	public PickupMan(int pmNo, String colNum, String pmName, String pmTel, String pmStatus, String pmRegion, String pmProfile) {
		super();
		this.pmNo = pmNo;
		this.colNum = colNum;
		this.pmName = pmName;
		this.pmTel = pmTel;
		this.pmStatus = pmStatus;
		this.pmRegion = pmRegion;
		this.pmProfile = pmProfile;
	}
	
	
	public String getPmProfile() {
		return pmProfile;
	}
	public void setPmProfile(String pmProfile) {
		this.pmProfile = pmProfile;
	}
	public int getPmNo() {
		return pmNo;
	}
	public void setPmNo(int pmNo) {
		this.pmNo = pmNo;
	}
	public String getColNum() {
		return colNum;
	}
	public void setColNum(String colNum) {
		this.colNum = colNum;
	}
	public String getPmName() {
		return pmName;
	}
	public void setPmName(String pmName) {
		this.pmName = pmName;
	}
	public String getPmTel() {
		return pmTel;
	}
	public void setPmTel(String pmTel) {
		this.pmTel = pmTel;
	}
	public String getPmStatus() {
		return pmStatus;
	}
	public void setPmStatus(String pmStatus) {
		this.pmStatus = pmStatus;
	}
	public String getPmRegion() {
		return pmRegion;
	}
	public void setPmRegion(String pmRegion) {
		this.pmRegion = pmRegion;
	}
	
	
}
