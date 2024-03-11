package org.ict.lms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.ict.lms.article.model.service.ArticleService;
import org.ict.lms.article.model.vo.Article;
import org.ict.lms.common.MailHandler;
import org.ict.lms.common.service.CommonMailService;
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
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CommonMailService commonMailService;
	
	//index포워드
	@RequestMapping("mainpage.do")
	public String forwardMainView() {	
		return "common/main"; // 내보낼 뷰파일명 리턴
	}
	
	//교사 운영자 로그인페이지 이동
	@RequestMapping("adminlogin.do")
	public String atloginView() {	
		return "common/admin_login"; // 내보낼 뷰파일명 리턴
	}
	
	//훈련생 로그인페이지 이동
	@RequestMapping("studentLogin.do")
	public String sloginView() {	
		return "common/student_login"; // 내보낼 뷰파일명 리턴
	}
	//훈련생 로그인페이지 이동
	@RequestMapping("studentMain.do")
	public String sMainPageView(Model model) {
		
		ArrayList<Article> cateOfFirst = articleService.selectFirstCate();
		ArrayList<Article> cateOfSecond = articleService.selectSecondCate();
		ArrayList<Article> cateOfThird = articleService.selectThirdCate();
		ArrayList<Article> cateOfFourth = articleService.selectFourthCate();
		ArrayList<Article> cateOfFifth = articleService.selectFifthCate();
		
		ArrayList<Article> cateList = articleService.selectArticleCategory();
		
		model.addAttribute("cateOfFirst", cateOfFirst);
		model.addAttribute("cateOfSecond", cateOfSecond);
		model.addAttribute("cateOfThird", cateOfThird);
		model.addAttribute("cateOfFourth", cateOfFourth);
		model.addAttribute("cateOfFifth", cateOfFifth);
		model.addAttribute("cateList", cateList);
		
		return "student/student_main";
	}
	//(로그인 임시)운영자 교사 메인페이지이동
	@RequestMapping("atmain.do")
	public String ATMainPageView(Model model) {
		
		ArrayList<Article> cateOfFirst = articleService.selectFirstCate();
		ArrayList<Article> cateOfSecond = articleService.selectSecondCate();
		ArrayList<Article> cateOfThird = articleService.selectThirdCate();
		ArrayList<Article> cateOfFourth = articleService.selectFourthCate();
		ArrayList<Article> cateOfFifth = articleService.selectFifthCate();
		
		ArrayList<Article> cateList = articleService.selectArticleCategory();
		
		model.addAttribute("cateOfFirst", cateOfFirst);
		model.addAttribute("cateOfSecond", cateOfSecond);
		model.addAttribute("cateOfThird", cateOfThird);
		model.addAttribute("cateOfFourth", cateOfFourth);
		model.addAttribute("cateOfFifth", cateOfFifth);
		model.addAttribute("cateList", cateList);
		
		return "admin_teacher/admin_main"; // 내보낼 뷰파일명 리턴
	}

	
	@RequestMapping("hw_result.do")
	public String hwresultSide() {	
		return "admin_teacher/teacher/testHW/hw_result"; // 내보낼 뷰파일명 리턴
	}
	
	
	@RequestMapping(value = "mail.do", method = RequestMethod.POST)
	@ResponseBody
	public String sendEmail(HttpServletResponse response,
			@RequestParam("email") String email) throws Exception {
		response.setContentType("application/json; charset=utf-8");
		JSONObject sendJson = new JSONObject();
		
		String Token = MailHandler.generateRandomString(10);		
		String addr = "keumhyeonoo@gmail.com";		
		String subject = "보안 인증 알림메일입니다.";		
		String body = "보안 인증을 위한 토큰입니다.\r\n" + Token + "\r\n웹 페이지에 보안인증토큰을 입력해주세요. ";
		
		commonMailService.sendEmail(email, addr, subject, body);
		
		sendJson.put("Token", Token);
		
		return sendJson.toJSONString();
	}
	

	
	@RequestMapping("test_graph.do")
	public String testgraphSide() {	
		return "admin_teacher/teacher/testHW/test_graph"; // 내보낼 뷰파일명 리턴
	}

}
