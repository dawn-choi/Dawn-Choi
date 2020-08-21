package com.pknu.notice.vo;

public class ContentVo {

	private String mname;
	private String regdate;
	private String menu_name;
	private String title;
	private String cont;
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	@Override
	public String toString() {
		return "ContentVo [mname=" + mname + ", regdate=" + regdate + ", menu_name=" + menu_name + ", title=" + title
				+ ", cont=" + cont + "]";
	}
	
	
	
}
