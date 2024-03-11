package org.ict.lms.enroll.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ict.lms.article.model.service.ArticleService;
import org.ict.lms.article.model.vo.Article;
import org.ict.lms.common.FileNameChange;
import org.ict.lms.student.model.service.StudentService;
import org.ict.lms.student.model.vo.Student;
import org.ict.lms.tTest.model.service.TTestService;
import org.ict.lms.tTest.model.vo.TTest;
import org.ict.lms.teacher.model.service.TeacherService;
import org.ict.lms.teacher.model.vo.Teacher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EnrollController {

   private static final Logger logger = LoggerFactory.getLogger(EnrollController.class);

   @Autowired
   private TeacherService teacherService;

   @Autowired
   private StudentService studentService;

   @Autowired
   private ArticleService articleService;

   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;

   @Autowired
   private TTestService tts;

   // 웹 서비스 요청 하나당 메소드 하나씩 작성하는 방식임 *****

   // ----------------------------------뷰 페이지 내보내기용 메소드
   // ----------------------------------------
   // 로그인
   @RequestMapping(value = "loginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String moveLoginPage(HttpSession session, SessionStatus status) {
      return "teacher/enrollPage";
   }

   // 회원가입 페이지 내보내기용(훈련생)
   @RequestMapping("senrollPage.do")
   public String moveEnrollPage(Model model) {
      ArrayList<TTest> tlist = tts.selectClassMethod1();
      model.addAttribute("tlist", tlist);
      return "student/studentEnroll/studentEnrollPage";
   }

   // 회원가입 페이지 내보내기용(교사)
   @RequestMapping("tenrollPage.do")
   public String moveEnrollPage2(Model model) {
      return "admin_teacher/teacher/teacherEnroll/teacherEnrollPage";
   }

   // 내정보 페이지 내보내기용
   @RequestMapping("sMyinfo.do")
   public String moveMyInfoPage() {

      return "student/studentMyinfo/studentMyPage";
   }

   // 내정보 페이지 내보내기용
   @RequestMapping("tMyinfo.do")
   public String moveMyInfoPage2() {
      return "admin_teacher/teacher/teacherMyinfo/teacherMyPage";
   }

   // 내정보 수정페이지 가기
   @RequestMapping("moveup.do")
   public ModelAndView moveUpdatePage(@RequestParam("id") String id, ModelAndView mv) {
      Teacher teacher = teacherService.selectTeacher2(id);

      if (teacher != null) {
         mv.addObject("teacher", teacher);
         mv.setViewName("admin_teacher/teacher/teacherMyinfo/teacherUpdatePage");
      } else {
         Student student = studentService.selectStudent(id);
         mv.addObject("student", student);
         mv.setViewName("student/studentMyinfo/studentUpdatePage");
      }

      return mv;
   }

   // 훈련생 아이디 찾기용
   @RequestMapping("ssearchPage.do")
   public String movessearchPage(Model model) {
      return "student/studentFind/studentIdFind";
   }

   // 훈련생 비밀번호 찾기용
   @RequestMapping(value = "ssearchPage1.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String movessearchPage1(Model model, HttpSession session, SessionStatus status) {
      return "student/studentFind/studentPwdFind";
   }

   // 훈련생 새로운비밀번호
   @RequestMapping("ssearchPage2.do")

   public String movessearchPage2(Model model, @RequestParam(name="id") String id) {
	   model.addAttribute("id",id);
      return "student/studentFind/studentUpdatePwd";
   }

   // 교사 아이디 찾기용
   @RequestMapping("tsearchPage.do")
   public String movetsearchPage(Model model) {
      return "admin_teacher/teacher/teacherFind/teacherIdFind";
   }

   // 교사 비밀번호 찾기용
   @RequestMapping(value = "tsearchPage1.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String movetsearchPage1(Model model, HttpSession session, SessionStatus status) {
      return "admin_teacher/teacher/teacherFind/teacherPwdFind";
   }

   // 교사 새로운비밀번호
   @RequestMapping("tsearchPage2.do")
   public String movetsearchPage2(Model model) {
      return "admin_teacher/teacher/teacherFind/teacherUpdatePwd";
   }

   // ------------------------------------------회원가입--------------------------------------------------------

   // 학생
   // 회원 가입 요청 처리용 메소드
   @RequestMapping(value = "sEnroll.do", method = RequestMethod.POST)
   public String studentInsertMethod(Student student, @RequestParam("class_code") String class_code, Model model) {
      logger.info("enroll.do" + student);
      // 패스워드 암호화 처리
      student.setPwd(bcryptPasswordEncoder.encode(student.getPwd()));
      logger.info("after encode : " + student.getPwd());
      logger.info("length : " + student.getPwd().length());
      student.setClass_Code(class_code);

      if (studentService.insertStudent(student) > 0) {
         return "admin_teacher/admin_main";
      } else {
         model.addAttribute("message", "회원 가입 실패!");
         return "common/error";
      }
   }

   // 교사
   // 회원 가입 요청 처리용 메소드
   @RequestMapping(value = "tEnroll.do", method = RequestMethod.POST)
   public String teacherInsertMethod(Teacher teacher, Model model, HttpServletRequest request,
         @RequestParam(name = "photo1", required = false) MultipartFile photoFile,
         @RequestParam(name = "cv1", required = false) MultipartFile cvFile,
         @RequestParam(name = "certificate1", required = false) MultipartFile certificateFile,
         @RequestParam(name = "signAture_Img1", required = false) MultipartFile signAtureImgFile) {

      // 사진
      // 게시글 첨부파일 저장 폴더 경로 지정
      String savePath = request.getSession().getServletContext().getRealPath("resources/photo");

      if (!photoFile.isEmpty()) {
         // 전송온 파일이름 추출함
         String fileName = photoFile.getOriginalFilename();
         String renameFileName = null;

         // 저장폴더에는 변경된 이름을 저장 처리함
         // 파일 이름바꾸기함 : 년월일시분초.확장자
         if (fileName != null && fileName.length() > 0) {
            renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
            logger.info("첨부파일명 확인 : " + fileName + ", " + renameFileName);
            // 바꿀 파일명에 대한 문자열 만들기
            try {
               // 저장 폴더에 파일명 바꾸기 처리
               photoFile.transferTo(new File(savePath + "\\" + renameFileName));

            } catch (Exception e) {
               e.printStackTrace();
               model.addAttribute("message", "첨부파일 저장 실패!");
               return "common/error";
            }
         } // 파일명 바꾸기
            // board 객체에 첨부파일 정보 저장 처리
         teacher.setPhoto(renameFileName);
         // 첨부파일 있을 때

         // 이력서
         // 게시글 첨부파일 저장 폴더 경로 지정
         String savePath1 = request.getSession().getServletContext().getRealPath("resources/cv");

//          
         // 전송온 파일이름 추출함
         String fileName1 = cvFile.getOriginalFilename();
         String renameFileName1 = null;

         // 저장폴더에는 변경된 이름을 저장 처리함
         // 파일 이름바꾸기함 : 년월일시분초.확장자
         if (fileName1 != null && fileName1.length() > 0) {
            renameFileName1 = FileNameChange.change(fileName1, "yyyyMMddHHmmss");
            logger.info("첨부파일명 확인 : " + fileName1 + ", " + renameFileName1);
            // 바꿀 파일명에 대한 문자열 만들기
            try {
               // 저장 폴더에 파일명 바꾸기 처리
               cvFile.transferTo(new File(savePath1 + "\\" + renameFileName1));

            } catch (Exception e) {
               e.printStackTrace();
               model.addAttribute("message", "첨부파일 저장 실패!");
               return "common/error";
            }
         } // 파일명 바꾸기
            // board 객체에 첨부파일 정보 저장 처리
         teacher.setCv(renameFileName1);
         // 첨부파일 있을 때

         // 자격증
         // 게시글 첨부파일 저장 폴더 경로 지정
         String savePath2 = request.getSession().getServletContext().getRealPath("resources/certificate");

//        
         // 전송온 파일이름 추출함
         String fileName2 = certificateFile.getOriginalFilename();
         String renameFileName2 = null;

         // 저장폴더에는 변경된 이름을 저장 처리함
         // 파일 이름바꾸기함 : 년월일시분초.확장자
         if (fileName2 != null && fileName2.length() > 0) {
            renameFileName2 = FileNameChange.change(fileName2, "yyyyMMddHHmmss");
            logger.info("첨부파일명 확인 : " + fileName2 + ", " + renameFileName2);
            // 바꿀 파일명에 대한 문자열 만들기
            try {
               // 저장 폴더에 파일명 바꾸기 처리
               certificateFile.transferTo(new File(savePath2 + "\\" + renameFileName2));

            } catch (Exception e) {
               e.printStackTrace();
               model.addAttribute("message", "첨부파일 저장 실패!");
               return "common/error";
            }
         } // 파일명 바꾸기
            // board 객체에 첨부파일 정보 저장 처리
         teacher.setCertificate(renameFileName2);
         // 첨부파일 있을 때

         // 서명이미지
         // 게시글 첨부파일 저장 폴더 경로 지정
         String savePath3 = request.getSession().getServletContext().getRealPath("resources/signAtureimg");

         // 전송온 파일이름 추출함
         String fileName3 = signAtureImgFile.getOriginalFilename();
         String renameFileName3 = null;

         // 저장폴더에는 변경된 이름을 저장 처리함
         // 파일 이름바꾸기함 : 년월일시분초.확장자
         if (fileName3 != null && fileName3.length() > 0) {
            renameFileName3 = FileNameChange.change(fileName3, "yyyyMMddHHmmss");
            logger.info("첨부파일명 확인 : " + fileName3 + ", " + renameFileName3);
            // 바꿀 파일명에 대한 문자열 만들기
            try {
               // 저장 폴더에 파일명 바꾸기 처리
               signAtureImgFile.transferTo(new File(savePath3 + "\\" + renameFileName3));

            } catch (Exception e) {
               e.printStackTrace();
               model.addAttribute("message", "첨부파일 저장 실패!");
               return "common/error";
            }
         }
         teacher.setSignAture_Img(renameFileName3);
         // 첨부파일 있을 때

      }

      logger.info("tEnroll.do" + teacher);
      // 패스워드 암호화 처리

      teacher.setPwd(bcryptPasswordEncoder.encode(teacher.getPwd()));
      logger.info("after encode : " + teacher.getPwd());
      logger.info("length : " + teacher.getPwd().length());

      if (teacherService.insertTeacher(teacher) > 0) {
         logger.info("여기오는데 왜그러지");
         return "redirect:atmain.do";
      } else {
         model.addAttribute("message", "회원 가입 실패!");
         return "common/error";
      }

   }

   // ------------------------------------------로그인--------------------------------------------------------
   // 로그인 처리용 메소드 : command 객체 사용
   // 서버로 전송온 parameter 값을 저장하는 객체를 command 객체라고 함
   // input 태그의 name 과 vo 객체의 필드명이 같으면 됨
   @RequestMapping(value = "login.do", method = RequestMethod.POST)
   public String loginMethod(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session,
         SessionStatus status, Model model) {
      

      // 암호화 처리된 패스워드 일치 조회는 select 해온 값으로 비교함
      // 전달 온 회원 아이디로 먼저 회원 정보를 조회해 옴
      logger.info(String.valueOf(teacherService.selectCountTeacher(id)));
      // 1. 아이디가 있을때
      if (teacherService.selectCountTeacher(id) > 0) {
         // 2. 아이디 정보에 대한 값을 가져옴
         Teacher teacher1 = teacherService.selectTeacher2(id);

         // 3. 비밀번호 비교
         if (teacher1 != null && this.bcryptPasswordEncoder.matches(pwd, teacher1.getPwd())) {
            // 4. 성공시
            session.setAttribute("teacher", teacher1);
            status.setComplete(); // 로그인 요청 성공, 200 전송함


            return "redirect:atmain.do";
         } else {
            // 5. 실패시
            return "common/main";
         }

      }
      // 2. 선생아이디가 없을때
      else {
         // 학생 아이디가 있을때
         if (studentService.selectCountStudent(id) > 0) {
            Student student1 = studentService.selectStudent(id);
            if (student1 != null && this.bcryptPasswordEncoder.matches(pwd, student1.getPwd())) {
               // 4. 성공시
               session.setAttribute("student", student1);
               status.setComplete(); // 로그인 요청 성공, 200 전송함

               return "redirect:studentMain.do";
            } else {
               return "common/main";
            }

         } else {
            // 실패시
            return "common/main";
         }
      }

   }

   // ------------------------------------------로그아웃--------------------------------------------------------

   // 로그아웃 처리용 메소드
   // 전송방식이 get 이면, method 속성 생략 가능함, method 속성 생략시 value 속성도 표기 생략함
   @RequestMapping("logout.do")
   public String logoutMethod(HttpServletRequest request, Model model) {
      HttpSession session = request.getSession(false);

      session.invalidate();
      return "common/main";

   }

   // -------------------------------------------------내정보보기
   // 페이지가기----------------------------------------------
   // 내정보보기 페이지 요청처리용
   @RequestMapping("myinfo.do")
   public String DetailMethod(@RequestParam("id") String id, Model model) {
      // 서비스 메소드로 아이디 전달하고, 해당 회원정보 받기
      Teacher teacher = new Teacher();
      Student student = new Student();

      teacher = teacherService.selectTeacher2(id);

      if (teacher != null) {
         model.addAttribute("teacher", teacher);
         return "teacher/myInfoPage";
      } else {

         student = studentService.selectStudent(id);
         model.addAttribute("student", student);
         return "student/myInfoPage";
      }
   }

   // ---------------------------------------내정보 수정페이지
   // -----------------------------
   // 수정페이지-----------------------------------------------------------------

   // 교사
   @RequestMapping(value = "tmupdate.do", method = RequestMethod.POST)
   public String teacherUpdateMethod(Teacher teacher, Model model, HttpServletRequest request, HttpSession session,
         @RequestParam(name = "photoFileName", required = false) MultipartFile photoFile) {

      // 새로운 암호가 전송이 왔다면, 패스워드 암호화 처리함
      String userPwd = teacher.getPwd().trim();
      if (userPwd != null && userPwd.length() > 0) {
         // 암호화된 기존의 패스워드와 새로운 패스워드를 비교해서 다른 값이면
         if (!this.bcryptPasswordEncoder.matches(userPwd, teacher.getPwd())) {
            // member 에 새로운 패스워드를 암호화해서 기록함
            teacher.setPwd(this.bcryptPasswordEncoder.encode(userPwd));
         } else {
            // 기존 암호이면, 원래 암호화된 패스워드를 기록함
            teacher.setPwd(teacher.getPwd());

         }
      }

      String savePath = request.getSession().getServletContext().getRealPath("resources/photo");

      if (!photoFile.isEmpty()) {
         // 전송온 파일이름 추출함
         String fileName = photoFile.getOriginalFilename();
         String renameFileName = null;

         // 저장폴더에는 변경된 이름을 저장 처리함
         // 파일 이름바꾸기함 : 년월일시분초.확장자
         if (fileName != null && fileName.length() > 0) {
            renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
            logger.info("첨부파일명 확인 : " + fileName + ", " + renameFileName);
            // 바꿀 파일명에 대한 문자열 만들기
            try {
               // 저장 폴더에 파일명 바꾸기 처리
               photoFile.transferTo(new File(savePath + "\\" + renameFileName));

            } catch (Exception e) {
               e.printStackTrace();
               model.addAttribute("message", "첨부파일 저장 실패!");
               return "common/error";
            }
         } // 파일명 바꾸기
            // board 객체에 첨부파일 정보 저장 처리
         teacher.setPhoto(fileName);
         teacher.setPhoto(renameFileName);

      }

      if (teacherService.updateTeacher(teacher) > 0) {
         // 수정이 성공했다면, 컨트롤러의 다른 메소드를 직접 호출할 수 있음
         // 필요시 값을 전달할 수도 있음 : 쿼리 스트링 사용함

         // 세션 정보에다가
         // photo 예를 바까줘야댐 session.setPhoto("savePath + "\\" + renameFileName")
         return "common/main";
      } else {
         model.addAttribute("message", teacher.getId() + " 회원 정보 수정 실패!");
         return "common/error";
      }
   }

   // 훈련생
   @RequestMapping(value = "smupdate.do", method = RequestMethod.POST)
   public String studentUpdateMethod(Student student, Model model) {

      // 새로운 암호가 전송이 왔다면, 패스워드 암호화 처리함
      String userPwd = student.getPwd().trim();
      if (userPwd != null && userPwd.length() > 0) {
         // 암호화된 기존의 패스워드와 새로운 패스워드를 비교해서 다른 값이면
         if (!this.bcryptPasswordEncoder.matches(userPwd, student.getPwd())) {
            // member 에 새로운 패스워드를 암호화해서 기록함
            student.setPwd(this.bcryptPasswordEncoder.encode(userPwd));
         } else {
            // 기존 암호이면, 원래 암호화된 패스워드를 기록함
            student.setPwd(student.getPwd());
         }
      }
      int result = studentService.updateStudent(student);
      logger.info("result : " + result);

      if (result > 0) {
         // 수정이 성공했다면, 컨트롤러의 다른 메소드를 직접 호출할 수 있음
         // 필요시 값을 전달할 수도 있음 : 쿼리 스트링 사용함
         return "common/main";

      } else {

         model.addAttribute("message", student.getId() + " 회원 정보 수정 실패!");
         return "common/error";
      }
   }

   // 훈련생 아이디 찾기
   @RequestMapping(value = "sfindId.do", method = RequestMethod.POST)
   public String sSearchIdMethod(Student student, Model model) {

      Student student1 = studentService.searchStudent(student);

      if (student1 != null) {
         model.addAttribute("Student", student1);
         return "student/studentFind/studentIdFind";
      } else {
         return "common/main";
      }
   }

   // 훈련생 비밀번호 찾기
   @RequestMapping(value = "sfindPwd.do", method = RequestMethod.POST)
   public String sSearchPwdMethod(Student student, Model model, HttpSession session, SessionStatus status,
         @RequestParam("id") String id, @RequestParam("name") String name,
         @RequestParam("resident_Number") String resident_Number) {

      Student student1 = studentService.selectStudent(id);

      if (student1 != null) {
         session.setAttribute("student", student1);
         status.setComplete(); // 로그인 요청 성공, 200 전송함
         return "student/studentFind/studentUpdatePwd";
      } else {
         model.addAttribute("error", "입력한 정보가 올바르지 않습니다. 다시 확인해주세요.");
         return "common/main";
      }

   }

   // 훈련생 새로운 비밀번호
   // 훈련생
   @RequestMapping(value = "smupdate2.do", method = RequestMethod.POST)

   public String studentUpdateMethod2(Student student, Model model) {


	  logger.info(student.toString());
	   
      // 새로운 암호가 전송이 왔다면, 패스워드 암호화 처리함
      String userPwd = student.getPwd().trim();
      if (userPwd != null && userPwd.length() > 0) {
         // 암호화된 기존의 패스워드와 새로운 패스워드를 비교해서 다른 값이면
         if (!this.bcryptPasswordEncoder.matches(userPwd, student.getPwd())) {
            // member 에 새로운 패스워드를 암호화해서 기록함
            student.setPwd(this.bcryptPasswordEncoder.encode(userPwd));
         } else {
            // 기존 암호이면, 원래 암호화된 패스워드를 기록함
            student.setPwd(student.getPwd());
         }
      }
      int result = studentService.updateStudent2(student);
      logger.info("result : " + result);

      if (result > 0) {
         // 수정이 성공했다면, 컨트롤러의 다른 메소드를 직접 호출할 수 있음
         // 필요시 값을 전달할 수도 있음 : 쿼리 스트링 사용함
         return "common/main";
      } else {

         model.addAttribute("message", student.getId() + " 회원 정보 수정 실패!");
         return "common/error";
      }
   }

   // 교사 아이디 찾기
   @RequestMapping(value = "tfindId.do", method = RequestMethod.POST)
   public String tSearchIdMethod(Teacher teacher, Model model) {

      Teacher teacher1 = teacherService.searchTeacher(teacher);

      if (teacher1 != null) {
         model.addAttribute("Teacher", teacher1);
         return "admin_teacher/teacher/teacherFind/teacherIdFind";
      } else {
         return "common/main";
      }
   }

   // 교사 비밀번호 찾기
   @RequestMapping(value = "tfindPwd.do", method = RequestMethod.POST)
   public String tSearchPwdMethod(Teacher teacher, Model model, @RequestParam("id") String id,
         @RequestParam("name") String name, @RequestParam("resident_Number") String resident_Number,
         HttpSession session, SessionStatus status) {

      Teacher teacher1 = teacherService.searchTeacher(teacher);

      if (teacher1 != null) {
         session.setAttribute("teacher", teacher1);
         status.setComplete();
         return "admin_teacher/teacher/teacherFind/teacherUpdatePwd";
      } else {
         return "common/main";
      }
   }

   // 교사 새로운 비밀번호
   // 교사
   @RequestMapping(value = "tmupdate2.do", method = RequestMethod.POST)
   public String teacherUpdateMethod2(Teacher teacher, Model model) {

	   
      // 새로운 암호가 전송이 왔다면, 패스워드 암호화 처리함
      String userPwd = teacher.getPwd().trim();
      if (userPwd != null && userPwd.length() > 0) {
         // 암호화된 기존의 패스워드와 새로운 패스워드를 비교해서 다른 값이면
         if (!this.bcryptPasswordEncoder.matches(userPwd, teacher.getPwd())) {
            // member 에 새로운 패스워드를 암호화해서 기록함
            teacher.setPwd(this.bcryptPasswordEncoder.encode(userPwd));
         } else {
            // 기존 암호이면, 원래 암호화된 패스워드를 기록함
            teacher.setPwd(teacher.getPwd());
         }
      }
      int result = teacherService.updateTeacher2(teacher);

      if (result > 0) {
         // 수정이 성공했다면, 컨트롤러의 다른 메소드를 직접 호출할 수 있음
         // 필요시 값을 전달할 수도 있음 : 쿼리 스트링 사용함
         return "common/main";
      } else {

         model.addAttribute("message", teacher.getId() + " 회원 정보 수정 실패!");
         return "common/error";
      }
   }
}