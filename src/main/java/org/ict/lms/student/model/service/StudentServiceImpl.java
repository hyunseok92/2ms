package org.ict.lms.student.model.service;

import java.util.ArrayList;

import org.ict.lms.common.Paging;
import org.ict.lms.common.Search;
import org.ict.lms.student.model.dao.StudentDao;
import org.ict.lms.student.model.vo.Student;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("studentService")
public class StudentServiceImpl implements StudentService{
	
	private static final Logger logger = LoggerFactory.getLogger(StudentServiceImpl.class);

	@Autowired
	private StudentDao studentDao;
	
	@Override
	public Student selectStudent(String Id) {
		return studentDao.selectStudent(Id);
	}
	
	@Override
	public Student selectStudent2(Student student) {
		return studentDao.selectStudent2(student);
	}
	
	@Override
	public int selectCountStudent(String Id) {
		return studentDao.selectCountStudent(Id);
	}
	
//	@Override
//	public ArrayList<Student> selectStudentList() {
//		return studentDao.selectStudentList();
//	}
//	
	@Override
	public int insertStudent(Student student) {
		return studentDao.insertStudent(student);
	}
	
	@Override
	public int updateStudent(Student student) {
		int result= studentDao.updateStudent(student);
		return result;
	}
	
	@Override
	public int updateStudent2(Student student) {
		int result= studentDao.updateStudent2(student);
		return result;
	}


	@Override
	public int deleteStudent(String Id) {
		return studentDao.deleteStudent(Id);
	} 
	
	@Override
	public ArrayList<Student> selectStudentList(Paging paging) {
		return studentDao.selectStudentList(paging);
	}
	
	@Override
	public ArrayList<Student> selectStudentList(String classcode) {
		return studentDao.selectStudentList(classcode);
	}

	@Override
	public int selectStudentListCount() {
		return studentDao.selectStudentListCount();
	}
	
	@Override
	public int searchStudentListCount(Search search) {
		return studentDao.searchStudentListCount(search);
	}

	@Override
	public ArrayList<Student> selectStudentList(Search search) {
		return studentDao.selectStudentList(search);
	}

	@Override
	public Student searchStudent(Student student) {
		return studentDao.searchStudent(student);
	}

	@Override
	public int updateStudentStatus(Student student) {
		return studentDao.updateStudentStatus(student);
	}

}
