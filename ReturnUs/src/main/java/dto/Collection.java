package dto;

import java.sql.Date;

public class Collection {
	private String colNum;
	private String accId;
	private Date colDate;
	private String colAddr;
	private String colStatus;
	private int colPost;
	private int colUsePnt;
	private int colPrice;
	private String colResult;
	private Date colGetpntDt;
	private int colPaper;
	private int colPtBody;
	private int colPtLid;
	private int colBt190;
	private int colBt400;
	private int colBt1000;
	private int colBt1000Up;
	private int colPpack;
	private int colPlastic;
	private int colCan;
	private int colTotalPnt;
	private String colRejection;
	
	public Collection() {}
	
	public Collection(String colNum, String accId, Date colDate, String colAddr, String colStatus, int colPost, int colUsePnt,
			int colPrice, String colResult, Date colGetpntDt, int colPaper, int colPtBody, int colPtLid, int colBt190,
			int colBt400, int colBt1000, int colBt1000Up, int colPpack, int colPlastic, int colCan, int colTotalPnt, String colRejection) {
		super();
		this.colNum = colNum;
		this.accId = accId;
		this.colDate = colDate;
		this.colAddr = colAddr;
		this.colStatus = colStatus;
		this.colPost = colPost;
		this.colUsePnt = colUsePnt;
		this.colPrice = colPrice;
		this.colResult = colResult;
		this.colGetpntDt = colGetpntDt;
		this.colPaper = colPaper;
		this.colPtBody = colPtBody;
		this.colPtLid = colPtLid;
		this.colBt190 = colBt190;
		this.colBt400 = colBt400;
		this.colBt1000 = colBt1000;
		this.colBt1000Up = colBt1000Up;
		this.colPpack = colPpack;
		this.colPlastic = colPlastic;
		this.colCan = colCan;
		this.colTotalPnt = colTotalPnt;
		this.colRejection = colRejection;
	}
	
	public Collection(String colNum, String colResult, int colPaper, int colPtBody, int colPtLid, int colBt190, int colBt400,
			int colBt1000, int colBt1000Up, int colPpack, int colPlastic, int colCan, int colTotalPnt,
			String colRejection, String colStatus) {
		super();
		this.colNum = colNum;
		this.colResult = colResult;
		this.colPaper = colPaper;
		this.colPtBody = colPtBody;
		this.colPtLid = colPtLid;
		this.colBt190 = colBt190;
		this.colBt400 = colBt400;
		this.colBt1000 = colBt1000;
		this.colBt1000Up = colBt1000Up;
		this.colPpack = colPpack;
		this.colPlastic = colPlastic;
		this.colCan = colCan;
		this.colTotalPnt = colTotalPnt;
		this.colRejection = colRejection;
		this.colStatus = colStatus;
	}

	public String getColAddr() {
		return colAddr;
	}
	public void setColAddr(String colAddr) {
		this.colAddr = colAddr;
	}
	public String getColNum() {
		return colNum;
	}
	public void setColNum(String colNum) {
		this.colNum = colNum;
	}
	public String getAccId() {
		return accId;
	}
	public void setAccId(String accId) {
		this.accId = accId;
	}
	public Date getColDate() {
		return colDate;
	}
	public void setColDate(Date colDate) {
		this.colDate = colDate;
	}
	public String getColStatus() {
		return colStatus;
	}
	public void setColStatus(String colStatus) {
		this.colStatus = colStatus;
	}
	public int getColPost() {
		return colPost;
	}
	public void setColPost(int colPost) {
		this.colPost = colPost;
	}
	public int getColUsePnt() {
		return colUsePnt;
	}
	public void setColUsePnt(int colUsePnt) {
		this.colUsePnt = colUsePnt;
	}
	public int getColPrice() {
		return colPrice;
	}
	public void setColPrice(int colPrice) {
		this.colPrice = colPrice;
	}
	public String getColResult() {
		return colResult;
	}
	public void setColResult(String colResult) {
		this.colResult = colResult;
	}
	public Date getColGetpntDt() {
		return colGetpntDt;
	}
	public void setColGetpntDt(Date colGetpntDt) {
		this.colGetpntDt = colGetpntDt;
	}
	public int getColPaper() {
		return colPaper;
	}
	public void setColPaper(int colPaper) {
		this.colPaper = colPaper;
	}
	public int getColPtBody() {
		return colPtBody;
	}
	public void setColPtBody(int colPtBody) {
		this.colPtBody = colPtBody;
	}
	public int getColPtLid() {
		return colPtLid;
	}
	public void setColPtLid(int colPtLid) {
		this.colPtLid = colPtLid;
	}
	public int getColBt190() {
		return colBt190;
	}
	public void setColBt190(int colBt190) {
		this.colBt190 = colBt190;
	}
	public int getColBt400() {
		return colBt400;
	}
	public void setColBt400(int colBt400) {
		this.colBt400 = colBt400;
	}
	public int getColBt1000() {
		return colBt1000;
	}
	public void setColBt1000(int colBt1000) {
		this.colBt1000 = colBt1000;
	}
	public int getColBt1000Up() {
		return colBt1000Up;
	}
	public void setColBt1000Up(int colBt1000Up) {
		this.colBt1000Up = colBt1000Up;
	}
	public int getColPpack() {
		return colPpack;
	}
	public void setColPpack(int colPpack) {
		this.colPpack = colPpack;
	}
	public int getColPlastic() {
		return colPlastic;
	}
	public void setColPlastic(int colPlastic) {
		this.colPlastic = colPlastic;
	}
	public int getColCan() {
		return colCan;
	}
	public void setColCan(int colCan) {
		this.colCan = colCan;
	}
	public int getColTotalPnt() {
		return colTotalPnt;
	}
	public void setColTotalPnt(int colTotalPnt) {
		this.colTotalPnt = colTotalPnt;
	}
	public String getColRejection() {
		return colRejection;
	}
	public void setColRejection(String colRejection) {
		this.colRejection = colRejection;
	}
	
	
	
	
	
}
