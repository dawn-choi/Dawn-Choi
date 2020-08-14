package com.pknu.notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pknu.notice.service.NoticeService;
import com.pknu.notice.vo.FilterVo;
import com.pknu.notice.vo.NoticeVo;
import com.pknu.notice.vo.PhotoVo;


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
		
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("map", map);
	    mv.setViewName("notice/writeform");

		return mv;
	}
	
	@RequestMapping("/testWrite")
	public ModelAndView testWrite(@RequestParam HashMap<String, Object>map)
	{
		System.out.println(map);
		
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("map", map);
	    mv.setViewName("notice/content");
	    
		return mv;
	}
	
	
	@RequestMapping("/test")
	public String test()
	{
		
	   

		return "notice/test";
	}
	
	
	//==================================에디터 그림 업로드 컨트롤러
	@RequestMapping("/common/photoUpload.do")
	public String photoUpload(HttpServletRequest request, PhotoVo vo) {
		
		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		
		
			
			
			////// 서버에 파일을 써보자. ///////
			try {
				if(vo.getFiledata()!=null && vo.getFiledata().getOriginalFilename() != null
						&& !vo.getFiledata().getOriginalFilename().equals(""))
					{
					    // 파일이 존재하면
						String original_name = vo.getFiledata().getOriginalFilename();
						String ext = original_name.substring(original_name.lastIndexOf(".")+1);
						
						//파일 기본경로
						String defaultPath = request.getSession().getServletContext().getRealPath("/");
						
						//파일 기본 경로 _ 상세 결로
						String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;
						
						File file = new File(path);
						
						System.out.println("path:" + path);
						
						//디렉토리 존재하지 않을경우 디렉토리 생성 
						if(!file.exists())
						{
							file.mkdirs();
						}
				
						// 서버에 업로드 할 파일명 (한글문제로 인해 원본파일은 올리지 않는 것이 좋다.)
						String realname = UUID.randomUUID().toString() + "." + ext;
						
						////////// 서버에 파일을 써보자! ////// 
						vo.getFiledata().transferTo(new File(path+realname));
				
						file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
		            } else {
		                file_result += "&errstr=error";
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return "redirect:" + callback + "?callback_func="+callback_func+file_result;
		    }
	
	
	//다중파일업로드
    @RequestMapping("/common/multiplePhotoUpload.do")
    public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
        try {
             //파일정보
             String sFileInfo = "";
             //파일명을 받는다 - 일반 원본파일명
             String filename = request.getHeader("file-name");
             //파일 확장자
             String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
             //확장자를소문자로 변경
             filename_ext = filename_ext.toLowerCase();
             //파일 기본경로
             String dftFilePath = request.getSession().getServletContext().getRealPath("/");
             //파일 기본경로 _ 상세경로
             String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
             File file = new File(filePath);
             if(!file.exists()) {
                file.mkdirs();
             }
             String realFileNm = "";
             SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
             String today= formatter.format(new java.util.Date());
             realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
             String rlFileNm = filePath + realFileNm;
             ///////////////// 서버에 파일쓰기 ///////////////// 
             InputStream is = request.getInputStream();
             OutputStream os=new FileOutputStream(rlFileNm);
             int numRead;
             byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
             while((numRead = is.read(b,0,b.length)) != -1){
                os.write(b,0,numRead);
             }
             if(is != null) {
                is.close();
             }
             os.flush();
             os.close();
             ///////////////// 서버에 파일쓰기 /////////////////
             // 정보 출력
             sFileInfo += "&bNewLine=true";
             // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
             sFileInfo += "&sFileName="+ filename;;
             sFileInfo += "&sFileURL="+"/resource/photo_upload/"+realFileNm;
             PrintWriter print = response.getWriter();
             print.print(sFileInfo);
             print.flush();
             print.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


	
	
	
	
}
