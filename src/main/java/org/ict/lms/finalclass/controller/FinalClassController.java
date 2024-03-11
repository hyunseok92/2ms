package org.ict.lms.finalclass.controller;

import org.ict.lms.course.controller.CourseController;
import org.ict.lms.course.model.vo.Course;
import org.ict.lms.finalclass.model.service.FinalClassService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class FinalClassController {
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	@Autowired
	private FinalClassService finalClassService;
	
	@RequestMapping("selectFCList.do")
	public String selectFinalClassList(Model model) {
		
		return "";
	}
	
	@RequestMapping("selectFCDetail.do")
	public String selectFinalClassDetail(
			@RequestParam(name="classCode") String classCode) {
		
		return "";
	}
	
	@RequestMapping("insertFC.do")
	public String insertFinalClassMethod(Course course, Model model) {
		
		return "";
	}
}
