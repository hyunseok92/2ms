package org.ict.lms.tHomework.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.ict.lms.common.FileNameChange;
import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.homework.model.service.HomeworkService;
import org.ict.lms.homework.model.vo.Homework;
import org.ict.lms.student.model.service.StudentService;
import org.ict.lms.student.model.vo.Student;
import org.ict.lms.tHomework.model.service.THomeworkService;
import org.ict.lms.tHomework.model.vo.THomework;
import org.ict.lms.tTest.model.service.TTestService;
import org.ict.lms.tTest.model.vo.TTest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import oracle.net.aso.h;

@Controller
public class THomeworkController {
	private static final Logger logger = LoggerFactory.getLogger(THomeworkController.class);
	
	@Autowired
	private THomeworkService ths;
	
	@Autowired
	private TTestService tts;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private HomeworkService homeworkService;
	
	@RequestMapping(value="updateTHW.do", method=RequestMethod.POST)
	public String THWupdatePageView(@RequestParam("HWCode")String HWCode,@RequestParam("className")String className, Model model) {
		THomework TH = ths.selectTHWMethod(HWCode);
		model.addAttribute("TH", TH);
		model.addAttribute("className", className);
		return "admin_teacher/teacher/testHW/hw_update";
	}
	
	@RequestMapping("selectHWClassView.do")
	public String selectHWClassView(@RequestParam("teacherCode") String teacherCode, Model model) {
		ArrayList<TTest> clist = tts.selectClassMethod(teacherCode);
		model.addAttribute("clist", clist);
		model.addAttribute("teacherCode", teacherCode);
		
		return "admin_teacher/teacher/testHW/hw_classList";
	}
	@RequestMapping(value="ThomeworkList.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectTHomeworkList(@RequestParam("teacherCode") String teacherCode,
			@RequestParam(name = "page", required = false) String page, 
			@RequestParam(name = "limit", required = false) String slimit, 
			@RequestParam("classCode") String classCode, Model model) {
		
		model.addAttribute("classCode", classCode);
		model.addAttribute("teacherCode", teacherCode);
		if(classCode != null) {
			int currentPage = 1;
	        if (page != null) {
	           currentPage = Integer.parseInt(page);
	        }
	        int limit = 10;
	        if (slimit != null) {
	           limit = Integer.parseInt(slimit);
	           }
			int listCount =  ths.selectTHomeworkViewCount(classCode);
	        // 페이지 관련 항목 계산처리
			 Paging paging = new Paging(listCount, currentPage, limit, "ThomeworkList.do");
		     paging.calculator();
		     Search search = new Search();
		     search.setStartRow(paging.getStartRow());
		   	 search.setEndRow(paging.getEndRow());
		   	 search.setKeyword(classCode);
		   	
		   	 ArrayList<THomework> list = ths.selectTHomeworkPagingView(search);
		   	 model.addAttribute("list", list);
			 model.addAttribute("paging", paging);
			 model.addAttribute("currentPage", currentPage);
			 model.addAttribute("limit", limit); 
			 
		}
		ArrayList<TTest> ttlist = tts.selectsubClass(classCode);
		String className = null;
		for (TTest t : ttlist) {
			className = t.getClassName();
		}
		ArrayList<TTest> clist = tts.selectClassMethod(teacherCode);
		model.addAttribute("clist", clist);
		
		model.addAttribute("className", className);
		
		return "admin_teacher/teacher/testHW/hw_classList";
	}
	@RequestMapping(value="homeworkOpen.do", method=RequestMethod.POST)
	public String homworkOpenView(@RequestParam("classCode") String classCode, @RequestParam("teacherCode") String teacherCode,
			Model model) {
		ArrayList<TTest> list = tts.selectsubClass(classCode);
		String className = null;
		for (TTest t : list) {
			className = t.getClassName();
		}
		model.addAttribute("className", className);
		model.addAttribute("classCode", classCode);
		model.addAttribute("teacherCode", teacherCode);
		return "admin_teacher/teacher/testHW/hw_insert";
	}
	
	
	@RequestMapping(value = "Thwinsert.do", method = RequestMethod.POST)
	public String Thwinsert(@RequestParam(name = "ofile", required = false) MultipartFile mfile, THomework TH,
			Model model, HttpServletRequest request) {
		

		// 공지사항 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/TH_upfiles");

		// 첨부파일이 있을 때
		if (!mfile.isEmpty()) {
			// 전송온 파일이름 추출함
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			// 저장폴더에는 변경된 이름으로 저장 처리함
			// 파일 이름바꾸기함 : 년월일시분초.확장자
			if (fileName != null && fileName.length() > 0) {
				// 바꿀 파일명에 대한 문자열 만들기
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부파일명 확인 : " + fileName + "," + renameFileName);
				try {

					// 저장폴더에 파일명 바꾸기 처리
					mfile.transferTo(new File(savePath + "\\" + renameFileName));

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일 저장 실패");
					
				}
			} // 파일명 바꾸기
			// notice 객체에 첨부파일 정보 저장 처리
			TH.setTHWFile(fileName);
			TH.setTHWRFile(renameFileName);
		} // 첨부파일 있을 때
		ths.insertTHomework(TH);
		
		model.addAttribute("teacherCode", TH.getTeacherCode());
		model.addAttribute("classCode", TH.getClassCode());
		return "redirect:ThomeworkList.do";
		
	}
	@RequestMapping(value = "Thwupdate.do", method = RequestMethod.POST)
	public String THUpdateMethod(HttpServletRequest request, THomework TH, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile,
			@RequestParam(name = "deleteFlag", required = false) String delFlag) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/TH_upfiles");
		
		
		
		if(TH.getTHWFile() != null && (delFlag != null && delFlag.equals("yes"))
				|| !mfile.isEmpty()) {
			//저장 폴더에서 파일 삭제함
			new File(savePath + "\\" + TH.getTHWRFile()).delete();
			//notice 안의 파일 정보도 제거함
			TH.setTHWFile(null);
			TH.setTHWRFile(null);
		}
		
		
		//2. 새로운 첨부파일이 있을 때 (공지글 첨부파일은 1개임)
		if (!mfile.isEmpty()) {
			//이전 첨부파일이 있을 때, 저장 폴더에서 이전 파일을 삭제함
			if(TH.getTHWFile() != null) {
				//저장 폴더에서 파일 삭제함
				new File(savePath + "\\" + TH.getTHWRFile()).delete();
			}
			
			
			
			// 전송온 파일이름 추출함
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			// 저장폴더에는 변경된 이름으로 저장 처리함
			// 파일 이름바꾸기함 : 년월일시분초.확장자
			if (fileName != null && fileName.length() > 0) {
				// 바꿀 파일명에 대한 문자열 만들기
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부파일명 확인 : " + fileName + "," + renameFileName);
				try {

					// 저장폴더에 파일명 바꾸기 처리
					mfile.transferTo(new File(savePath + "\\" + renameFileName));

				} catch (Exception e) {
					e.printStackTrace();
					
				}
			} // 파일명 바꾸기
			// notice 객체에 첨부파일 정보 저장 처리
			TH.setTHWFile(fileName);
			TH.setTHWRFile(renameFileName);
		} // 새로운 첨부파일 있을 때
		ths.updateTHomework(TH);
		model.addAttribute("teacherCode", TH.getTeacherCode());
		model.addAttribute("classCode", TH.getClassCode());
		
		return "redirect:ThomeworkList.do";
		
	}
	
	@RequestMapping(value="deleteTHW.do", method=RequestMethod.POST)
	public String deleteTHWMethod(@RequestParam("HWCode")String HWCode, @RequestParam(name="rfile", required=false) String renameFile, 
			HttpServletRequest request,Model model) {
		THomework TH = ths.selectTHWMethod(HWCode);
		if(ths.deleteTHW(HWCode) > 0) {
			if(renameFile != null) {
				String savePath = request.getSession().getServletContext().getRealPath("resources/TH_upfiles");
				new File(savePath + "\\" + renameFile).delete();
			}
		}
		ArrayList<Homework> list = homeworkService.selectHomeworkList(HWCode);
		for (Homework h : list) {
			Homework hw = new Homework();
			hw.setSHWRFile(h.getSHWRFile());
			String srenameFile = hw.getSHWRFile();
			if(homeworkService.deleteSHW(h) > 0) {
				String savePath = request.getSession().getServletContext().getRealPath("resources/SH_upfiles");
				new File(savePath + "\\" + srenameFile).delete();
			}
		}
		model.addAttribute("teacherCode", TH.getTeacherCode());
		model.addAttribute("classCode", TH.getClassCode());
		return "redirect:ThomeworkList.do";
	}
	@RequestMapping("hwDetailView.do")
	public String hwDetailView(THomework TH, @RequestParam("className") String className, Model model) {
		ArrayList<Student> slist = studentService.selectStudentList(TH.getClassCode());
		ArrayList<Homework> hlist = homeworkService.selectHomeworkList(TH.getHWCode());
		model.addAttribute("slist", slist);
		model.addAttribute("hlist", hlist);
		model.addAttribute("TH", TH);
		model.addAttribute("className", className);
		return "admin_teacher/teacher/testHW/hwDetailView";
	}
	@RequestMapping("thwfdown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request,
			@RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName) {
		// 파일 다운 메소드는 리턴타입이 ModelAndView로 정해저 있음

		String savePath = request.getSession().getServletContext().getRealPath("resources/SH_upfiles");

		// 저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
		File renameFile = new File(savePath + "\\" + renameFileName);
		// 파일 다운시 브라우저 내보낼 원래 파일이름에 대한 파일 객체 생성함
		File originFile = new File(originalFileName);

		// 파일 다운로드용 뷰로 전달할 정보 저장 처리
		// component로 지정한 뷰클래스의 id명
		mv.setViewName("filedown"); // 등록된 파일 다운로드용 뷰클래스의 id명
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);

		return mv;
	}
	@RequestMapping(value="ThomeworkResultList.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectTHomeworkResultList(@RequestParam("teacherCode") String teacherCode,
			@RequestParam(name = "page", required = false) String page, 
			@RequestParam(name = "limit", required = false) String slimit, 
			@RequestParam("classCode") String classCode, Model model) {
		
		model.addAttribute("classCode", classCode);
		model.addAttribute("teacherCode", teacherCode);
		if(classCode != null) {
			int currentPage = 1;
	        if (page != null) {
	           currentPage = Integer.parseInt(page);
	        }
	        int limit = 10;
	        if (slimit != null) {
	           limit = Integer.parseInt(slimit);
	           }
			int listCount =  ths.selectTHomeworkViewCount(classCode);
	        // 페이지 관련 항목 계산처리
			 Paging paging = new Paging(listCount, currentPage, limit, "ThomeworkList.do");
		     paging.calculator();
		     Search search = new Search();
		     search.setStartRow(paging.getStartRow());
		   	 search.setEndRow(paging.getEndRow());
		   	 search.setKeyword(classCode);
		   	
		   	 ArrayList<THomework> list = ths.selectTHomeworkPagingView(search);
		   	 model.addAttribute("list", list);
			 model.addAttribute("paging", paging);
			 model.addAttribute("currentPage", currentPage);
			 model.addAttribute("limit", limit); 
			 
		}
		ArrayList<TTest> ttlist = tts.selectsubClass(classCode);
		String className = null;
		for (TTest t : ttlist) {
			className = t.getClassName();
		}
		ArrayList<TTest> clist = tts.selectClassMethod(teacherCode);
		model.addAttribute("clist", clist);
		
		model.addAttribute("className", className);
		
		return "admin_teacher/teacher/testHW/hw_classList";
	}
	
	@RequestMapping(value="thwresultCheck.do", method=RequestMethod.POST)
	public String thwresultCheckView(Homework hw, @RequestParam("className") String className,Model model) {
		Homework shw = homeworkService.selectSHWMethod(hw);
		THomework th = ths.selectTHWMethod(hw.getHWCode());
		String studentName = hw.getStudentName();
		String title = th.getTHWTitle();
		model.addAttribute("className", className);
		model.addAttribute("hw", shw);
		model.addAttribute("title", title);
		model.addAttribute("studentName", studentName);
		return "admin_teacher/teacher/testHW/hw_result";
	}
	@RequestMapping(value="updatehwresult.do", method=RequestMethod.POST)
	public String updatehwresultMethod(Homework hw, @RequestParam("className") String className,Model model) {
		homeworkService.updatehwresultMethod(hw);
		THomework TH = ths.selectTHWMethod(hw.getHWCode());
		model.addAttribute("classCode", TH.getClassCode());
		model.addAttribute("HWCode", TH.getHWCode());
		model.addAttribute("className", className);
		return "redirect:hwDetailView.do";
	}
}






















