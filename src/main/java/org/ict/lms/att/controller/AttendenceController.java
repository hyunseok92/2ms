package org.ict.lms.att.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ict.lms.att.model.service.AttendenceService;
import org.ict.lms.att.model.vo.Attendence;
import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.course.model.service.CourseService;
import org.ict.lms.student.model.service.StudentService;
import org.ict.lms.student.model.vo.Student;
import org.ict.lms.tTest.model.service.TTestService;
import org.ict.lms.tTest.model.vo.TTest;
import org.ict.lms.teacher.model.service.TeacherService;
import org.ict.lms.teacher.model.vo.Teacher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AttendenceController {

	private static final Logger logger = LoggerFactory.getLogger(AttendenceController.class);

	@Autowired
	private AttendenceService attendenceService;

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TeacherService teacherService;

	@Autowired
	private TTestService tts;
	
	@Autowired
	private CourseService courserService;

	
	//--------------------------------SELECT-------------------------------------
	@RequestMapping(value = "att_admin.do")
	public String selectAttAdminMethod(Model model, HttpServletRequest request,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "action", required = false) String action,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam(name ="selectData", required = false) String selectData
			) {
		
	
		if (selectData != null) {
			if (selectData.equals("전체")) {
				selectData = null;
			}
		}

		if (name != null) {
			if (name.isEmpty()) {
				name = null;
			}
		}

		ArrayList<TTest> tlist = tts.selectClassMethod1();
		model.addAttribute("tlist", tlist);

		ArrayList<Student> slist = null;

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);

		}

		// 한페이지에 목록 10개씩 출력되게 한다면
		int limit = 10;
		// 회원 목록 전체 갯수 조회해 옴
		int listCount = 0;

		if (action == null || (selectData == null && name == null)) {

			listCount = studentService.selectStudentListCount();
			Paging paging = new Paging(listCount, currentPage, limit, "att_admin.do");
			paging.calculator(); // 페이징에 필요한 항목들 계산 처리

			slist = studentService.selectStudentList(paging);

			model.addAttribute("slist", slist);
			model.addAttribute("paging", paging);
		} else {

			Search search = new Search();
			search.setKeyword(name);
			search.setKeyword2(selectData);

			listCount = studentService.searchStudentListCount(search);

			Paging paging = new Paging(listCount, currentPage, limit, "att_admin.do");
			paging.calculator(); // 페이징에 필요한 항목들 계산 처리

			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());

			slist = studentService.selectStudentList(search);

			model.addAttribute("slist", slist);
			model.addAttribute("paging", paging);
			
			model.addAttribute("action", action);
			model.addAttribute("keyword2", selectData);

		}
	
		model.addAttribute("grade", "student");

		return "attendence/attendence_admin";
	}


	@RequestMapping(value = "att_teacher.do")
	public String selectAttTeacherMethod(HttpSession session, Model model) {
		
		Teacher teacher = (Teacher)session.getAttribute("teacher");
				
		ArrayList<Attendence> slist = attendenceService.selectAttendenceList(teacher.getClass_code());
		
		if(slist.size() < 1) {
			
			 // 현재 날짜 구하기
	        LocalDate now = LocalDate.now();
	 
	        // 포맷 정의
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 
	        // 포맷 적용
	        String formatedNow = now.format(formatter);
	        
	        model.addAttribute("dateInfo", formatedNow);
		}
		
		ArrayList<TTest> tlist = tts.selectClassMethod(teacher.getProf_Code());
		
		
		model.addAttribute("slist", slist);
		model.addAttribute("tlist", tlist);

		
		return "attendence/attendence_teacher";
	}
	
	
	@RequestMapping(value = "att_selectDate.do")
	public String selectAttDateMethod(Model model, @RequestParam(name="prof_code") String profCode, @RequestParam(name="attDate") String attdate, @RequestParam(name="class_code") String classcode, @RequestParam(name="status", required=false) String status) {
		
		String parseDate = attdate;
		
		attdate = attdate.replaceAll("-", "");
		
		Attendence att = new Attendence();
		att.setClass_code(classcode);
		att.setProf_code(profCode);
		att.setAttdate(attdate);
		att.setStatus(status);

		ArrayList<Attendence> slist = attendenceService.searchDateAttList(att);
		ArrayList<TTest> tlist = tts.selectClassMethod(att.getProf_code());
		
		
		if(slist.size() < 1) {
			model.addAttribute("dateInfo", parseDate);
		}
		
		model.addAttribute("slist", slist);
		model.addAttribute("tlist", tlist);

		return "attendence/attendence_teacher";
	}
	
	@RequestMapping(value = "att_select.do")
	public String selectAttAdminMethod(Model model) {
		
		ArrayList<TTest> tlist = tts.selectClassMethod1();
		
		 // 현재 날짜 구하기
        LocalDate now = LocalDate.now();
 
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        // 포맷 적용
        String formatedNow = now.format(formatter);
        
        model.addAttribute("dateInfo", formatedNow);
		model.addAttribute("tlist", tlist);
		
		return "attendence/attSelect_admin";
	}
	
	
	@RequestMapping(value ="att_selectAdmin.do")
	public String searchAttAdminMethod(Model model, Attendence att) {
		
		String parseDate = att.getAttdate();
		String selectClass = att.getClass_code();
		String profname = teacherService.searchTeacher(selectClass);	
		
		att.setAttdate(att.getAttdate().replaceAll("-", ""));
			
		ArrayList<Attendence> slist = attendenceService.searchDateAttList(att);
		ArrayList<TTest> tlist = tts.selectClassMethod1();
		
		model.addAttribute("profname", profname);
		model.addAttribute("selectClass", selectClass);
        model.addAttribute("dateInfo", parseDate);
		model.addAttribute("slist", slist);
		model.addAttribute("tlist", tlist);
		
		return "attendence/attSelect_admin";
	}
	
	@RequestMapping(value = "att_student.do") 
	public String selectAttStudentMethod(Model model, HttpSession session) {
		Student st = (Student)session.getAttribute("student");
		
		String classname = courserService.searchCourseName(st.getClass_Code());
		String profname = teacherService.searchTeacher(st.getClass_Code());
		
		// 현재 날짜 구하기
        LocalDate now = LocalDate.now();
 
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
 
        // 포맷 적용
        String formatedNow = now.format(formatter);
       
        Attendence att = new Attendence();
        att.setStudent_code(st.getStudentCode());
        att.setAttdate(formatedNow.replaceAll("-", ""));
               
        ArrayList<Attendence> slist = attendenceService.searchMonthAttList(att);
        
    
        model.addAttribute("slist", slist);
        model.addAttribute("dateInfo", formatedNow);
		model.addAttribute("profname", profname);
		model.addAttribute("classname", classname);
		
		return "attendence/attendence_student";
	}
	
	@RequestMapping(value = "att_checkstudent.do")
	public String checkAttStudentMethod(Model model, HttpSession session, Attendence att) {
		
		Student st = (Student)session.getAttribute("student");
		String searchDate = att.getAttdate();
		
		String classname = courserService.searchCourseName(st.getClass_Code());
		String profname = teacherService.searchTeacher(st.getClass_Code());
		
        att.setStudent_code(st.getStudentCode());
        att.setAttdate(att.getAttdate().replaceAll("-", ""));
		
        ArrayList<Attendence> slist = attendenceService.searchMonthStartEnd(att);
                
        model.addAttribute("slist", slist);
		model.addAttribute("dateInfo", searchDate);
		model.addAttribute("profname", profname);
		model.addAttribute("classname", classname);
		
		return "attendence/attendence_student";
	}
	
	//------------------------------------ UPDATE-----------------------------------------------------
	@RequestMapping(value = "att_update.do")
	public String updateAttTeacherMethod(Model model, @RequestParam(name="prof_code") String profCode, @RequestParam(name="attDate") String attdate, @RequestParam(name="class_code") String classcode) {
		
		String parseDate = attdate;
		
		attdate = attdate.replaceAll("-", "");
				
		Attendence att = new Attendence();
		att.setStatus("출석");
		att.setProf_code(profCode);
		att.setAttdate(attdate);
			
		if(attendenceService.updateAllstatus(att) > 0 ) {		
			
			ArrayList<Attendence> slist = attendenceService.selectAttendenceList(classcode);
			ArrayList<TTest> tlist = tts.selectClassMethod(att.getProf_code());

		    model.addAttribute("slist", slist); 
			model.addAttribute("tlist", tlist);
		}
		
		model.addAttribute("dateInfo", parseDate);
		
		return "attendence/attendence_teacher";
	}
	
	//출석부 수정버튼 클릭시
	@RequestMapping(value = "att_updateRow.do")
	public String updateRowAttTeacherMethod(Model model, Attendence att) {
		
		String parseDate = att.getAttdate();
		
		att.setAttdate(att.getAttdate().replaceAll("-", ""));
				
		if (attendenceService.updateAttRow(att) > 0) {
			
			ArrayList<Attendence> slist = attendenceService.searchDateAttList(att);
			ArrayList<TTest> tlist = tts.selectClassMethod(att.getProf_code());

		    model.addAttribute("slist", slist); 
			model.addAttribute("tlist", tlist);
		}
		
		
		model.addAttribute("dateInfo", parseDate);
		return "attendence/attendence_teacher";
	}
}
