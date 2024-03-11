package org.ict.lms.subject.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.ict.lms.course.controller.CourseController;
import org.ict.lms.subject.model.service.SubjectService;
import org.ict.lms.subject.model.vo.Subject;
import org.ict.lms.teacher.model.service.TeacherService;
import org.ict.lms.teacher.model.vo.Teacher;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SubjectController {
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private TeacherService teacherService;
	
	// 과정작성페이지 이동시 필요한 데이터 들고가는 메소드
	@RequestMapping("selectSList.do")
	public String selectFirstCateList(Model model){

		ArrayList<Subject> clist1 = subjectService.selectFirstCateList();
		ArrayList<Teacher> tlist = teacherService.selectTeacherList();
		
		if (clist1 != null && clist1.size() > 0) {
			model.addAttribute("clist1", clist1);
			model.addAttribute("tlist", tlist);
			return "admin_teacher/admin/course/courseWriteForm";
		} else {
			return "admin_teacher/admin/course/courseListView";
		}
	}
	
	// 추가버튼 클릭시 Ajax 통신으로 과목명, 시수 select 
	@RequestMapping(value="subAdd.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String subAddMethod(HttpServletResponse response) throws IOException {
		
		ArrayList<Subject> list = subjectService.selectSubjectList();
		
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for (Subject subject : list) {
			
			JSONObject job = new JSONObject();
			
			job.put("subjname", URLEncoder.encode(subject.getSubjectName(), "UTF-8"));
			job.put("subjtime", subject.getBasicTime());
			
			jarr.add(job);
		}
		
		sendJson.put("slist", jarr);
		
		return sendJson.toJSONString();
	}
	
	// 대분류 선택시 중분류 출력 메소드
	@RequestMapping(value="select2ndCate.do", method= RequestMethod.POST)
	@ResponseBody
	public String selectSecondCateList(HttpServletResponse response,
			@RequestParam("keyword") String keyword) throws IOException {

		response.setContentType("application/json; charset=UTF-8");

		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		ArrayList<Subject> list = subjectService.selectSecondCateList(keyword);

		for (Subject subject : list) {

			JSONObject job = new JSONObject();

			job.put("secondCateName", URLEncoder.encode(subject.getSecondCategoryName(), "UTF-8"));

			jarr.add(job);
		}
		
		sendJson.put("clist2", jarr);
		
		return sendJson.toJSONString();
	}
	
	// 중분류 선택시 소분류 출력 메소드
	@RequestMapping(value="select3rdCate.do", method= RequestMethod.POST)
	@ResponseBody
	public String selectThirdCateList(HttpServletResponse response,
			@RequestParam("keyword") String keyword) throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		ArrayList<Subject> list = subjectService.selectThirdCateList(keyword);
		
		for (Subject subject : list) {
			
			JSONObject job = new JSONObject();
			
			job.put("thirdCateName", URLEncoder.encode(subject.getThirdCategoryName(), "UTF-8"));
			
			jarr.add(job);
		}
		
		sendJson.put("clist3", jarr);
		
		return sendJson.toJSONString();
	}
	
	// 소분류 선택시 세분류 출력 메소드
	@RequestMapping(value="select4thCate.do", method= RequestMethod.POST)
	@ResponseBody
	public String selectFourthCateList(HttpServletResponse response,
			@RequestParam("keyword") String keyword) throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		ArrayList<Subject> list = subjectService.selectFourthCateList(keyword);
		
		for (Subject subject : list) {
			
			JSONObject job = new JSONObject();
			
			job.put("fourthCateName", URLEncoder.encode(subject.getFourthCategoryName(), "UTF-8"));
			
			jarr.add(job);
		}
		
		sendJson.put("clist4", jarr);
		
		return sendJson.toJSONString();
	}
	
	// 세분류 선택시 능력단위 과목 출력 메소드
	@RequestMapping(value="select5thCate.do", method= RequestMethod.POST)
	@ResponseBody
	public String selectSubjCateList(HttpServletResponse response,
			@RequestParam("keyword") String keyword) throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		ArrayList<Subject> list = subjectService.selectSubjCateList(keyword);
		
		for (Subject subject : list) {
			
			JSONObject job = new JSONObject();
			
			job.put("subjectName", URLEncoder.encode(subject.getSubjectName(), "UTF-8"));
			job.put("basicTime", subject.getBasicTime());
			job.put("subjectCode", subject.getSubjectCode());
			
			jarr.add(job);
		}
		
		sendJson.put("sublist", jarr);
		
		return sendJson.toJSONString();
	}

	
	
}
