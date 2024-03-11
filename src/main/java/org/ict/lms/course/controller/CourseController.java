package org.ict.lms.course.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ict.lms.common.Paging;
import org.ict.lms.course.model.service.CourseService;
import org.ict.lms.course.model.vo.Course;
import org.ict.lms.designedsubject.model.service.DesignedSubjectService;
import org.ict.lms.designedsubject.model.vo.DesignedSubject;
import org.ict.lms.student.model.vo.Student;
import org.ict.lms.teacher.model.service.TeacherService;
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
public class CourseController {
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private TeacherService TeacherService;
	
	@Autowired
	private DesignedSubjectService designedSubjectService;
	
	@RequestMapping("courseDetail.do")
	public String selectCourseDetail(Model model,
			@RequestParam("classCode") String classCode,
			@RequestParam("profCode") String profCode,
			@RequestParam(name="page", required=false) String page) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		Map<String, String> params = new HashMap<>();
		params.put("classCode", classCode);
		params.put("profCode", profCode);
		
		Course course = courseService.selectCourseDetail(params);
		
		String nString = course.getClassGoal();
		String brString = nString.replace("\n", "<br>");
		course.setClassGoal(brString);
		
		ArrayList<DesignedSubject> dslist = designedSubjectService.selectDesignedSubject(classCode);
		
		// 종강일 계산
		// =============================================================
		int totalTime = 0;
		// 과목의 모든 시간을 더한다.
		for (int i = 0; i < dslist.size(); i++) {
			totalTime += dslist.get(i).getSetTime();
		}
		// 하루 8시간으로 계산하여 강의 전체 일 수를 구한다.
		int totalDate = totalTime / 8;

		String resultDateString = null;
		// 개강일을 문자열에 저장
		String date = course.getExecuteDate();
		// 개강일과 같은 Format으로 SimpleDateFormat 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			// Date 객체에 개강일을 파싱
			Date fDate = sdf.parse(date);
			// 달력 객체 생성하고 일자를 개강일로 설정
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(fDate);
			// 개강일로부터 더할 날짜를 하루 8시간으로 계산한 개강일수로 설정
			int daysToAdd = totalDate;
			
			// 평일이라면 -1 처리하면서
			while (daysToAdd > 0) {
				// 날짜를 하루씩 더해 나감
				calendar.add(Calendar.DAY_OF_YEAR, 1);
				// 평일이라면 daysToAdd를 -1 처리
				if (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY
                        && calendar.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                    daysToAdd--;
				}
			}
			// 계산된 날짜를 resultDate에 저장
			Date resultDate = calendar.getTime();
			// 지정한 Format에 저장
            resultDateString = sdf.format(resultDate);
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		// =============================================================	
		// 종강일 계산 끝

		if (course != null) {
			model.addAttribute("course", course); 
			model.addAttribute("dslist", dslist);
			model.addAttribute("endDate", resultDateString);
			model.addAttribute("currentPage", currentPage);
		}
		return "admin_teacher/admin/course/courseDetailView";
	}
	
	@RequestMapping("tCourseDetail.do")
	public String selectTCourseDetail(Model model,
			@RequestParam("classCode") String classCode,
			@RequestParam("profCode") String profCode,
			@RequestParam(name="page", required=false) String page) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		Map<String, String> params = new HashMap<>();
		params.put("classCode", classCode);
		params.put("profCode", profCode);
		
		Course course = courseService.selectCourseDetail(params);

		String nString = course.getClassGoal();
		String brString = nString.replace("\n", "<br>");
		course.setClassGoal(brString);
		
		ArrayList<DesignedSubject> dslist = designedSubjectService.selectDesignedSubject(classCode);
		
		if (course != null) {
			model.addAttribute("course", course); 
			model.addAttribute("dslist", dslist);
			model.addAttribute("currentPage", currentPage);
		}
		
		return "admin_teacher/teacher/course/tCourseEditView";
	}
	
	@RequestMapping("sCourseDetail.do")
	public String selectTCourseDetail(Model model,
			HttpSession session) {

		Student student = (Student)session.getAttribute("student");
		
		Course course = courseService.selectSCourseDetail(student.getClass_Code());
		ArrayList<DesignedSubject> dslist = designedSubjectService.selectDesignedSubject(student.getClass_Code());
		
		String nString = course.getClassGoal();
		String brString = nString.replace("\n", "<br>");
		course.setClassGoal(brString);
		
		if (course != null) {
			model.addAttribute("course", course); 
			model.addAttribute("dslist", dslist);
		}
		
		return "student/course/sCourseDetailView";
	}
	
	// =================================================================
	// ========================= 페이지 이동처리 관련 =========================
	// =================================================================
	@RequestMapping("courseList.do")
	public String moveCourseListView(
			@RequestParam(name="page", required=false) String page,
			@RequestParam(name="limit", required=false) String limitStr,
			Model model) {
		
		int currentPage = 1;
		
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		if (limitStr != null) {
			limit = Integer.parseInt(limitStr);
		}
		
		int listCount = courseService.selectCourseListCount();
		
		Paging paging = new Paging(listCount, currentPage, limit, "courseList.do");
		paging.calculator();
		
		ArrayList<Course> list = courseService.selectCourseList(paging);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("limit", limit);

		return "admin_teacher/admin/course/courseListView";
	}


	// =================================================================
	// ========================= 동작 요청 처리 관련 =========================
	// =================================================================
	// 과정설계 확인 INSERT 메소드
	@RequestMapping(value="insertCourse.do", method= RequestMethod.POST)
	public String insertCourse(HttpServletResponse response,
			@RequestBody String param) throws ParseException {
		
		response.setContentType("application/json; charset=UTF-8");
		JSONParser jparser = new JSONParser();
		// 가장 바깥 JSONArray
		JSONArray job = (JSONArray)jparser.parse(param);
		
		// JSONArray 의 0번째 = course 객체
		JSONObject courseJSON = (JSONObject)job.get(0);
		// JSONArray 의 1번째 = JSONArray2
		JSONArray subjCode = (JSONArray)job.get(1);
		JSONArray subjName = (JSONArray)job.get(2);
		JSONArray sTime = (JSONArray)job.get(3);
		
		// 과정에 대한 set
		Course course = new Course();
		
		String className = (String)courseJSON.get("className");
		String profCode = (String)courseJSON.get("profCode");

		course.setClassName(className);
		course.setClassGoal((String)courseJSON.get("classGoal"));
		course.setExecuteDate((String)courseJSON.get("executeDate"));
		course.setProfCode(profCode);
		course.setProfConfirm((String)courseJSON.get("profConfirm"));
		course.setUploadDate((String)courseJSON.get("uploadDate"));
		
		int result = courseService.insertCourse(course);
		
		// ClassName 으로 생성된 CourseCode 를 조회. 
		String classCode = courseService.selectCourseCode(className);
		
		// 교강사의 classCode를 update
		Map<String, String> params = new HashMap<>();
		params.put("profCode", profCode);
		params.put("classCode", classCode);
		TeacherService.updateTeacherClassCode(params);

		// 먼저 과정을 INSERT 가 성공했을 시
		if (result > 0) {			
			for (int i = 0; i < subjCode.size(); i++) {
				
				DesignedSubject ds = new DesignedSubject();
				ds.setClassCode(classCode);
				ds.setSubjectCode((String)subjCode.get(i));
				ds.setSubjectName((String)subjName.get(i));
				ds.setSetTime(Integer.parseInt(sTime.get(i).toString()));
				
				designedSubjectService.insertDesignedSubject(ds);
			}
		}
		return "redirect:courseList.do";
	}
	
	// 과정 업데이트 메소드
	@RequestMapping(value="updateCourse.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateCourseMethod(Course course,
			HttpServletResponse response) {
		logger.info("Course : " + course);
		courseService.updateExecuteDateMethod(course);

		return "redirect:courseList.do";
	}

}
