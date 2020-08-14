package com.pknu.notice.vo;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVo {

	//photo_uploader.html 페이지의 form 태그내에 존재하는 file 태그의 name명과 일치 시켜준다.
	private MultipartFile Filedata;
	
	//콜백 url
	private String callback;
	
	//콜백 함수
	private String callback_func;

	public MultipartFile getFiledata() {
		return Filedata;
	}

	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}

	@Override
	public String toString() {
		return "PhotoVo [Filedata=" + Filedata + ", callback=" + callback + ", callback_func=" + callback_func + "]";
	}
	
	
	
}
