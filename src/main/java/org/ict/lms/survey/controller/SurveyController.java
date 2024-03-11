package org.ict.lms.survey.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.course.model.service.CourseService;
import org.ict.lms.course.model.vo.Course;
import org.ict.lms.student.model.service.StudentService;
import org.ict.lms.student.model.vo.Student;
import org.ict.lms.survey.model.service.SurveyService;
import org.ict.lms.survey.model.vo.ChartSurvey;
import org.ict.lms.survey.model.vo.ResultSurvey;
import org.ict.lms.survey.model.vo.StartSurvey;
import org.ict.lms.survey.model.vo.Survey;
import org.ict.lms.tTest.model.service.TTestService;
import org.ict.lms.tTest.model.vo.TTest;
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
public class SurveyController {

	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);

	@Autowired
	private SurveyService surveyService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private TTestService tts;

	@Autowired
	private CourseService courseService;

	// View로 직행
	@RequestMapping("enrollsurvey.do")
	public String gotoviewEnrollSurvey() {
		return "survey/enroll_survey";
	}

	// View로 직행 아님
	@RequestMapping("selectsurvey.do")
	public String gotoviewViewSurvey(Model model, @RequestParam(name = "page", required = false) String page) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);

		}

		// 한페이지에 목록 10개씩 출력되게 한다면
		int limit = 10;
		// 회원 목록 전체 갯수 조회해 옴
		int listCount = 0;

		listCount = surveyService.selectSurveyListCount();

		Paging paging = new Paging(listCount, currentPage, limit, "selectsurvey.do");
		paging.calculator(); // 페이징에 필요한 항목들 계산 처리

		ArrayList<Survey> slist = surveyService.selectSurveyList(paging);
		ArrayList<TTest> tlist = tts.selectClassMethod1();

		model.addAttribute("tlist", tlist);
		model.addAttribute("slist", slist);
		model.addAttribute("paging", paging);

		return "survey/view_survey";
	}

	@RequestMapping(value = "delsurvey.do")
	public String deleteSurvey(@RequestParam(name = "survey_cate") String surv_cate) {

		surveyService.deleteSurvey(surv_cate);

		return "redirect:/selectsurvey.do";
	}

	@RequestMapping(value = "insertSurvey.do", method = RequestMethod.POST)
	public String insertEnrollSurvey(@RequestParam(name = "survfacility", required = false) String[] facility,
			@RequestParam(name = "survteacher", required = false) String[] teacher,
			@RequestParam(name = "survetc", required = false) String[] survetc,
			@RequestParam(name = "surveycate") String surveycate) {

		Survey surv = new Survey();

		// 시설 설문 등록
		surv.setSurvey_no(surveyService.selectMaxNo() + 1);
		surv.setSurvey_cate(surveycate);
		surv.setSurvey_type("시설");

		for (int i = 0; i < facility.length; i++) {

			if (i == 0) {
				surv.setSurvey1(facility[i]);
			} else if (i == 1) {
				surv.setSurvey2(facility[i]);
			} else if (i == 2) {
				surv.setSurvey3(facility[i]);
			} else if (i == 3) {
				surv.setSurvey4(facility[i]);
			} else if (i == 4) {
				surv.setSurvey5(facility[i]);
			}
		}

		surveyService.insertSurvey(surv);

		surv.setSurvey_type("교사");

		for (int i = 0; i < teacher.length; i++) {

			if (i == 0) {
				surv.setSurvey1(teacher[i]);
			} else if (i == 1) {
				surv.setSurvey2(teacher[i]);
			} else if (i == 2) {
				surv.setSurvey3(teacher[i]);
			} else if (i == 3) {
				surv.setSurvey4(teacher[i]);
			} else if (i == 4) {
				surv.setSurvey5(teacher[i]);
			}
		}

		surveyService.insertSurvey(surv);

		surv.setSurvey_type("기타");

		for (int i = 0; i < survetc.length; i++) {

			if (i == 0) {
				surv.setSurvey1(survetc[i]);
			} else if (i == 1) {
				surv.setSurvey2(survetc[i]);
			} else if (i == 2) {
				surv.setSurvey3(survetc[i]);
			} else if (i == 3) {
				surv.setSurvey4(survetc[i]);
			} else if (i == 4) {
				surv.setSurvey5(survetc[i]);
			}
		}

		surveyService.insertSurvey(surv);

		return "redirect:/selectsurvey.do";
	}

	@RequestMapping("selectsurvCateSurvey.do")
	public String selectSurvCateSurveyMethod(Model model, @RequestParam(name = "survey_cate") String surv_cate) {

		ArrayList<Survey> slist = surveyService.selectSurveyList(surv_cate);

		int facilityCount = 0;
		int teacherCount = 0;
		int etcCount = 0;

		for (int i = 0; i < slist.size(); i++) {
			if (slist.get(i).getSurvey_type().equals("시설")) {
				if (slist.get(i).getSurvey1() != null) {
					facilityCount++;
				}

				if (slist.get(i).getSurvey2() != null) {
					facilityCount++;
				}

				if (slist.get(i).getSurvey3() != null) {
					facilityCount++;
				}

				if (slist.get(i).getSurvey4() != null) {
					facilityCount++;
				}

				if (slist.get(i).getSurvey5() != null) {
					facilityCount++;
				}
			}

			if (slist.get(i).getSurvey_type().equals("교사")) {
				if (slist.get(i).getSurvey1() != null) {
					teacherCount++;
				}

				if (slist.get(i).getSurvey2() != null) {
					teacherCount++;
				}

				if (slist.get(i).getSurvey3() != null) {
					teacherCount++;
				}

				if (slist.get(i).getSurvey4() != null) {
					teacherCount++;
				}

				if (slist.get(i).getSurvey5() != null) {
					teacherCount++;
				}
			}

			if (slist.get(i).getSurvey_type().equals("기타")) {
				if (slist.get(i).getSurvey1() != null) {
					etcCount++;
				}

				if (slist.get(i).getSurvey2() != null) {
					etcCount++;
				}

				if (slist.get(i).getSurvey3() != null) {
					etcCount++;
				}

				if (slist.get(i).getSurvey4() != null) {
					etcCount++;
				}

				if (slist.get(i).getSurvey5() != null) {
					etcCount++;
				}
			}
		}

		model.addAttribute("facilityCount", facilityCount);
		model.addAttribute("teacherCount", teacherCount);
		model.addAttribute("etcCount", etcCount);
		model.addAttribute("slist", slist);

		return "survey/update_survey";
	}

	@RequestMapping(value = "updateSurvey.do", method = RequestMethod.POST)
	public String updateSurveyMethod(@RequestParam(name = "survfacility", required = false) String[] facility,
			@RequestParam(name = "survteacher", required = false) String[] teacher,
			@RequestParam(name = "survetc", required = false) String[] survetc,
			@RequestParam(name = "surveycate") String surveycate) {

		Survey surv = new Survey();
		surv.setSurvey_cate(surveycate);
		surv.setSurvey_type("시설");

		// 시설 설문 수정

		for (int i = 0; i < facility.length; i++) {

			if (i == 0) {
				surv.setSurvey1(facility[i]);
			} else if (i == 1) {
				surv.setSurvey2(facility[i]);
			} else if (i == 2) {
				surv.setSurvey3(facility[i]);
			} else if (i == 3) {
				surv.setSurvey4(facility[i]);
			} else if (i == 4) {
				surv.setSurvey5(facility[i]);
			}
		}

		surveyService.updateSurvey(surv);

		surv.setSurvey_type("교사");

		for (int i = 0; i < teacher.length; i++) {

			if (i == 0) {
				surv.setSurvey1(teacher[i]);
			} else if (i == 1) {
				surv.setSurvey2(teacher[i]);
			} else if (i == 2) {
				surv.setSurvey3(teacher[i]);
			} else if (i == 3) {
				surv.setSurvey4(teacher[i]);
			} else if (i == 4) {
				surv.setSurvey5(teacher[i]);
			}
		}

		surveyService.updateSurvey(surv);

		surv.setSurvey_type("기타");

		for (int i = 0; i < survetc.length; i++) {

			if (i == 0) {
				surv.setSurvey1(survetc[i]);
			} else if (i == 1) {
				surv.setSurvey2(survetc[i]);
			} else if (i == 2) {
				surv.setSurvey3(survetc[i]);
			} else if (i == 3) {
				surv.setSurvey4(survetc[i]);
			} else if (i == 4) {
				surv.setSurvey5(survetc[i]);
			}
		}

		surveyService.updateSurvey(surv);

		return "redirect:/selectsurvey.do";
	}

	@RequestMapping(value = "startSurvey.do", method = RequestMethod.POST)
	public String startSurvey(StartSurvey startSurv) {

		ArrayList<Student> slist = studentService.selectStudentList(startSurv.getClass_code());

		for (int i = 0; i < slist.size(); i++) {

			startSurv.setStudent_code(slist.get(i).getStudentCode());

			surveyService.insertStartSurvey(startSurv);
		}

		return "redirect:/selectsurvey.do";
	}

	@RequestMapping("studentsurvey.do")
	public String studentSurvey(HttpSession session, Model model,
			@RequestParam(name = "page", required = false) String page) {

		Student st = (Student) session.getAttribute("student");

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);

		}

		// 한페이지에 목록 10개씩 출력되게 한다면
		int limit = 10;
		// 회원 목록 전체 갯수 조회해 옴
		int listCount = 0;

		listCount = surveyService.selectStudentSurveyListCount(st.getStudentCode());

		Search search = new Search();
		search.setKeyword(st.getStudentCode());

		Paging paging = new Paging(listCount, currentPage, limit, "studentsurvey.do");
		paging.calculator(); // 페이징에 필요한 항목들 계산 처리

		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());

		ArrayList<Survey> slist = surveyService.selectStudentSurveyList(search);

		model.addAttribute("slist", slist);
		model.addAttribute("paging", paging);

		return "survey/student_survey";
	}

	@RequestMapping("writesurvey.do")
	public String writeSurvey(@RequestParam("survey_cate") String surv_cate, Model model) {

		ArrayList<Survey> slist = surveyService.selectSurveyList(surv_cate);

		int facilityCount = 0;
		int teacherCount = 0;
		int etcCount = 0;

		for (int i = 0; i < slist.size(); i++) {
			if (slist.get(i).getSurvey_type().equals("시설")) {
				if (slist.get(i).getSurvey1() != null) {
					facilityCount++;
				}

				if (slist.get(i).getSurvey2() != null) {
					facilityCount++;
				}

				if (slist.get(i).getSurvey3() != null) {
					facilityCount++;
				}

				if (slist.get(i).getSurvey4() != null) {
					facilityCount++;
				}

				if (slist.get(i).getSurvey5() != null) {
					facilityCount++;
				}
			}

			if (slist.get(i).getSurvey_type().equals("교사")) {
				if (slist.get(i).getSurvey1() != null) {
					teacherCount++;
				}

				if (slist.get(i).getSurvey2() != null) {
					teacherCount++;
				}

				if (slist.get(i).getSurvey3() != null) {
					teacherCount++;
				}

				if (slist.get(i).getSurvey4() != null) {
					teacherCount++;
				}

				if (slist.get(i).getSurvey5() != null) {
					teacherCount++;
				}
			}

			if (slist.get(i).getSurvey_type().equals("기타")) {
				if (slist.get(i).getSurvey1() != null) {
					etcCount++;
				}

				if (slist.get(i).getSurvey2() != null) {
					etcCount++;
				}

				if (slist.get(i).getSurvey3() != null) {
					etcCount++;
				}

				if (slist.get(i).getSurvey4() != null) {
					etcCount++;
				}

				if (slist.get(i).getSurvey5() != null) {
					etcCount++;
				}
			}
		}

		model.addAttribute("facilityCount", facilityCount);
		model.addAttribute("teacherCount", teacherCount);
		model.addAttribute("etcCount", etcCount);
		model.addAttribute("slist", slist);

		return "survey/write_survey";
	}

	@RequestMapping(value = "enrollsurveyresult.do", method = RequestMethod.POST)
	public String enrollSurveyResult(HttpSession session,
			@RequestParam(name = "fscore1", required = false) String fscore1,
			@RequestParam(name = "fscore2", required = false) String fscore2,
			@RequestParam(name = "fscore3", required = false) String fscore3,
			@RequestParam(name = "fscore4", required = false) String fscore4,
			@RequestParam(name = "fscore5", required = false) String fscore5,
			@RequestParam(name = "tscore1", required = false) String tscore1,
			@RequestParam(name = "tscore2", required = false) String tscore2,
			@RequestParam(name = "tscore3", required = false) String tscore3,
			@RequestParam(name = "tscore4", required = false) String tscore4,
			@RequestParam(name = "tscore5", required = false) String tscore5,
			@RequestParam(name = "escore1", required = false) String escore1,
			@RequestParam(name = "escore2", required = false) String escore2,
			@RequestParam(name = "escore3", required = false) String escore3,
			@RequestParam(name = "escore4", required = false) String escore4,
			@RequestParam(name = "escore5", required = false) String escore5,
			@RequestParam("survey_cate") String survcate, @RequestParam("survey_no") String survno,
			@RequestParam("divfScoreCount") int facilityCount, @RequestParam("divtScoreCount") int teacherCount,
			@RequestParam("diveScoreCount") int etcCount) {

		Student st = (Student) session.getAttribute("student");
		ResultSurvey rs = new ResultSurvey();
		rs.setSurvey_no(survno);
		rs.setSurvey_cate(survcate);
		rs.setClass_code(st.getClass_Code());
		rs.setStudent_code(st.getStudentCode());
		
		
		surveyService.updateStatus(rs);


		if (st != null) {

			// 시설
			rs.setSurvey_type("시설");

			for (int i = 0; i < facilityCount; i++) {

				if (i == 0) {
					rs.setAnswer1(fscore1);
				} else if (i == 1) {
					rs.setAnswer2(fscore2);
				} else if (i == 2) {
					rs.setAnswer3(fscore3);
				} else if (i == 3) {
					rs.setAnswer4(fscore4);
				} else if (i == 4) {
					rs.setAnswer5(fscore5);
				}
			}

			surveyService.insertResultSurvey(rs);

			// 교사
			rs.setSurvey_type("교사");
			for (int i = 0; i < teacherCount; i++) {

				if (i == 0) {
					rs.setAnswer1(tscore1);
				} else if (i == 1) {
					rs.setAnswer2(tscore2);
				} else if (i == 2) {
					rs.setAnswer3(tscore3);
				} else if (i == 3) {
					rs.setAnswer4(tscore4);
				} else if (i == 4) {
					rs.setAnswer5(tscore5);
				}
			}

			surveyService.insertResultSurvey(rs);

			// 기타
			rs.setSurvey_type("기타");
			for (int i = 0; i < teacherCount; i++) {

				if (i == 0) {
					rs.setAnswer1(tscore1);
				} else if (i == 1) {
					rs.setAnswer2(tscore2);
				} else if (i == 2) {
					rs.setAnswer3(tscore3);
				} else if (i == 3) {
					rs.setAnswer4(tscore4);
				} else if (i == 4) {
					rs.setAnswer5(tscore5);
				}
			}

			surveyService.insertResultSurvey(rs);
		}

		return "redirect:/studentsurvey.do";
	}

	@RequestMapping("resultsurvey.do")
	public String resultSurvey(Model model) {

		ArrayList<Course> tlist = courseService.selectCouresName();

		model.addAttribute("tlist", tlist);

		return "survey/result_survey";
	}

	@RequestMapping(value = "selectsurvcate.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectSurvCate(HttpServletResponse response, @RequestParam("keyword") String classcode)
			throws UnsupportedEncodingException {

		ArrayList<ResultSurvey> rs = surveyService.selectSurveyCate(classcode);

		// response에 내보낼 값에 대한 mimiType 설정(문자열값이 아닌 경우 반드시)
		response.setContentType("application/json; charset=utf-8");

		// 리턴된 list 결과를 json 배열에 담아서 내보내는 처리 :
		// 전송용 json객체 생성
		JSONObject sendJson = new JSONObject();
		// list 담을 json 배열 객체 생성
		JSONArray jarr = new JSONArray();

		// list를 json 배열에 옮기기
		for (ResultSurvey resultSurvey : rs) {
			// notice 값을 저장할 json 객체 생성
			JSONObject job = new JSONObject();

			// 문자열 값에 한글이 있다면
			job.put("surv_no", resultSurvey.getSurvey_no());
			job.put("surv_cate", URLEncoder.encode(resultSurvey.getSurvey_cate(), "utf-8"));

			// jarr에 job 저장함
			jarr.add(job);
		}

		// 전송용 객체 jarr 저장
		sendJson.put("catelist", jarr);

		return sendJson.toJSONString();
	}

	@RequestMapping(value = "selectchartdata.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectChart(HttpServletResponse response, @RequestParam("keyword") String keyword, @RequestParam("type") String type) {

		ArrayList<ChartSurvey> rs = null;
		
		if(type.equals("시설")) {
			rs = surveyService.selectFacilityChart(keyword);
		} else if(type.equals("교사")) {
			rs = surveyService.selectTeacherChart(keyword);
		} else if(type.equals("기타")) {
			rs = surveyService.selectEtcChart(keyword);
		}
			

				
		String s1 = rs.get(0).getSurvey1();
		String s2 = rs.get(0).getSurvey2();
		String s3 = rs.get(0).getSurvey3();
		String s4 = rs.get(0).getSurvey4();
		String s5 = rs.get(0).getSurvey5();

		int total = rs.size();

		int a1one = (int) rs.stream().filter(survey -> survey.getAnswer1().equals("1")).count();
		int a1two = (int) rs.stream().filter(survey -> survey.getAnswer1().equals("2")).count();
		int a1three = (int) rs.stream().filter(survey -> survey.getAnswer1().equals("3")).count();
		int a1four = (int) rs.stream().filter(survey -> survey.getAnswer1().equals("4")).count();
		int a1five = (int) rs.stream().filter(survey -> survey.getAnswer1().equals("5")).count();

		int a2one = (int) rs.stream().filter(survey -> survey.getAnswer2().equals("1")).count();
		int a2two = (int) rs.stream().filter(survey -> survey.getAnswer2().equals("2")).count();
		int a2three = (int) rs.stream().filter(survey -> survey.getAnswer2().equals("3")).count();
		int a2four = (int) rs.stream().filter(survey -> survey.getAnswer2().equals("4")).count();
		int a2five = (int) rs.stream().filter(survey -> survey.getAnswer2().equals("5")).count();

		int a3one = (int) rs.stream().filter(survey -> survey.getAnswer3().equals("1")).count();
		int a3two = (int) rs.stream().filter(survey -> survey.getAnswer3().equals("2")).count();
		int a3three = (int) rs.stream().filter(survey -> survey.getAnswer3().equals("3")).count();
		int a3four = (int) rs.stream().filter(survey -> survey.getAnswer3().equals("4")).count();
		int a3five = (int) rs.stream().filter(survey -> survey.getAnswer3().equals("5")).count();

		int a4one = (int) rs.stream().filter(survey -> survey.getAnswer4().equals("1")).count();
		int a4two = (int) rs.stream().filter(survey -> survey.getAnswer4().equals("2")).count();
		int a4three = (int) rs.stream().filter(survey -> survey.getAnswer4().equals("3")).count();
		int a4four = (int) rs.stream().filter(survey -> survey.getAnswer4().equals("4")).count();
		int a4five = (int) rs.stream().filter(survey -> survey.getAnswer4().equals("5")).count();

		int a5one = (int) rs.stream().filter(survey -> survey.getAnswer5().equals("1")).count();
		int a5two = (int) rs.stream().filter(survey -> survey.getAnswer5().equals("2")).count();
		int a5three = (int) rs.stream().filter(survey -> survey.getAnswer5().equals("3")).count();
		int a5four = (int) rs.stream().filter(survey -> survey.getAnswer5().equals("4")).count();
		int a5five = (int) rs.stream().filter(survey -> survey.getAnswer5().equals("5")).count();

		JSONObject job = new JSONObject();
		//1번문제, 답평균
		JSONArray question1Values = new JSONArray();
		question1Values.add((int)(a1one * 100 / total));
		question1Values.add((int)(a1two * 100 / total));
		question1Values.add((int)(a1three * 100 / total));
		question1Values.add((int)(a1four * 100 / total));
		question1Values.add((int)(a1five * 100 / total));
		job.put("q1", s1);
		job.put("a1", question1Values);
		
		//2번문제, 답평균
		JSONArray question2Values = new JSONArray();
		question2Values.add((int)(a2one * 100 / total));
		question2Values.add((int)(a2two * 100 / total));
		question2Values.add((int)(a2three * 100 / total));
		question2Values.add((int)(a2four * 100 / total));
		question2Values.add((int)(a2five * 100 / total));
		job.put("q2", s2);
		job.put("a2", question2Values);
		
		JSONArray question3Values = new JSONArray();
		question3Values.add((int)(a3one * 100 / total));
		question3Values.add((int)(a3two * 100 / total));
		question3Values.add((int)(a3three * 100 / total));
		question3Values.add((int)(a3four * 100 / total));
		question3Values.add((int)(a3five * 100 / total));
		job.put("q3", s3);
		job.put("a3", question3Values);
		
		JSONArray question4Values = new JSONArray();
		question4Values.add((int)(a4one * 100 / total));
		question4Values.add((int)(a4two * 100 / total));
		question4Values.add((int)(a4three * 100 / total));
		question4Values.add((int)(a4four * 100 / total));
		question4Values.add((int)(a4five * 100 / total));
		job.put("q4", s4);
		job.put("a4", question4Values);
		
		JSONArray question5Values = new JSONArray();
		question5Values.add((int)(a5one * 100 / total));
		question5Values.add((int)(a5two * 100 / total));
		question5Values.add((int)(a5three * 100 / total));
		question5Values.add((a5four * 100 / total));
		question5Values.add((a5five * 100 / total));
		job.put("q5", s5);
		job.put("a5", question5Values);
				
		return job.toJSONString();
	}
}
