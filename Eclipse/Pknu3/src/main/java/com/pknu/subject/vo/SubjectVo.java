package com.pknu.subject.vo;

public class SubjectVo {
	
	//프로시저에서 IN, OUT 값	
	//LECTURES
	private String lId;
	private String lName;
	
	//GRP
	private String grId;
	private String grName;
	
	//DLECTURES
	private String dDay;
	private String dTime;
	private String lCnt;	//해당 수업의 상세 정보 개수
	
	//Trainers - ClassRoom
	private String tId;
	private String tName;
	private String rId;
	private String rName;
	
	//Product
	private String pId;
	//private String pName;
	private String pCost;
	//private String pTot;
	
	//Member
	private String mId;
	
	//Select
	private String inNum;
	private String keyword;
	
	
	//OUT
	private String oCode;
	private String oMsg;
	public String getlId() {
		return lId;
	}
	public void setlId(String lId) {
		this.lId = lId;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getGrId() {
		return grId;
	}
	public void setGrId(String grId) {
		this.grId = grId;
	}
	public String getGrName() {
		return grName;
	}
	public void setGrName(String grName) {
		this.grName = grName;
	}
	public String getdDay() {
		return dDay;
	}
	public void setdDay(String dDay) {
		this.dDay = dDay;
	}
	public String getdTime() {
		return dTime;
	}
	public void setdTime(String dTime) {
		this.dTime = dTime;
	}
	public String getlCnt() {
		return lCnt;
	}
	public void setlCnt(String lCnt) {
		this.lCnt = lCnt;
	}
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getrId() {
		return rId;
	}
	public void setrId(String rId) {
		this.rId = rId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpCost() {
		return pCost;
	}
	public void setpCost(String pCost) {
		this.pCost = pCost;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getoCode() {
		return oCode;
	}
	public void setoCode(String oCode) {
		this.oCode = oCode;
	}
	public String getoMsg() {
		return oMsg;
	}
	public void setoMsg(String oMsg) {
		this.oMsg = oMsg;
	}
		
	public String getInNum() {
		return inNum;
	}
	public void setInNum(String inNum) {
		this.inNum = inNum;
	}
		
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	public SubjectVo( ) {}
	
	public SubjectVo(String lId, String lName, String grId, String grName, String dDay, String dTime, String lCnt,
			String tId, String tName, String rId, String rName, String pId, String pCost, String mId, String inNum,
			String keyword, String oCode, String oMsg) {
		super();
		this.lId = lId;
		this.lName = lName;
		this.grId = grId;
		this.grName = grName;
		this.dDay = dDay;
		this.dTime = dTime;
		this.lCnt = lCnt;
		this.tId = tId;
		this.tName = tName;
		this.rId = rId;
		this.rName = rName;
		this.pId = pId;
		this.pCost = pCost;
		this.mId = mId;
		this.inNum = inNum;
		this.keyword = keyword;
		this.oCode = oCode;
		this.oMsg = oMsg;
	}
	
	
	@Override
	public String toString() {
		return "SubjectVo [lId=" + lId + ", lName=" + lName + ", grId=" + grId + ", grName=" + grName + ", dDay=" + dDay
				+ ", dTime=" + dTime + ", lCnt=" + lCnt + ", tId=" + tId + ", tName=" + tName + ", rId=" + rId
				+ ", rName=" + rName + ", pId=" + pId + ", pCost=" + pCost + ", mId=" + mId + ", inNum=" + inNum
				+ ", keyword=" + keyword + ", oCode=" + oCode + ", oMsg=" + oMsg + "]";
	}
	
		

}
