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
	private int colPaperFin;
	private int colPtBodyFin;
	private int colPtLidFin;
	private int colBt190Fin;
	private int colBt400Fin;
	private int colBt1000Fin;
	private int colBt1000UpFin;
	private int colPpackFin;
	private int colPlasticFin;
	private int colCanFin;
	
	public Collection() {}
	
	public Collection(String accId, String colAddr, int colPost, int colUsePnt, int colPrice, 
					  int colPaper, int colPtBody, int colPtLid, int colBt190, int colBt400, int colBt1000, int colBt1000Up, 
					  int colPpack, int colPlastic, int colCan, int colTotalPnt) {
		super();
		this.accId = accId;
		this.colAddr = colAddr;
		this.colPost = colPost;
		this.colUsePnt = colUsePnt;
		this.colPrice = colPrice;
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
	}
	
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

	public Collection(String colNum, String colStatus, int colPaperFin, int colPtBodyFin, int colPtLidFin, int colBt190Fin,
			int colBt400Fin, int colBt1000Fin, int colBt1000UpFin, int colPpackFin, int colPlasticFin, int colCanFin,
			String colRejection, int colTotalPnt, String colResult) {
		super();
		this.colNum = colNum;
		this.colStatus = colStatus;
		this.colPaperFin = colPaperFin;
		this.colPtBodyFin = colPtBodyFin;
		this.colPtLidFin = colPtLidFin;
		this.colBt190Fin = colBt190Fin;
		this.colBt400Fin = colBt400Fin;
		this.colBt1000Fin = colBt1000Fin;
		this.colBt1000UpFin = colBt1000UpFin;
		this.colPpackFin = colPpackFin;
		this.colPlasticFin = colPlasticFin;
		this.colCanFin = colCanFin;
		this.colRejection = colRejection;
		this.colTotalPnt = colTotalPnt;
		this.colResult = colResult;
	}

	public int getColPaperFin() {
		return colPaperFin;
	}

	public void setColPaperFin(int colPaperFin) {
		this.colPaperFin = colPaperFin;
	}

	public int getColPtBodyFin() {
		return colPtBodyFin;
	}

	public void setColPtBodyFin(int colPtBodyFin) {
		this.colPtBodyFin = colPtBodyFin;
	}

	public int getColPtLidFin() {
		return colPtLidFin;
	}

	public void setColPtLidFin(int colPtLidFin) {
		this.colPtLidFin = colPtLidFin;
	}

	public int getColBt190Fin() {
		return colBt190Fin;
	}

	public void setColBt190Fin(int colBt190Fin) {
		this.colBt190Fin = colBt190Fin;
	}

	public int getColBt400Fin() {
		return colBt400Fin;
	}

	public void setColBt400Fin(int colBt400Fin) {
		this.colBt400Fin = colBt400Fin;
	}

	public int getColBt1000Fin() {
		return colBt1000Fin;
	}

	public void setColBt1000Fin(int colBt1000Fin) {
		this.colBt1000Fin = colBt1000Fin;
	}

	public int getColBt1000UpFin() {
		return colBt1000UpFin;
	}

	public void setColBt1000UpFin(int colBt1000UpFin) {
		this.colBt1000UpFin = colBt1000UpFin;
	}

	public int getColPpackFin() {
		return colPpackFin;
	}

	public void setColPpackFin(int colPpackFin) {
		this.colPpackFin = colPpackFin;
	}

	public int getColPlasticFin() {
		return colPlasticFin;
	}

	public void setColPlasticFin(int colPlasticFin) {
		this.colPlasticFin = colPlasticFin;
	}

	public int getColCanFin() {
		return colCanFin;
	}

	public void setColCanFin(int colCanFin) {
		this.colCanFin = colCanFin;
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
