package com.pknu.subject.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.subject.dao.SubjectDao;
import com.pknu.subject.service.SubjectSerivce;
import com.pknu.subject.vo.SubjectVo;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectSerivce{

	@Autowired
	private SubjectDao subjectDao;
	
	@Override
	public List<SubjectVo> getTotList(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectDao.getTotList(map);
		
		return subjectList;
	}

	@Override
	public List<SubjectVo> getGrList(HashMap<String, Object> map) {
		
		List<SubjectVo> groupList = subjectDao.getGrList(map);
		
		return groupList;
	}

	@Override
	public List<SubjectVo> getSubjectByFilter(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectDao.getSubjectByFilter(map);
		
		return subjectList;
	}

	@Override
	public List<SubjectVo> getSubjectBySearch(HashMap<String, Object> map) {
		
		List<SubjectVo> subjectList = subjectDao.getSubjectBySearch(map);
		
		return subjectList;
	}

	@Override
	public void setRegister(HashMap<String, Object> map) {
		
		 subjectDao.setRegister(map);		
	
	}

	@Override
	public List<SubjectVo> getGrSelect(HashMap<String, Object> map) {
		
		List<SubjectVo> grList = subjectDao.getGrSelect(map);
		
		return grList;
	}

	@Override
	public List<SubjectVo> getClassSelect(HashMap<String, Object> map) {
		
		List<SubjectVo> classList = subjectDao.getClassSelect(map);
		
		return classList;
	}

	@Override
	public List<SubjectVo> getTermSelect(HashMap<String, Object> map) {

		List<SubjectVo> termList = subjectDao.getTermSelect(map);
		
		return termList;
	}

	@Override
	public List<SubjectVo> getTicketList(HashMap<String, Object> map) {
		
		List<SubjectVo> ticketList = subjectDao.getTicketList(map);
		
		return ticketList;
	}

	@Override
	public void getTicket(HashMap<String, Object> map) {
		
		subjectDao.getTicket(map);
		
	}

	@Override
	public String getDirection(String departure, String arrival) {
		
		String origin = null;
		String destination = null;
		
		try {
			origin		= URLEncoder.encode(departure, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			destination = URLEncoder.encode(arrival, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String apiURL = "https://maps.googleapis.com/maps/api/directions/json?" 
				+ "&mode=transit&origin=" + origin 
        		+ "&destination=" + destination 
        		+ "&region=kr&language=ko&key=AIzaSyBs1sXeUkv-P4HYB3LE7ED-8L3qdGaKwuQ";
		
		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("Content-Type", "application/json");
		requestHeaders.put("Access-Control-Allow-Origin", "*");
		
		String responseBody = get(apiURL, requestHeaders);
		
		System.out.println("BODY " + responseBody);
		
		return responseBody;
	}

	private String get(String apiURL, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiURL);
		
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	            con.setRequestProperty(header.getKey(), header.getValue());
	        }
			
			int responseCode = con.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	            return readBody(con.getInputStream());
	        } else { // 에러 발생
	            return readBody(con.getErrorStream());
	        }
	    } catch (IOException e) {
	        throw new RuntimeException("API 요청과 응답 실패", e);
	    } finally {
	        con.disconnect();
	    }
			
	}


	private HttpURLConnection connect(String apiURL) {
		 try {
	            URL url = new URL(apiURL);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiURL, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiURL, e);
	        }
	}

	private String readBody(InputStream inputStream) {
		InputStreamReader streamReader = new InputStreamReader(inputStream);
		
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
