package com.pknu.subject.service;

import java.util.HashMap;
import java.util.List;

import com.pknu.subject.vo.SubjectVo;

public interface SubjectSerivce {

	List<SubjectVo> getTotList(HashMap<String, Object> map);

	List<SubjectVo> getGrList(HashMap<String, Object> map);

}
