package org.ict.lms.tTest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.sTest.model.service.STestService;
import org.ict.lms.tTest.model.service.TTestService;
import org.ict.lms.tTest.model.vo.TTest;
import org.ict.lms.test.model.service.TestService;
import org.ict.lms.test.model.vo.Test;
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
public class TTestController {
	@Autowired
	private TTestService tts;
	
	@Autowired
	private STestService sts;
	
	@Autowired
	private TestService testService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("probView.do")
	public String probView(@RequestParam("testCode") String testCode, Model model) {
		TTest ttest = tts.selectTestCode(testCode);
		model.addAttribute("subjectcode", ttest.getSubjectCode());
		model.addAttribute("classname", ttest.getClassName());
		model.addAttribute("classcode", ttest.getClassName());
		model.addAttribute("subjectcode", ttest.getClassName());
		model.addAttribute("subjectname", ttest.getSubjectName());
		model.addAttribute("testcode", ttest.getTestCode());
		model.addAttribute("testtype", ttest.getTestType());
		model.addAttribute("startdate", ttest.getTestStartDate());
		model.addAttribute("enddate", ttest.getTestEndDate());
		
		ArrayList<TTest> alist = tts.selectAbility(ttest.getSubjectCode());
		model.addAttribute("alist", alist);

		return "admin_teacher/teacher/testHW/test_prob";
	}
	@RequestMapping("mProbView.do")
	public String mProbView(@RequestParam("testCode") String testCode,
			@RequestParam(name="sumScore", required=false)String sumScore, 
			@RequestParam(name="del", required=false)String del, Model model) {
		if(sumScore != null) {
			if(Integer.parseInt(sumScore) > 100) {
				model.addAttribute("message", "문제 추가 실패 ! 점수의 총 합은 100점입니다. 점수 설정을 다시 해 주세요.");
			}
		}if(del != null) {
			model.addAttribute("dmessage", "문제 삭제 완료.");
		}
		TTest ttest = tts.selectTestCode(testCode);
		model.addAttribute("subjectcode", ttest.getSubjectCode());
		model.addAttribute("classname", ttest.getClassName());
		model.addAttribute("classcode", ttest.getClassName());
		model.addAttribute("subjectcode", ttest.getClassName());
		model.addAttribute("subjectname", ttest.getSubjectName());
		model.addAttribute("testcode", ttest.getTestCode());
		model.addAttribute("testtype", ttest.getTestType());
		model.addAttribute("startdate", ttest.getTestStartDate());
		model.addAttribute("enddate", ttest.getTestEndDate());
		ArrayList<TTest> alist = tts.selectAbility(ttest.getSubjectCode());
		model.addAttribute("alist", alist);

		return "admin_teacher/teacher/testHW/test_Mprob";
	}
	
	
	
	@RequestMapping("selectClass.do")
	public String selectClassMethod(@RequestParam("teacherCode") String teacherCode, Model model) {
		logger.info(teacherCode);
		ArrayList<TTest> list = tts.selectClassMethod(teacherCode);
		model.addAttribute("list", list);
		return "admin_teacher/teacher/testHW/test_insert";
	}
	@RequestMapping(value="selecttestClassResult.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String testResult(@RequestParam("teacherCode") String teacherCode, Model model,@RequestParam(name="classCode", required=false) String classCode, 
			@RequestParam(name = "page", required = false) String page, 
			@RequestParam(name = "limit", required = false) String slimit, 
			HttpServletRequest request) {
		logger.info(teacherCode);
		ArrayList<TTest> rlist = tts.selectClassMethod(teacherCode);
		model.addAttribute("rlist", rlist);
		if(classCode != null) {
		int currentPage = 1;
        if (page != null) {
           currentPage = Integer.parseInt(page);
        }
        int limit = 10;
        if (slimit != null) {
           limit = Integer.parseInt(slimit);
           }
		int listCount =  tts.selectTtestViewCount(classCode);
        // 페이지 관련 항목 계산처리
		
		 Paging paging = new Paging(listCount, currentPage, limit, "selecttestClassResult.do");
	     paging.calculator();
	     Search search = new Search();
	     search.setStartRow(paging.getStartRow());
	   	 search.setEndRow(paging.getEndRow());
	   	 search.setKeyword(classCode);
	   	 
	   	 
	   	 
		 String action = "classCode";
		 ArrayList<TTest> list = tts.testResultClassList(search);
		 model.addAttribute("list", list);
		 model.addAttribute("paging", paging);
		 model.addAttribute("currentPage", currentPage);
		 model.addAttribute("limit", limit);
		 model.addAttribute("classCode", classCode);
		 model.addAttribute("action", action);
		 model.addAttribute("teacherCode", request.getParameter("teacherCode"));
		}
		return "admin_teacher/teacher/testHW/test_result";
	}
	
	@RequestMapping(value="SubClass.do", method = RequestMethod.POST)
	@ResponseBody
	public String subClassMethod(@RequestParam("classcode") String classCode) throws UnsupportedEncodingException {
				ArrayList<TTest> nlist = tts.selectsubClass(classCode);

				// 전송용 json 객체 준비
				JSONObject sendJson = new JSONObject();
				// list 저장할 json 배열 객체 준비
				JSONArray jarr = new JSONArray();

				// list 를 jarr로 옮기기
				for (TTest test : nlist) {
					JSONObject job = new JSONObject();
					
					job.put("subjectcode", URLEncoder.encode(test.getSubjectCode(), "utf-8"));
					job.put("classname", URLEncoder.encode(test.getClassName(), "utf-8"));
					
					job.put("classcode", URLEncoder.encode(test.getClassCode(), "utf-8"));
					// 한글에 대해서는 인코딩해서 json에 담음 (한글 깨짐 방지)
					job.put("subjectname", URLEncoder.encode(test.getSubjectName(), "utf-8"));
					// 날짜는 반드시 toString() 으로 문자열로 바꿔서 json에 담아야 함

					// job 를 jarr에 추가함
					jarr.add(job);
				}
				 
				// 전송용 객체에 jarr을 담음
				sendJson.put("nlist", jarr);
			
				return sendJson.toJSONString(); // 뷰리졸버로 리턴함
			
	}
		
	
	
	//만들어진 시험 목록 리스트를 불러옴
	@RequestMapping(value="selectOpenTest.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectOpenTestMethod(@RequestParam("subjectCode") String subjectCode) throws UnsupportedEncodingException {
		
				ArrayList<TTest> slist = tts.selectOpenTest(subjectCode);

				// 전송용 json 객체 준비
				JSONObject sendJson = new JSONObject();
				// list 저장할 json 배열 객체 준비
				JSONArray jarr = new JSONArray();

				// list 를 jarr로 옮기기
				if(slist != null) {
				for (TTest test : slist) {
					
					JSONObject job = new JSONObject();
					Test testCount = testService.selectLastProb(test.getTestCode());
					if(testService.selectLastProb(test.getTestCode()) != null) {
					job.put("testCount", testCount.getTestNo());
					}
					job.put("testCountYN", test.getTestCount());
					job.put("startDate", test.getTestStartDate().toString());
					job.put("endDate", test.getTestEndDate().toString());
					job.put("testType", URLEncoder.encode(test.getTestType(), "utf-8"));
					job.put("subjectcode", URLEncoder.encode(test.getSubjectCode(), "utf-8"));
					job.put("classcode", URLEncoder.encode(test.getClassCode(), "utf-8"));
					job.put("testCode", test.getTestCode());

					jarr.add(job);
				}
				
				 
				// 전송용 객체에 jarr을 담음
				sendJson.put("slist", jarr);
				}
				
				return sendJson.toJSONString(); // 뷰리졸버로 리턴함
				
	}
	
	@RequestMapping(value="insertTest.do", method=RequestMethod.POST)
	public String insertTestMethod(TTest ttest, Model model) {
		
		int result = tts.insertTTest(ttest);
		
		ttest.setTestCode(tts.selectLastTTest());
		if(ttest.getTestType().equals("객관식")) {
			String url = "redirect:probView.do?testCode=" + ttest.getTestCode();
			return url;
		}else {
			String url = "redirect:mProbView.do?testCode=" + ttest.getTestCode();
			return url;
		}	
	}
	
	@RequestMapping(value="updateTtest.do", method=RequestMethod.POST)
	public String updateTtestMethod(TTest ttest, Model model) {
		
		int result = tts.updateTTest(ttest);
		
		ttest.setTestCode(tts.selectLastTTest());
		if(ttest.getTestType().equals("객관식")) {
			String url = "redirect:probView.do?testCode=" + ttest.getTestCode();
			return url;
		}else {
			String url = "redirect:mProbView.do?testCode=" + ttest.getTestCode();
			return url;
		}	
	}
	
	//시험목록 삭제
	@RequestMapping(value="deleteTest.do", method=RequestMethod.POST)
	public void deleteTTestMethod(TTest ttest, HttpServletResponse response) throws IOException {
		if(sts.selectTestClearStudent(ttest.getTestCode()) != null) {
			
			sts.deleteSTestMethod(ttest.getTestCode());
		if(testService.selectMprodbMethod(ttest.getTestCode()) != null) {
			testService.deleteProps(ttest.getTestCode());
		}
		}
		int result = tts.deleteTTest(ttest);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//받은 결과에 따라 내보낼 데이터가 다르다면
		if(result == 1) {
			out.append("ok");
		}
		out.flush();
		
		out.close();
		
	}
	
	
}
