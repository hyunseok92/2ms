package org.ict.lms.homework.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.ict.lms.common.FileNameChange;
import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.homework.model.service.HomeworkService;
import org.ict.lms.homework.model.vo.Homework;
import org.ict.lms.sTest.model.service.STestService;
import org.ict.lms.tHomework.controller.THomeworkController;
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

@Controller
public class HomeworkController {
	private static final Logger logger = LoggerFactory.getLogger(HomeworkController.class);
	
	@Autowired
	private HomeworkService homeworkService;
	
	@Autowired
	private STestService sts;
	
	@Autowired
	private THomeworkService ths;
	
	@Autowired
	private TTestService tts;
	
	
	@RequestMapping(value="sHWView.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectTHomeworkList(@RequestParam("studentCode") String studentCode,
			@RequestParam(name = "page", required = false) String page, 
			@RequestParam(name = "limit", required = false) String slimit, 
			Model model) {
		String classCode = sts.selectStestView(studentCode);
		model.addAttribute("classCode", classCode);
		model.addAttribute("studentCode", studentCode);
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
			 Paging paging = new Paging(listCount, currentPage, limit, "sHWView.do");
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
		ArrayList<Homework> hlist = homeworkService.selectHomework(studentCode);
		
		ArrayList<TTest> ttlist = tts.selectsubClass(classCode);
		String className = null;
		for (TTest t : ttlist) {
			className = t.getClassName();
		}
		
		model.addAttribute("hlist", hlist);
		model.addAttribute("className", className);
		
		return "student/studentHT/studentHWList";
	}
	@RequestMapping("sHwDetailView.do")
	public String hwDetailView(@RequestParam("HWCode") String HWCode,@RequestParam("studentCode") String studentCode, @RequestParam("className") String className, Model model) {
		THomework TH = ths.selectTHWMethod(HWCode);
		model.addAttribute("studentCode", studentCode);
		model.addAttribute("TH", TH);
		model.addAttribute("className", className);
		Homework hw = new Homework();
		hw.setHWCode(HWCode);
		hw.setStudentCode(studentCode);
		hw = homeworkService.selectSHWMethod(hw);
		model.addAttribute("hw", hw);
		return "student/studentHT/studentHWDetailView";
	}
	
	@RequestMapping(value = "shwinsert.do", method = RequestMethod.POST)
	public String shwinsert(@RequestParam(name = "ofile", required = false) MultipartFile mfile, Homework hw,
			@RequestParam("classCode")String classCode,@RequestParam("className")String className,
			@RequestParam("teacherCode")String teacherCode, Model model, HttpServletRequest request) {
		
		hw.setHWRST("제출확인중");
		String savePath = request.getSession().getServletContext().getRealPath("resources/SH_upfiles");

		if (!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			if (fileName != null && fileName.length() > 0) {
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부파일명 확인 : " + fileName + "," + renameFileName);
				try {
					mfile.transferTo(new File(savePath + "\\" + renameFileName));

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일 저장 실패");
					
				}
			}

			hw.setSHWFile(fileName);
			hw.setSHWRFile(renameFileName);
		} 
		homeworkService.insertHomework(hw);
		model.addAttribute("studentCode", hw.getStudentCode());
		model.addAttribute("classCode", classCode);
		return "redirect:sHWView.do";
		
	}
	@RequestMapping("shwfdown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request,
			@RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName) {

		String savePath = request.getSession().getServletContext().getRealPath("resources/TH_upfiles");

		File renameFile = new File(savePath + "\\" + renameFileName);
		File originFile = new File(originalFileName);

		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);

		return mv;
	}
	@RequestMapping(value = "Shwupdate.do", method = RequestMethod.POST)
	public String SHUpdateMethod(HttpServletRequest request, Homework hw, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile,
			@RequestParam(name = "deleteFlag", required = false) String delFlag
			,@RequestParam("className")String className) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/TH_upfiles");
		
		if(hw.getSHWFile() != null && (delFlag != null && delFlag.equals("yes"))
				|| !mfile.isEmpty()) {
			new File(savePath + "\\" + hw.getSHWRFile()).delete();
			hw.setSHWFile(null);
			hw.setSHWRFile(null);
		}
		
		if (!mfile.isEmpty()) {
			if(hw.getSHWFile() != null) {
				new File(savePath + "\\" + hw.getSHWRFile()).delete();
			}
			
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			if (fileName != null && fileName.length() > 0) {
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부파일명 확인 : " + fileName + "," + renameFileName);
				try {
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();					
				}
			}
			hw.setSHWFile(fileName);
			hw.setSHWRFile(renameFileName);
		}
		homeworkService.updateSHomework(hw);
		String HWCode = hw.getHWCode();
		THomework TH = ths.selectTHWMethod(HWCode);
		model.addAttribute("studentCode", hw.getStudentCode());
		model.addAttribute("classCode", TH.getClassCode());
		model.addAttribute("HWCode", hw.getHWCode());
		model.addAttribute("className", className);		
		return "redirect:sHwDetailView.do";		
	}
	
	@RequestMapping(value="deleteSHW.do", method=RequestMethod.POST)
	public String deleteSHWMethod(Homework hw, @RequestParam(name="rfile", required=false) String renameFile, 
			HttpServletRequest request, @RequestParam("className")String className,Model model) {
		THomework TH = ths.selectTHWMethod(hw.getHWCode());
		if(homeworkService.deleteSHW(hw) > 0) {
			if(renameFile != null) {
				String savePath = request.getSession().getServletContext().getRealPath("resources/TH_upfiles");
				new File(savePath + "\\" + renameFile).delete();
			}
		}
		
		
		model.addAttribute("studentCode", hw.getStudentCode());
		model.addAttribute("classCode", TH.getClassCode());
		model.addAttribute("HWCode", hw.getHWCode());
		model.addAttribute("className", className);
		return "redirect:sHwDetailView.do";
	}
	
}

























