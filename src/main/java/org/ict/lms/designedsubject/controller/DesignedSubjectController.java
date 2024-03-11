package org.ict.lms.designedsubject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.ict.lms.course.model.service.CourseService;
import org.ict.lms.designedsubject.model.service.DesignedSubjectService;
import org.ict.lms.designedsubject.model.vo.DesignedSubject;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DesignedSubjectController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DesignedSubjectService designedSubjectService;
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value="selectOneDS.do", method= RequestMethod.POST)
	@ResponseBody
	public String selectOneDS(Model model,
			@RequestParam("subjectName") String subjectName,
			@RequestParam("classCode") String classCode,
			HttpServletResponse response) throws UnsupportedEncodingException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject job = new JSONObject();
		
		Map<String, String> params = new HashMap<>();
		params.put("subjectName", subjectName);
		params.put("classCode", classCode);
		
		DesignedSubject ds = designedSubjectService.selectOneDS(params);
		
		job.put("subjectName", URLEncoder.encode(ds.getSubjectName(), "UTF-8"));
		job.put("subjectCode", ds.getSubjectCode());
		job.put("setTime", ds.getSetTime());
		
		return job.toJSONString();
	}
	
	// 교과목 구성 (INDEX UPDATE)
	@RequestMapping(value="setOrder.do", method= RequestMethod.POST)
	@ResponseBody
	public String setDSOrder(HttpServletResponse response,
			@RequestBody String param) throws ParseException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		JSONParser jparser = new JSONParser();
		// 가장 바깥 JSONArray
		JSONArray job = (JSONArray)jparser.parse(param);
		
		JSONArray classCode = (JSONArray)job.get(0);
		JSONArray subjName = (JSONArray)job.get(1);
		
		for (int i = 0; i < classCode.size(); i++) {
			DesignedSubject ds = new DesignedSubject();
			
			ds.setSubjectName((String)subjName.get(i));
			ds.setSubjIndex(i + 1);
			ds.setClassCode(String.valueOf(classCode.get(i)));			
			
			designedSubjectService.updateDSIndex(ds);
		}
		
		JSONArray profCode = (JSONArray)job.get(2);
		
		Map<String, String> params = new HashMap<>();
		params.put("profCode", String.valueOf(profCode.get(1)));
		params.put("profConfirm", "Y");
		
		courseService.updateCourseMethod(params);
		
		return "redirect:atmain.do";
	}
}
