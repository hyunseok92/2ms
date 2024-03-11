package org.ict.lms.formdata.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.ict.lms.common.FileNameChange;

import org.ict.lms.formdata.model.service.FormDataService;
import org.ict.lms.formdata.model.vo.FormData;
import org.ict.lms.notice.model.vo.Notice;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class FormDataController {

	@Autowired
	private FormDataService formDataService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("formlist.do")
	public String formList(Model model) {
		ArrayList<FormData>list = formDataService.selectFormDataList();
		model.addAttribute("list", list);
		return "form/formList";
	}
	
	@RequestMapping("formwrite.do")
	public String formWrite() {		
		return "form/formWrite";
	}
	
	@RequestMapping(value = "forminsert.do", method = RequestMethod.POST)
	public String insertFormData(FormData formData, Model model, HttpServletRequest request,
	        @RequestParam("formFile") MultipartFile formFile) {
	    String savePath = request.getSession().getServletContext().getRealPath("resources/form");
	    if (!formFile.isEmpty()) {
	        // 전송온 파일이름 추출함
	        String fileName = formFile.getOriginalFilename();
	        String renameFileName = null;

	        // 저장폴더에는 변경된 이름을 저장 처리함
	        // 파일 이름 바꾸기함: 년월일시분초.확장자
	        if (fileName != null && fileName.length() > 0) {
	            renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
	            logger.info("첨부파일명 확인: " + fileName + ", " + renameFileName);
	            // 바꿀 파일명에 대한 문자열 만들기
	            try {
	                // 저장 폴더에 파일명 바꾸기 처리
	                formFile.transferTo(new File(savePath + "\\" + renameFileName));

	            } catch (Exception e) {
	                e.printStackTrace();
	                model.addAttribute("message", "첨부파일 저장 실패!");
	                return "common/error";
	            }
	        } // 파일명 바꾸기
	        // board 객체에 첨부파일 정보 저장 처리
	        formData.setOriginalfilename(fileName);
	        formData.setRenamefilename(renameFileName);
	        // 첨부파일 있을 때
	    }
	    if (formDataService.insertFormData(formData) > 0) {
	        return "redirect:formlist.do";
	    } else {
	        model.addAttribute("message", "서식게시글 등록 실패!");
	        return "common/error";
	    }
	}
	
	@RequestMapping("formdetail.do")
	public String formDetail(Model model, 
			@RequestParam("form_no") String form_no,
		@RequestParam(value = "readcount", required = false) Integer readcount) {		
		FormData formData = new FormData();
		if(readcount != null) {
		formData.setReadcount((readcount+1));
		formData.setForm_no(form_no);
		formDataService.updateFormReadcount(formData);		
		}
		
		formData = formDataService.selectFormData(form_no);
		
		model.addAttribute("FormData", formData);
		return "form/formDetail";
	}
	

	@RequestMapping(value="new5form.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectNew5Form() throws UnsupportedEncodingException {

		ArrayList<FormData> list = formDataService.selectNew5Form();
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(FormData formData : list) {
			JSONObject job = new JSONObject();
			
			job.put("form_no", formData.getForm_no());
			job.put("form_title", URLEncoder.encode(formData.getForm_title(), "UTF-8"));
			job.put("form_date", formData.getForm_date().toString());
			jarr.add(job);
		}

		sendJson.put("flist", jarr);

		return sendJson.toJSONString();
	}
	

	@RequestMapping("formdown.do")
	public ModelAndView downloadForm(
			ModelAndView mv, HttpServletRequest request, 
			@RequestParam("ofile") String originalFileName,
			@RequestParam("rfile") String renameFileName) {
		//파일 다운 메소드는 리턴 타입이 ModelAndView 로 정해져 있음
		
		//게시글 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath(
				"resources/form");
		
		//저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
		File renameFile = new File(savePath + "\\" + renameFileName);
		//파일 다운시 브라우저 내보낼 원래 파일이름에 대한 파일 객체 생성함
		File originFile = new File(originalFileName);
		
		//파일 다운로드용 뷰로 전달할 정보 저장 처리
		mv.setViewName("filedown");   //등록된 파일다운로드용 뷰클래스의 id명
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);
		
		return mv;
	}
	
	@RequestMapping("formup.do")
	public String formUpdate(	Model model, 
		@RequestParam("form_no") String form_no) {		
		FormData formData = formDataService.selectFormData(form_no);
		
		model.addAttribute("FormData", formData);
		return "form/formUpdate";
	}
	
	@RequestMapping(value = "formupdate.do", method = RequestMethod.POST)
	public String updateFormData(FormData formData, Model model, HttpServletRequest request,
			@RequestParam(value = "formFile", required = false) MultipartFile formFile) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/form");
		if (!formFile.isEmpty()) {
			// 기존 파일정보 제거
			new File(savePath + "\\" + formData.getRenamefilename()).delete();
			formData.setOriginalfilename(null);
			formData.setRenamefilename(null);
			
			// 전송온 파일이름 추출함
			String fileName = formFile.getOriginalFilename();
			String renameFileName = null;

			// 저장폴더에는 변경된 이름을 저장 처리함
			// 파일 이름 바꾸기함: 년월일시분초.확장자
			if (fileName != null && fileName.length() > 0) {
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부파일명 확인: " + fileName + ", " + renameFileName);
				// 바꿀 파일명에 대한 문자열 만들기
				try {
					// 저장 폴더에 파일명 바꾸기 처리
					formFile.transferTo(new File(savePath + "\\" + renameFileName));

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일 저장 실패!");
					return "common/error";
				}
			} // 파일명 바꾸기
				// board 객체에 첨부파일 정보 저장 처리
			formData.setOriginalfilename(fileName);
			formData.setRenamefilename(renameFileName);
			// 첨부파일 있을 때
		}
		if (formDataService.updateFormData(formData) > 0) {
			return "redirect:formdetail.do?form_no=" + formData.getForm_no();
		} else {
			model.addAttribute("message", "서식게시글 수정 실패!");
			return "common/error";
		}
	}
	@RequestMapping("formdelete.do")
	public String deleteFormData(Model model,
			@RequestParam("form_no") String form_no) {	
		
		if (formDataService.deleteFormData(form_no) > 0) {
			return "redirect:formlist.do";
		} else {
			model.addAttribute("message", "서식게시글 삭제 실패!");
			return "common/error";
		}
	}

}

