package com.pknu.trainers.vo;

public class TrainersVo {
	
	private String tid;
	private String tname;
	private String tgender;
	private String tbirth;
	private String tage;
	private int tcareer;
	private String tlicense;
	private String lname;
	
	public TrainersVo() {	}
	
	public TrainersVo(String tid, String tname, String tgender, String tbirth, String tage, int tcareer, String tlicense,
			String lname) {
		this.tid = tid;
		this.tname = tname;
		this.tgender = tgender;
		this.tbirth = tbirth;
		this.tage = tage;
		this.tcareer = tcareer;
		this.tlicense = tlicense;
		this.lname = lname;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTgender() {
		return tgender;
	}

	public void setTgender(String tgender) {
		this.tgender = tgender;
	}

	public String getTbirth() {
		return tbirth;
	}

	public void setTbirth(String tbirth) {
		this.tbirth = tbirth;
	}
	
	public String getTage() {
		return tage;
	}

	public void setTage(String tage) {
		this.tage = tage;
	}

	public int getTcareer() {
		return tcareer;
	}

	public void setTcareer(int tcareer) {
		this.tcareer = tcareer;
	}

	public String getTlicense() {
		return tlicense;
	}

	public void setTlicense(String tlicense) {
		this.tlicense = tlicense;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Override
	public String toString() {
		return "TrainersVo [tid=" + tid + ", tname=" + tname + ", tgender=" + tgender + ", tbirth=" + tbirth + ", tage=" + tage + ", tcareer="
				+ tcareer + ", tlicense=" + tlicense + ", lname=" + lname + "]";
	}
	
	
	
	
}
