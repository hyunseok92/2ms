package org.ict.lms.test.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

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
public class TestController {
	@Autowired
	private TestService testService;
	
	@Autowired
	private TTestService tts;
	
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
		
	@RequestMapping(value = "insertProb.do", method = RequestMethod.POST)
	public String insertProbMethod(Test test, Model model, @RequestParam("sumScore") int sumScore) {
		
		sumScore = sumScore + test.getTestScore();

		if (sumScore <= 100) {
			Test last = testService.selectLastProb(test.getTestCode());

			int no = 0;
			if (last == null) {
				no = 1;
				test.setTestNo(no);
			} else {
				no = last.getTestNo();
				no = no + 1;
				test.setTestNo(no);
			}
			testService.insertProbMehod(test);
		} else {
			model.addAttribute("message", "문제 추가 실패 ! 점수의 총 합은 100점입니다. 점수 설정을 다시 해 주세요.");

		}
		String url = null;
		if(test.getTestQ1() == null) {
			url = "redirect:mProbView.do?testCode=" + test.getTestCode() + "&&sumScore=" + sumScore;
		}else {
			url = "redirect:probView.do?testCode=" + test.getTestCode() + "&&sumScore=" + sumScore;	
		}
		return url;

	}
	
	@RequestMapping(value="selectMprob.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectMprodbMethod(@RequestParam("testcode") String testCode) throws UnsupportedEncodingException {
		ArrayList<Test> list = testService.selectMprodbMethod(testCode);

		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 저장할 json 배열 객체 준비
		JSONArray jarr = new JSONArray();
		int sumScore = 0;
		// list 를 jarr로 옮기기
		for (Test test : list) {
			// notice 의 각 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			sumScore += test.getTestScore();
			job.put("testnol", test.getTestNo());
			job.put("testcodel", test.getTestCode());
			// 한글에 대해서는 인코딩해서 json에 담음 (한글 깨짐 방지)
			job.put("testabilityl", URLEncoder.encode(test.getAbility(), "utf-8"));
			// 날짜는 반드시 toString() 으로 문자열로 바꿔서 json에 담아야 함
			
			job.put("testql", URLEncoder.encode(test.getTestQ(), "utf-8"));
			if(test.getTestQ1() != null) {
				job.put("testq1l", URLEncoder.encode(test.getTestQ1(), "utf-8"));
				job.put("testq2l", URLEncoder.encode(test.getTestQ2(), "utf-8"));
				job.put("testq3l", URLEncoder.encode(test.getTestQ3(), "utf-8"));
				job.put("testq4l", URLEncoder.encode(test.getTestQ4(), "utf-8"));
			}
			
			job.put("testral", URLEncoder.encode(test.getTestRA(), "utf-8"));
			job.put("testscorel", test.getTestScore());
	
			// job 를 jarr에 추가함
			jarr.add(job);
		}
		
		// 전송용 객체에 jarr을 담음
		sendJson.put("list", jarr);
		sendJson.put("sumScore", sumScore);

		// 전송용 json을 json string 으로 밖쒀서 전송되게 함
		return sendJson.toJSONString(); // 뷰리졸버로 리턴함
		// servlet-context.xml 에 jsonString 내보내는 JSONView 라는 뷰리졸버를 추가 등록해야 함.
	}
	
	@RequestMapping("delMprop.do")
	public String deleteMprop(Test test, Model model){
		int last = testService.selectLastProb(test.getTestCode()).getTestNo();
		int result = testService.deleteMprop(test);
		if(test.getTestNo() != last) {
			for(int i = test.getTestNo() + 1; i <= last; i++) {
				Test test2 = new Test();
				test2.setTestCode(test.getTestCode());
				test2.setTestNo(i);
				testService.updateDTestNo(test2);
			}
		}
		String url = null;
		if(test.getTestQ1() == null) {
			url = "redirect:mProbView.do?testCode=" + test.getTestCode() + "&del=ok";
		}else {
			url = "redirect:probView.do?testCode=" + test.getTestCode() + "&del=ok";
		}
		return url;
		
	}
	@RequestMapping("updateMprop.do")
	public String updateMprop(Test test, Model model){
		int result = testService.updateMprop(test);
		

		String url = null;
		if(test.getTestQ1() == null) {
			url = "redirect:mProbView.do?testCode=" + test.getTestCode() + "&up=ok";
		}else {
			url = "redirect:probView.do?testCode=" + test.getTestCode() + "&up=ok";
		}
		return url;
	}
	
	@RequestMapping("MtestOpen.do")
	public String updateMtestOpenMethod(@RequestParam("testCode") String testCode, @RequestParam("teacherCode") String teacherCode, Model model) {
		int testCount = testService.selectLastProb(testCode).getTestNo();
		TTest ttest = new TTest();
		ttest.setTestCount(testCount);
		ttest.setTestCode(testCode);
		tts.updateTestCount(ttest);
		String url = "redirect:selectClass.do?teacherCode=" + teacherCode;
		return url;
	}
	
	@RequestMapping(value="testStart.do", method = RequestMethod.POST)
	public String testStartMethod(@RequestParam("testCode") String testCode, Model model) {
		ArrayList<Test> list = testService.selectMprodbMethod(testCode);
		String testType = tts.selectTestCode(testCode).getTestType();
		model.addAttribute("plist", list);
		model.addAttribute("testCode", testCode);
		if(!testType.equals("객관식")) {		
			return "student/studentHT/testStartProb";
		}else {
			return "student/studentHT/testStartMprob";
		}
	}
}
