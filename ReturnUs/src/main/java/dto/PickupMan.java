package dto;

public class PickupMan {
	private Integer pmNo;
	private String pmName;
	private String pmTel;
	private String pmStatus;
	private String pmRegion;
	private String pmProfile;
	private Integer colPmNo;
	private String colNum;
	
	
	
	public String getColNum() {
		return colNum;
	}

	public void setColNum(String colNum) {
		this.colNum = colNum;
	}

	public PickupMan() {}
	
	public PickupMan(String pmName, String pmTel, String pmRegion, String pmProfile) {
		super();
		this.pmName = pmName;
		this.pmTel = pmTel;
		this.pmRegion = pmRegion;
		this.pmProfile = pmProfile;
	}
	
	public PickupMan(Integer pmNo, String pmName, String pmTel, String pmStatus, String pmRegion, String pmProfile) {
		super();
		this.pmNo = pmNo;
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
	public Integer getPmNo() {
		return pmNo;
	}
	public void setPmNo(Integer pmNo) {
		this.pmNo = pmNo;
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
	public int getColPmNo() {
		return colPmNo;
	}
	public void setColPmNo(int colPmNo) {
		this.colPmNo = colPmNo;
	}
	
}
