package org.ict.lms.teacher.controller;

import java.util.ArrayList;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.course.controller.CourseController;
import org.ict.lms.teacher.model.service.TeacherService;
import org.ict.lms.teacher.model.vo.Teacher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TeacherController {
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	@Autowired
	private TeacherService teacherService;
	

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;


	
	@RequestMapping("selectteacher.do")
	public String selectTeacherMethod(Model model,
			@RequestParam(name= "action", required = false) String action,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam(name = "page", required = false) String page) {
		
		ArrayList<Teacher> slist = null;
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);

		}

		// 한페이지에 목록 10개씩 출력되게 한다면
		int limit = 10;
		// 회원 목록 전체 갯수 조회해 옴
		int listCount = 0;
		
		if(action == null) {
			
			listCount = teacherService.selectCountAllTeacher();
			Paging paging = new Paging(listCount, currentPage, limit, "selectteacher.do");
			paging.calculator(); // 페이징에 필요한 항목들 계산 처리
				
			slist = teacherService.selectTeacherList(paging);
						
			model.addAttribute("paging", paging);
			model.addAttribute("list", slist);
		}
		
		else {
			
			Search search = new Search();
			search.setKeyword(name);
			
			listCount = teacherService.searchTeacherListCount(search);

			Paging paging = new Paging(listCount, currentPage, limit, "selectteacher.do");
			paging.calculator(); // 페이징에 필요한 항목들 계산 처리
			
			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());
			
			slist = teacherService.searchTeacherList(search);

			model.addAttribute("list", slist);
			model.addAttribute("paging", paging);
			
		}	
		
		return "admin_teacher/teacher/teacherList/teacherListView";
	}
	
	@RequestMapping("updateteacherstatus.do")
	public String updateStatusTeacherMethod(@RequestParam(name = "profcode") String profcode, @RequestParam(name = "status") String status) {


		Teacher teacher = new Teacher();
		teacher.setProf_Code(profcode);
		teacher.setInactive_OR_Not(status);
		
		teacherService.updateTeacherStatus(teacher);
				
		return "redirect:/selectteacher.do";
	}
}
