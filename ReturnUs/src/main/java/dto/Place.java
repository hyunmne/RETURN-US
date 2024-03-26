package dto;

public class Place {
	private Integer plaNo;
	private String plaName;
	private String plaAddr;
	private String plaType;
	private double plaLat;
	private double plaLong;
	private String plaRegion;
	private String plaDistrict;
	
	public Place() {}
	
	public Place(Integer plaNo, String plaName, String plaAddr, String plaType, double plaLat, double plaLong,
			String plaRegion, String plaDistrict) {
		super();
		this.plaNo = plaNo;
		this.plaName = plaName;
		this.plaAddr = plaAddr;
		this.plaType = plaType;
		this.plaLat = plaLat;
		this.plaLong = plaLong;
		this.plaRegion = plaRegion;
		this.plaDistrict = plaDistrict;
	}

	public Integer getPlaNo() {
		return plaNo;
	}

	public void setPlaNo(Integer plaNo) {
		this.plaNo = plaNo;
	}

	public String getPlaName() {
		return plaName;
	}

	public void setPlaName(String plaName) {
		this.plaName = plaName;
	}

	public String getPlaAddr() {
		return plaAddr;
	}

	public void setPlaAddr(String plaAddr) {
		this.plaAddr = plaAddr;
	}

	public String getPlaType() {
		return plaType;
	}

	public void setPlaType(String plaType) {
		this.plaType = plaType;
	}

	public double getPlaLat() {
		return plaLat;
	}

	public void setPlaLat(double plaLat) {
		this.plaLat = plaLat;
	}

	public double getPlaLong() {
		return plaLong;
	}

	public void setPlaLong(double plaLong) {
		this.plaLong = plaLong;
	}

	public String getPlaRegion() {
		return plaRegion;
	}

	public void setPlaRegion(String plaRegion) {
		this.plaRegion = plaRegion;
	}

	public String getPlaDistrict() {
		return plaDistrict;
	}

	public void setPlaDistrict(String plaDistrict) {
		this.plaDistrict = plaDistrict;
	}
	
		
}
