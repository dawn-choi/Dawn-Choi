package com.pknu.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pknu.notice.service.NoticeService;
import com.pknu.notice.vo.ContentVo;
import com.pknu.notice.vo.FileUploadVo;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.LikeVo;
import com.pknu.notice.vo.NoticeVo;


@Controller
public class NoticeController {
	
	
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/MBoard")
	public String mboard() {
		return "notice/mboard";
	}
	
	
	@RequestMapping(value = "/FilterList", produces = "application/text; charset=utf8")
	@ResponseBody
	public String FilterSelect(HttpServletResponse response) throws JsonProcessingException
	{
		List<FilterVo> list = noticeService.getFilterList();
			
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(list);
		
		//System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "/NoticeList", produces = "application/text; charset=utf8")
	@ResponseBody
	public String NoticeList( @RequestParam HashMap<String, Object> map, HttpServletResponse response) throws JsonProcessingException
	{
		System.out.println(map);
		List<NoticeVo> list = noticeService.getList(map);
	
		// Jackson Library 
		// java 객체 -> Json 
		ObjectMapper mapper = new ObjectMapper();

		String jsonStr = mapper.writeValueAsString(list);

		System.out.println(jsonStr);
		
		return jsonStr;
				
	}
	
	// 세션에 저장된 현재 아이디를 들고 와야함
	// 작성 페이지에는 현재 아이디가 히든 INPUT에 기록되어 있어야함. 
	@RequestMapping("/NoticeWriteForm")
	public ModelAndView NoticeWriteForm(@RequestParam HashMap<String, Object>map)
	{
		System.out.println("writeform" + map);
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("map", map);
	    mv.setViewName("notice/writeform");

		return mv;
	}
	
	@RequestMapping("/Write")
	public String testWrite(@RequestParam HashMap<String, Object>map,
			HttpServletRequest request)
	{
		System.out.println(map);
		
		noticeService.setWrite(map,request);
 
		return "notice/content";
	}
	
	
	// 본문! 페이지로 가기
	@RequestMapping("/GoContent")
	public ModelAndView GoContent(@RequestParam HashMap<String, Object>map)
	{
		System.out.println(map);
		
		// 중간 과정에서 조회수 업데이트 한다.
		noticeService.plusRC(map);
		
		ModelAndView mv = new ModelAndView();
	    mv.addObject("map", map);
	    mv.setViewName("notice/content");
		
		
		return mv;

	}
	
	
	// 본문 내용 불러오기 (타이틀, 내용)
	@RequestMapping(value = "/Notice/getContent", produces = "application/text; charset=utf8" )
	@ResponseBody
	public String getContent (@RequestParam HashMap<String,Object> map,HttpServletResponse response ) throws JsonProcessingException
	{
		 // ajax에게 전해받은 idx를 이용해서 데이터를 가져와 보자! 
		 List<ContentVo> list = noticeService.getContent(map);
		
		 //중요!
		 // 자바 객체를 json으로 보내주자! ajax에게 
		 ObjectMapper mapper = new ObjectMapper();
		 
		 String jsonStr = mapper.writeValueAsString(list);
		 
		 System.out.println("컨텐츠 제이슨" + jsonStr);
		 
	     return jsonStr;
	}
	
	
	// 좋아요 세팅 불러오기 (해당 게시글과 세션의 로그인 아이디와 비교 후 좋아요 했는지 판단 값 결과로 리턴)
	@RequestMapping(value = "/Notice/settingLike", produces = "application/text; charset=utf8" )
	@ResponseBody
	public String settingLike (@RequestParam HashMap<String,Object> map, HttpServletResponse response) throws JsonProcessingException
	{
		System.out.println("오잉" + map);
		
		List<LikeVo> list = noticeService.settingLike(map);
		
		//중요!
		 // 자바 객체를 json으로 보내주자! ajax에게 
		 ObjectMapper mapper = new ObjectMapper();
		 
		 String jsonStr = mapper.writeValueAsString(list);
		 
		 System.out.println("좋아요 제이슨" + jsonStr);
		
		return jsonStr;
		
	}
	
	
	
	
	
	
	//==================================에디터 그림 업로드 컨트롤러
	
	@RequestMapping("/imageUpload.do")
	
	 public String imageUpload(@ModelAttribute("fileUploadVo") FileUploadVo fileUploadVo,
			 HttpServletRequest request, Model model)
	{
	    HttpSession session = request.getSession();
		
		// D:\Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Pknu3\
		//업로드 디렉토리가 웹서비스 디렉토리 하위에 존재할 경우
		// 저장될 물리 주소
		//String rootPath = "Project3_Fitness\\Eclipse\\Pknu3\\webapp\\WEB-INF\\resources\\";
		//System.out.println(rootPath);
		
		String url = request.getRealPath("/resources");
		System.out.println(url);
		String rootPath = url.substring(0,url.indexOf(".metadata"));
		System.out.println(rootPath);
		
		String midattachPath = "Project3_Fitness/Eclipse/Pknu3/webapp/WEB-INF/resources/";
		
		String attachPath = "files/";
		
		//org.springframework.web.multipart.commons.CommonsMultipartFile@16d5690d
		MultipartFile upload = fileUploadVo.getUpload();
		
		String filename = "";
		String CKEditorFuncNum = "";
		
		if(upload != null) {
			//KakaoTalk_20200810_195614828.jpg -- 첨부한 파일 원래 이름 
			filename = upload.getOriginalFilename();
			fileUploadVo.setFilename(filename);
			
			// 1
			CKEditorFuncNum = fileUploadVo.getCKEditorFuncNum();
			
			
			try {
				File file = new File(rootPath + midattachPath + attachPath + filename);
				System.out.println(file);
				if(!file.exists())
				{
					file.mkdirs();// 디렉토리 만들어줌 
				}
				upload.transferTo(file); 
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
			model.addAttribute("filePath", attachPath + filename); // 결과 값을 
			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum); // jsp ckeditor 콜백 함수로 보내줘야함.
			
			System.out.println(model);
			
		    return "notice/writeform";
		
	}
	
	
	
	}	

