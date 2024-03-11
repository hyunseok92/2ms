package org.ict.lms.student.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.student.model.vo.Student;

public interface StudentService {
	public Student selectStudent(String Id);

	public Student selectStudent2(Student student);
	
	public Student searchStudent(Student student);

	public ArrayList<Student> selectStudentList(Search search);

	public ArrayList<Student> selectStudentList(String classcode);

	public ArrayList<Student> selectStudentList(Paging paging);

	public int selectCountStudent(String Id);

//	public ArrayList<Student> selectStudentList();

	public int insertStudent(Student student);

	public int updateStudent(Student student);
	
	public int updateStudent2(Student student);
	
	public int updateStudentStatus(Student student);

	public int deleteStudent(String Id);

	public int searchStudentListCount(Search search);

	public int selectStudentListCount();
	
//	//이메일발송
//	public void sendEmail(Student student, String div) throws Exception;
//
//	//비밀번호찾기
//	public void findPw(HttpServletResponse resp, Student student) throws Exception;
//

}
