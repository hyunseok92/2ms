package org.ict.lms.notice.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ict.lms.HomeController;
import org.ict.lms.common.Paging;
import org.ict.lms.notice.model.service.NoticeService;
import org.ict.lms.notice.model.vo.Notice;
import org.ict.lms.teacher.model.vo.Teacher;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("moveNoticeList.do")
	public String moveNoticeList(
			@RequestParam(name="page", required=false) String page, 
			@RequestParam(name="limit", required=false) String limitStr,
			Model model) {
		
		int currentPage = 1;
		
		if (page != null) {
			currentPage = Integer.parseInt(page);
		} 

		int limit = 10;
		if (limitStr != null) {
			limit = Integer.parseInt(limitStr);
		}

		int listCount = noticeService.selectListCount();
		Paging paging = new Paging(listCount, currentPage, limit, "moveNoticeList.do");
		paging.calculator();
		
		ArrayList<Notice> list = noticeService.selectList(paging);
		
		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);
		}
		
		return "notice/noticeListView";
	}
	
	@RequestMapping("moveNoticeWriteForm.do")
	public String moveNoticeWriteForm() {
		
		return "notice/noticeWriteForm";
	}
	
	@RequestMapping("noticeDetail.do")
	public ModelAndView selectNoticeDetail(
			@RequestParam("notice_no") int notice_no,
			ModelAndView mav, HttpSession session) {
		
		Notice notice = noticeService.selectNoticeDetail(notice_no);
		
		String nString = notice.getNotice_content();
		String brString = nString.replace("\n", "<br>");
		notice.setNotice_content(brString);
		
		noticeService.updateReadCount(notice_no);
		
		if (notice != null) {
			mav.addObject("notice", notice);
			
			Teacher teacher = (Teacher)session.getAttribute("teacher");
			
			if (teacher != null && teacher.getGrade().equals("A")) {
				mav.setViewName("notice/noticeDetailView");
			} else {
				mav.setViewName("notice/noticeDetailView");
			}
		}
		return mav;
	}
	
	@RequestMapping("insertNotice.do")
	public String insertNoticeMethod(Notice notice, Model model,
			HttpServletRequest request) {
		
		noticeService.insertNotice(notice);
		
		return "redirect:moveNoticeList.do";
	}
	
	@RequestMapping("updateNotice.do")
	public String updateNoticeMethod(Notice notice, Model model,
			HttpServletRequest request) {
		
	    String updatedContent = "(수정) ";

	    String originContent = notice.getNotice_title();

	    if (originContent.startsWith("(수")) {
	        originContent = originContent.substring(5);
	        updatedContent = "(재수정) ";
	    }

	    updatedContent += originContent;

	    notice.setNotice_title(updatedContent);

	    noticeService.updateNotice(notice);

	    return "redirect:moveNoticeList.do";
	}
	
	@RequestMapping("noticeUpdateForm.do")
	public String updateNoticeMethod(Model model,
			@RequestParam("notice_no") int notice_no) {
		
		Notice notice = noticeService.selectNoticeDetail(notice_no);
		
		model.addAttribute("notice", notice);
		
		return "notice/noticeUpdateForm";
	}
	
	public String deleteNoticeMethod() {
		return null;
	}
	
	@RequestMapping(value="new5notice.do", method=RequestMethod.POST)
	@ResponseBody
	public String noticeNewTop3Method() throws UnsupportedEncodingException {

		ArrayList<Notice> list = noticeService.selectNew5Notice();
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Notice notice : list) {
			JSONObject job = new JSONObject();
			
			job.put("notice_no", notice.getNotice_no());
			job.put("notice_title", URLEncoder.encode(notice.getNotice_title(), "UTF-8"));
			job.put("notice_date", notice.getNotice_date().toString());
			jarr.add(job);
		}

		sendJson.put("nlist", jarr);

		return sendJson.toJSONString();
	}

}
