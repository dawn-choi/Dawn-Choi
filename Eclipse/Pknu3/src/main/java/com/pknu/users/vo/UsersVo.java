package com.pknu.users.vo;

public class UsersVo {

	
	UsersVo(){};
	
	private String pop;
	public String getPop() {
		return pop;
	}
	public void setPop(String pop) {
		this.pop = pop;
	}

	private String mid;
	private String mpwd;
	private String mname;
	private String memail;
	private String pname;
	private String oexp;
	private String mbirth;
	private String mgender;
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	private String mtel;
	private String maddr;
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	private String pid;
	private String cname;
	private String count;
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getOexp() {
		return oexp;
	}
	public void setOexp(String oexp) {
		this.oexp = oexp;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getLcount() {
		return lcount;
	}
	public void setLcount(String lcount) {
		this.lcount = lcount;
	}

	private String lcount;
	
	
	
	
	
	public String getMid() {
		return mid;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public UsersVo(String mid, String mpwd, String mname) {
		super();
		this.mid = mid;
		this.mpwd = mpwd;
		this.mname = mname;
	}
	
}
