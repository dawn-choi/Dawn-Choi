package com.pknu.notice.service.impl;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.notice.dao.NoticeDao;
import com.pknu.notice.service.NoticeService;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;


@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	

	@Override
	public List<NoticeVo> getList(HashMap<String, Object> map) {
		List<NoticeVo> list = noticeDao.getList(map);	
		return list;
	}

	@Override
	public List<FilterVo> getFilterList() {
		List<FilterVo> list = noticeDao.getFilterList();	
		
		return list;
	}

	@Override
	public void setWrite(HashMap<String, Object> map, HttpServletRequest request) {
		//1. 파일업로드 비지니스 로직 처리 
		CheckFileName checkFile = new CheckFileName();
		
		MultipartHttpServletRequest multipartServletRequest
		= (MultipartHttpServletRequest) request;
		
		// Iterator는 set, list, map과 같은 데이터 집합체로부터 
		// 정보를 얻어낸다고 볼 수 있다. 
		// set, list, map의 정보를 얻을려면 각각의 접근 방식을 익혀야한다.
		// 하지만 iterator을 쓰면 해결!
		Iterator<String> iterator = multipartServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		List<String> filenames  = new ArrayList<String>();
		List<String> fileexts   = new ArrayList<String>();
		List<String> sfilenames = new ArrayList<String>();
	
		String fileName    = null;
		String orgFileName = null;
		String fileExt     = null;
		String sFileName   = null;
		
		String filePath = "c:\\upload\\";
		
		int i = 0;
		while(iterator.hasNext()) // 자료가 있는지를 판단 한다. 
		{ 
			multipartFile = multipartServletRequest.getFile( iterator.next());
			
			if(!multipartFile.isEmpty()) {
				fileName = multipartFile.getOriginalFilename();
				orgFileName = fileName.substring(0, fileName.lastIndexOf("."));
				fileExt     = fileName.substring(fileName.lastIndexOf("."));
				
				// 이름 세탁기 
				sFileName = checkFile.getFileName(filePath, orgFileName, fileExt);
				
				
				filenames.add(fileName); // arraylist에 추가 
				fileexts.add(fileExt); // arrayList에 추가 
				sfilenames.add(sFileName); // arrayList에 추가
				
				map.put("filenames", filenames);
				map.put("fileexts",  fileexts);
				map.put("sfilenames", sfilenames);
				
				// 저장하자! 
			    File file = new File(filePath+sFileName);
			    i+=1;
			    try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 실제파일명으로 저장 
			}
			
		}
		
		System.out.println(map);
		
		//2. db에 저장합시당! 
		noticeDao.setWrite(map);
	}



	


}
