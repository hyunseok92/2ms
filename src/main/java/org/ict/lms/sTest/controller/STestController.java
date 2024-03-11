package org.ict.lms.sTest.controller;

import java.util.ArrayList;
import java.util.List;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.sTest.model.service.STestService;
import org.ict.lms.sTest.model.vo.STest;
import org.ict.lms.student.model.service.StudentService;
import org.ict.lms.student.model.vo.Student;
import org.ict.lms.tTest.model.service.TTestService;
import org.ict.lms.tTest.model.vo.TTest;
import org.ict.lms.test.controller.TestController;
import org.ict.lms.test.model.service.TestService;
import org.ict.lms.test.model.vo.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class STestController {
	
	@Autowired
	private STestService sts;
	
	@Autowired
	private TTestService tts;
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private StudentService studentService;
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping("sTestView.do")
	public String selectStestView(@RequestParam("studentCode") String studentCode, Model model,@RequestParam(name = "page", required = false) String page,
            @RequestParam(name = "limit", required = false) String slimit) {
		int currentPage = 1;
        if (page != null) {
           currentPage = Integer.parseInt(page);
        }
        String classCode = sts.selectStestView(studentCode);
        int limit = 10;
        if (slimit != null) {
           limit = Integer.parseInt(slimit);
           }
		int listCount =  tts.selectTtestViewCount(classCode);
        // 페이지 관련 항목 계산처리
		ArrayList<STest> slist = sts.selectStestTestCode(studentCode);
		
        Paging paging = new Paging(listCount, currentPage, limit, "sTestView.do");
        paging.calculator();
        Search search = new Search();
 		search.setStartRow(paging.getStartRow());
 		search.setEndRow(paging.getEndRow());
 		search.setKeyword(classCode);
 		String action = "studentCode";
		ArrayList<TTest> list = tts.selectTtestView(search);
		model.addAttribute("list", list);
		model.addAttribute("slist", slist);
		model.addAttribute("paging", paging);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("limit", limit);
		model.addAttribute("action", action);
		model.addAttribute("keyword", studentCode);
		
		return "student/studentHT/studentTestView";
	}
	
	@RequestMapping(value="testComplate.do", method=RequestMethod.POST)
	public String insertTestComplateMethod(@RequestParam("testCode") String testCode,@RequestParam("studentCode") String studentCode, @RequestParam("testA") String testA, Model model, @RequestParam(name="testQ", required=false) String[] testQ) {
		logger.info(testA);
		ArrayList<Test> tlist = testService.selectMprodbMethod(testCode);
		TTest ttest = tts.selectTestCode(testCode);	
		int i = 0;
		if(ttest.getTestType().equals("객관식")) {
			String[] list = testA.split(",");
		int testScore = 0;
		
		for (Test test : tlist) {
			
			if(test.getTestRA().equals(list[i])){
				STest stest = new STest();
				testScore += test.getTestScore();
				String testYN = "Y";
				stest.setClassCode(sts.selectStestView(studentCode));
				stest.setStudentCode(studentCode);
				stest.setTestA(list[i]);
				stest.setTestNo(test.getTestNo());
				stest.setTestYN(testYN);
				stest.setTestCode(testCode);
				stest.setTestOK("Y");
				sts.insertSTestMprop(stest);
			}else {
				
				String testYN = "N";
				STest stest = new STest();
				stest.setClassCode(sts.selectStestView(studentCode));
				stest.setStudentCode(studentCode);
				stest.setTestA(list[i]);
				stest.setTestNo(test.getTestNo());
				stest.setTestYN(testYN);
				stest.setTestCode(testCode);
				stest.setTestOK("Y");
				sts.insertSTestMprop(stest);
			}
			i++;
		}
		
		STest finalStest = new STest();
		finalStest.setScoreSum(testScore);
		finalStest.setStudentCode(studentCode);
		finalStest.setTestCode(testCode);
		sts.updateSTestMpropSumScore(finalStest);
		model.addAttribute("message", "테스트 결과는 " + testScore + "점입니다.");
		}else {
			
			
	
			for (Test test : tlist) {
				
				STest stest = new STest();
				stest.setClassCode(sts.selectStestView(studentCode));
				stest.setStudentCode(studentCode);
				stest.setTestA(testQ[i]);
				stest.setTestNo(test.getTestNo());	
				stest.setTestCode(testCode);
				sts.insertSTestMprop(stest);
				i++;
				
				}
			
		}
		
		return "redirect:sTestView.do?studentCode=" + studentCode;
	}
	
	@RequestMapping(value="StestResult.do", method=RequestMethod.POST)
	public String StestResultView(TTest ttest, @RequestParam("studentCode") String studentCode, Model model) {
		STest stest = new STest();
		stest.setStudentCode(studentCode);
		stest.setTestCode(ttest.getTestCode());
		ArrayList<Test> tlist = testService.selectMprodbMethod(ttest.getTestCode());
		ArrayList<STest> slist = sts.selectStestResult(stest);
		model.addAttribute("ttest", ttest);
		model.addAttribute("tlist", tlist);
		model.addAttribute("slist", slist);
		
		logger.info("slist" + slist.get(0).toString());
		
		return "student/studentHT/studentTestResultView";
	}
	
	@RequestMapping(value="testResultStudentList.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String testResultStudentList(@RequestParam("className") String className,
			@RequestParam("testType") String testType,
			@RequestParam("subjectName") String subjectName,
			@RequestParam("testCode") String testCode,@RequestParam("classCode") String classCode, Model model) {
		ArrayList<Student> slist = studentService.selectStudentList(classCode);
		ArrayList<STest> stlist = sts.selectTestClearStudent(testCode);
		
		logger.info(String.valueOf(stlist.size()));
		
		model.addAttribute("slist", slist);
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("className", className);
		model.addAttribute("testType", testType);
		if(stlist.size() != 0) {
			int sum = 0;
			for (STest s : stlist) {
				sum += s.getScoreSum();
				logger.info(String.valueOf(sum));
			}
			int avg = sum / stlist.size();
		model.addAttribute("stlist", stlist);
		model.addAttribute("testAvg", avg);
		}
		
		return "admin_teacher/teacher/testHW/test_classResult";
	}
	
	@RequestMapping(value="markTest.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String selectMarkTestMethod(STest stest, @RequestParam("studentName") String studentName,
			@RequestParam("className") String className,
			@RequestParam("subjectName") String subjectName,Model model) {
		ArrayList<STest> stlist = sts.selectMarkTestMethod(stest);
		model.addAttribute("stlist", stlist);
		model.addAttribute("className", className);
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("studentName", studentName);
		model.addAttribute("studentCode", stest.getStudentCode());
		return "admin_teacher/teacher/testHW/markTestView";
	}
	
	@RequestMapping(value="markTestResult.do", method=RequestMethod.POST)
	public String updateMarkTestResult(@RequestParam("testYN")String[] testYN,
			@RequestParam("studentName") String studentName,
			@RequestParam("testNo")String[] testNo,
			@RequestParam("studentCode")String studentCode,
			@RequestParam("testCode")String testCode,
			@RequestParam("testScore")String[] testScore,
			@RequestParam("className") String className,
			@RequestParam("subjectName") String subjectName,Model model) {
		int scoreSum = 0;
		for(int i = 0; i < testNo.length; i++) {
			logger.info(testNo[i]);
			logger.info(testYN[i]);
			logger.info(testScore[i]);
			STest stest = new STest();
			if(testYN[i].equals("Y")) {
				scoreSum += Integer.parseInt(testScore[i]);
			}
				stest.setTestNo(Integer.parseInt(testNo[i]));
				stest.setTestYN(testYN[i]);
				stest.setStudentCode(studentCode);
				stest.setTestOK("Y");
				stest.setTestCode(testCode);
				sts.updateMarkTestResult(stest);
			
		}
		STest stest2 = new STest();
		stest2.setScoreSum(scoreSum);
		stest2.setStudentCode(studentCode);
		stest2.setTestCode(testCode);
		String classCode = sts.selectStestView(studentCode);
		TTest ttest = tts.selectTestCode(testCode);
		sts.updateSTestMpropSumScore(stest2);
		model.addAttribute("testCode", testCode);
		model.addAttribute("testType", ttest.getTestType());
		model.addAttribute("studentCode", studentCode);
		model.addAttribute("className", className);
		model.addAttribute("classCode", classCode);
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("studentName", studentName);
		
		return "redirect:testResultStudentList.do";
	}
	
}
