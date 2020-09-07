package com.pknu.notice.vo;

public class FilesVo {
	
	private  int     file_num;
	private  int     idx;
	private  String  filename;
	private  String  fileext;
	private  String  sfilename;
	private  String  mid;
	
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFileext() {
		return fileext;
	}
	public void setFileext(String fileext) {
		this.fileext = fileext;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	@Override
	public String toString() {
		return "FilesVo [file_num=" + file_num + ", idx=" + idx + ", filename=" + filename + ", fileext=" + fileext
				+ ", sfilename=" + sfilename + ", mid=" + mid + "]";
	}
	
	
	
	
	
}
