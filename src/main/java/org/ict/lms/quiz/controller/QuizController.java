package org.ict.lms.quiz.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.ict.lms.quiz.model.service.QuizService;
import org.ict.lms.quiz.model.vo.Quiz_a;
import org.ict.lms.quiz.model.vo.Quiz_q;
import org.ict.lms.student.model.vo.Student;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class QuizController {
	
	@Autowired
	private QuizService quizService;

	private static final Logger logger = LoggerFactory.getLogger(QuizController.class);
	
	//퀴즈 출제페이지 이동
	@RequestMapping("quiz.do")
	public String Quiz() {	
		return "quiz/quiz"; // 내보낼 뷰파일명 리턴
	}

	// 퀴즈 생성
	@RequestMapping(value="makeQuiz.do", method= RequestMethod.POST)
	 public ResponseEntity<String> makeQuizMethod(@RequestBody String param) throws ParseException {
		//post로 request body에 기록된 json 문자열을 꺼내서 param 변수에 저장하라는 처리임
	      //param에 저장된 json 문자열을 json 객체로 바꿈
		      JSONParser jparser = new JSONParser();
		      JSONObject job = (JSONObject)jparser.parse(param);
	      
	      //json 객체가 가진 각 필드(property) 값을 추출해서, vo 객체(Notice)에 저장
	      Quiz_q quiz_q = new Quiz_q();
	      quiz_q.setProf_code((String)job.get("prof_code"));
	      quiz_q.setQuiz_content((String)job.get("quiz_content"));
	      //새 퀴즈 추가	      
	      //ResponseEntity<T> : 클라이언트에게 응답하는 용도의 객체임
	      //뷰리졸버가 아닌 출력스트림으로 나감
	      if(quizService.insertQuiz(quiz_q) > 0) {
	         return new ResponseEntity<String>("success", HttpStatus.OK);
	      }else {
	         return new ResponseEntity<String>("failed", HttpStatus.REQUEST_TIMEOUT);
	      }
	}
	//퀴즈 풀이페이지 이동
	@RequestMapping(value = "quizreceive.do", method= {RequestMethod.GET ,RequestMethod.POST})
	public String QuizReceive(@RequestParam("student_code") String student_code, Model model) {	
		Quiz_q quiz_q = quizService.selectReceiveQuiz(student_code);
		if(quiz_q != null) {
			Quiz_a quiz_a = new Quiz_a();
			quiz_a.setQuiz_seq(quiz_q.getQuiz_seq());
			quiz_a.setStudent_code(student_code);
			Quiz_a quiz_a_answered = quizService.selectQuizAnswered(quiz_a);
			
			if(quiz_a_answered == null) {				
				model.addAttribute("quiz_q", quiz_q);
			} else {
				model.addAttribute("message", "이미 답변한 퀴즈입니다.");
			}			
		}else {
			model.addAttribute("message", "현재 진행중인 퀴즈가 없습니다.");
		}
		return "quiz/quiz_resolve";
	}
	// 퀴즈 풀이 전송
	@RequestMapping(value="quizresolve.do", method= RequestMethod.POST)
	public ResponseEntity<String> QuizResolve(@RequestBody String param) throws ParseException {
		System.out.println("컨트롤러 들어옴");
		
	      //param에 저장된 json 문자열을 json 객체로 바꿈
	      JSONParser jparser = new JSONParser();
	      JSONObject job = (JSONObject)jparser.parse(param);
	      
	      Quiz_a quiz_a = new Quiz_a();
	      quiz_a.setQuiz_seq(Integer.parseInt((String)job.get("quiz_seq")));
	      quiz_a.setStudent_code((String)job.get("student_code"));
	      quiz_a.setQuiz_answer((String)job.get("quiz_answer"));
		
		if(quizService.insertQuizAnswer(quiz_a) > 0) {
	         return new ResponseEntity<String>("success", HttpStatus.OK);
	      }else {
	         return new ResponseEntity<String>("failed", HttpStatus.REQUEST_TIMEOUT);
	      }
	}
	// 퀴즈 답변자 리스트 생성
	@RequestMapping(value="quizAnswerList.do", method= RequestMethod.POST)
	@ResponseBody
	 public String selectQuizAnswerList(HttpServletResponse response, @RequestBody String param) throws IOException, ParseException {
		//post로 request body에 기록된 json 문자열을 꺼내서 param 변수에 저장하라는 처리임
	      //param에 저장된 json 문자열을 json 객체로 바꿈
		      JSONParser jparser = new JSONParser();
		      JSONObject job = (JSONObject)jparser.parse(param);
		      response.setContentType("application/json; charset=utf-8");
	      
	      //json 객체가 가진 각 필드(property) 값을 추출해서, vo 객체(Notice)에 저장
	      Quiz_q quiz_q = new Quiz_q();
	      quiz_q.setProf_code((String)job.get("prof_code"));
	      quiz_q.setQuiz_content((String)job.get("quiz_content"));
	      
	      ArrayList<Student> list = quizService.selectQuizAnswerList(quiz_q);
	      
			// 전송용 json 객체 생성
			JSONObject sendJson = new JSONObject();
			// list를 담을 json 배열 객체 생성
			JSONArray jarr = new JSONArray();
			
			for(Student std : list) {
				JSONObject	sjob = new JSONObject();
				sjob.put("name", std.getName());		
				
				jarr.add(sjob);
			}
			sendJson.put("list", jarr);
	      
			return sendJson.toJSONString();
	}
	
	
}
